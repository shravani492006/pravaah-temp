from django.shortcuts import render, redirect
from django.db import connection
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from pravaah.accounts.decorators import trainer_required
from .models import Participant, Attendance
from django.utils import timezone


@login_required
@trainer_required
def students_list(request):
    """List students fetched from the unmanaged Participant model.
    If ?batch_id=<id> is provided, filter by batch_id; otherwise show recent 200 entries.
    """
    batch_id = request.GET.get('batch_id')
    participants = []
    try:
        if batch_id:
            qs = Participant.objects.filter(batch_id=batch_id)
        else:
            qs = Participant.objects.all()[:200]
        participants = list(qs.values('id', 'name', 'email', 'mobile', 'batch_id'))
    except Exception:
        # if participants table is missing or schema differs, fall back to raw SQL as last resort
        participants = []
        try:
            with connection.cursor() as cursor:
                if batch_id:
                    cursor.execute("SELECT id, name, email, mobile, batch_id FROM participants WHERE batch_id = %s", [batch_id])
                else:
                    cursor.execute("SELECT id, name, email, mobile, batch_id FROM participants LIMIT 200")
                cols = [c[0] for c in cursor.description] if cursor.description else []
                for row in cursor.fetchall():
                    participants.append(dict(zip(cols, row)))
        except Exception:
            participants = []

    return render(request, 'trainers/students_list.html', {
        'participants': participants,
        'batch_id': batch_id,
    })


@login_required
@trainer_required
def attendance(request, batch_id=None):
    """Attendance UI. Persists attendance to Attendance model.
    Creates Attendance records for checked students."
    participants = []
    try:
        participants = list(Participant.objects.filter(batch_id=batch_id).values('id', 'name', 'email', 'mobile'))
    except Exception:
        # fallback to raw SQL
        participants = []
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT id, name, email, mobile FROM participants WHERE batch_id = %s", [batch_id])
                cols = [c[0] for c in cursor.description] if cursor.description else []
                for row in cursor.fetchall():
                    participants.append(dict(zip(cols, row)))
        except Exception:
            participants = []

    if request.method == 'POST':
        present_ids = [int(k.split('_')[1]) for k in request.POST.keys() if k.startswith('present_')]
        session_date = request.POST.get('session_date')
        if not session_date:
            session_date = timezone.now().date()
        saved = 0
        for pid in present_ids:
            try:
                Attendance.objects.create(participant_id=pid, batch_id=batch_id, session_date=session_date, status='Present', marked_by=request.user)
                saved += 1
            except Exception:
                # swallow per-row errors
                continue

        messages.success(request, f'Attendance recorded for {saved} students.')
        return redirect('trainers:students')

    return render(request, 'trainers/attendance.html', {
        'participants': participants,
        'batch_id': batch_id,
    })

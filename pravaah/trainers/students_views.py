from django.shortcuts import render, redirect
from django.db import connection
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from pravaah.accounts.decorators import trainer_required


@login_required
@trainer_required
def students_list(request):
    """List students fetched from the raw 'participants' table.
    If ?batch_id=<id> is provided, filter by batch_id; otherwise show recent 200 entries.
    """
    batch_id = request.GET.get('batch_id')
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
        # if participants table is missing or schema differs, fall back to empty list
        participants = []

    return render(request, 'trainers/students_list.html', {
        'participants': participants,
        'batch_id': batch_id,
    })


@login_required
@trainer_required
def attendance(request, batch_id=None):
    """Simple attendance UI. Reads participants for the batch and accepts POST to "save" attendance.
    Note: this implementation does not persist attendance to DB (no attendance table present) — it reports back to user.
    """
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
        # collect attendance selections
        present_ids = [int(k.split('_')[1]) for k in request.POST.keys() if k.startswith('present_')]
        # In a future iteration persist to an attendance table; for now show a message and redirect
        messages.success(request, f'Attendance recorded for {len(present_ids)} students (not persisted).')
        return redirect('trainers:students')

    return render(request, 'trainers/attendance.html', {
        'participants': participants,
        'batch_id': batch_id,
    })

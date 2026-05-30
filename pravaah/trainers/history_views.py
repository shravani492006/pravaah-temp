from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.db.models import Count, Q
from django.utils.dateparse import parse_date
from .models import Attendance, Participant
from pravaah.accounts.decorators import trainer_required


@login_required
@trainer_required
def attendance_history(request, batch_id):
    """Show attendance sessions summary for a batch and optional session detail when ?session_date=YYYY-MM-DD provided."""
    session_date_str = request.GET.get('session_date')

    # aggregate sessions with counts
    sessions = Attendance.objects.filter(batch_id=batch_id).values('session_date').annotate(
        present=Count('id', filter=Q(status='Present')),
        absent=Count('id', filter=Q(status='Absent')),
        late=Count('id', filter=Q(status='Late')),
        total=Count('id')
    ).order_by('-session_date')

    session_rows = None
    participants_map = {}
    if session_date_str:
        sd = parse_date(session_date_str)
        if sd:
            session_rows = list(Attendance.objects.filter(batch_id=batch_id, session_date=sd).order_by('-marked_at'))
            # fetch participant names for display via unmanaged Participant model
            pids = [r.participant_id for r in session_rows]
            if pids:
                qs = Participant.objects.filter(id__in=pids).values('id', 'name')
                participants_map = {p['id']: p['name'] for p in qs}

    return render(request, 'trainers/attendance_history.html', {
        'batch_id': batch_id,
        'sessions': sessions,
        'session_rows': session_rows,
        'participants_map': participants_map,
        'selected_date': session_date_str,
    })

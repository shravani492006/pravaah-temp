from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('pravaah.pravaah.dashboard.urls')),
    path('accounts/', include('pravaah.pravaah.accounts.urls')),
    path('trainers/', include('pravaah.pravaah.trainers.urls')),
    path('skills/', include('pravaah.pravaah.skills.urls')),
    path('certifications/', include('pravaah.pravaah.certifications.urls')),
    path('reports/', include('pravaah.pravaah.reports.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

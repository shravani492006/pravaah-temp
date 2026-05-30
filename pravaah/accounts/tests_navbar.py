from django.test import TestCase, RequestFactory
from django.template.loader import render_to_string
from django.contrib.auth.models import AnonymousUser, User

class NavbarTemplateTests(SimpleTestCase):
    def setUp(self):
        self.factory = RequestFactory()
        # ensure a real user exists to render authenticated navbar
        existing = User.objects.filter(username='tester').first()
        if existing:
            self.user = existing
        else:
            self.user = User.objects.create_user(username='tester', password='pass')

    def test_navbar_renders_for_anonymous(self):
        request = self.factory.get('/')
        request.user = AnonymousUser()
        html = render_to_string('navbar.html', request=request)
        self.assertIn('PRAVAAH', html)
        self.assertIn('Sign in', html)

    def test_navbar_renders_for_authenticated(self):
        request = self.factory.get('/')
        request.user = self.user
        html = render_to_string('navbar.html', request=request)
        self.assertIn('Notifications', html)
        self.assertIn('Logout', html)

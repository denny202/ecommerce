from django.forms import ModelForm, PasswordInput, CharField
from django.contrib.auth.models import User


class SignupForm(ModelForm):
    password = CharField(max_length=100, widget=PasswordInput())

    class Meta:
        model = User
        fields = ['username', 'email']
        
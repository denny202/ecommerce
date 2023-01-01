from django.shortcuts import render, redirect
from django.views import View
from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import login
from main.forms import SignupForm
from main.models import Product, Cart

# Create your views here.
class HomeView(View):
    def get(self, request):
        if request.user.is_authenticated:
            try:
                cart = Cart.objects.get(user=request.user)
            except Cart.DoesNotExist:
                cart = Cart.objects.create(user=request.user)
                cart.save()
        else:
            cart = None

        return render(request, 'home.html', context={'products': Product.objects.all(), 'cart': cart})


class SignupView(View):
    def get(self, request):
        form = SignupForm()
        return render(request, 'registration/signup.html', context={'form': form})

    def post(self, request):
        form = SignupForm(request.POST)
        user = form.save()
        password = form.cleaned_data['password']
        user.set_password(password)
        user.save()

        cart = Cart.objects.create(user=user)
        cart.save()

        login(request, user)
        return redirect('home')


class ProfileView(LoginRequiredMixin, View):
    def get(self, request):
        print(request.user)
        cart = Cart.objects.get(user=request.user)
        return render(request, 'profile.html', context={'cart': cart})


class ShoppingCartView(LoginRequiredMixin, View):
    action = None

    def get(self, request, product_id = None):
        if self.action == 'add':
            product = Product.objects.get(pk=product_id)
            cart = Cart.objects.get(user=request.user)
            cart.products.add(product)
            return redirect('home')

        elif self.action == 'remove':
            product = Product.objects.get(pk=product_id)
            cart = Cart.objects.get(user=request.user)
            cart.products.remove(product)
            return redirect('home')

        else:
            return render(request, 'cart.html')

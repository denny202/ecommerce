from django.urls import path, include
from django.contrib.auth.decorators import login_required
from django.views.generic.base import TemplateView
from main.views import SignupView, HomeView, ShoppingCartView, ProfileView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('accounts/', include('django.contrib.auth.urls')),
    path('', HomeView.as_view(), name='home'),
    path('signup', SignupView.as_view(), name='signup'),
    path('add-to-cart/<product_id>', ShoppingCartView.as_view(action='add'), name='add-to-cart'),
    path('remove-from-cart/<product_id>', ShoppingCartView.as_view(action='remove'), name='remove-from-cart'),
    path('cart', ShoppingCartView.as_view(), name='cart'),
    path('profile', ProfileView.as_view(), name='profile')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

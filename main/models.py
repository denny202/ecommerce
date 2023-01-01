from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Product(models.Model):
    name = models.CharField(max_length=250)
    price = models.FloatField(default=1.0)
    description = models.TextField()
    image = models.ImageField(upload_to='product-images')
    
    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return f'<Product: {self.name}>'


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    products = models.ManyToManyField(Product, blank=True)

    def __str__(self) -> str:
        return self.user.username

    def __repr__(self) -> str:
        return f'<Cart: {self.user.username}>'

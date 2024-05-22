from django.http import HttpRequest
from django.shortcuts import render, redirect
from .models import Person


def index(request: HttpRequest):
    if request.method == "POST":
        name = request.POST.get("name")
        email = request.POST.get("email")
        description = request.POST.get("description")

        Person.objects.create(name=name, email=email, description=description)

        return redirect("index")
    return render(request, "myapp/index.html")

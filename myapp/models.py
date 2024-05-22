from django.db import models


class Person(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField()
    description = models.TextField()

    def __str__(self) -> str:
        return self.name

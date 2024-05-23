#!/bin/sh

set -e

python3 manage.py migrate --no-input

python3 manage.py collectstatic --no-input

# python3 manage.py runserver 0.0.0.0:9000

gunicorn -b 0.0.0.0:9000 autoDeploy.wsgi --timeout 200 --workers=5

FROM python:3.10

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE project.settings

# Create and set the working directory
RUN mkdir /code
WORKDIR /code

# Copy the current directory contents into the container at /code
COPY . /code/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /code/entrypoint.sh
RUN chmod +x /code/entrypoint.sh
# Copy the entrypoint.sh script and set execute permissions

# Expose the port the application runs on
EXPOSE 9000


# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8090"]

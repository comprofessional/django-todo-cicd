FROM python:3

WORKDIR /data

# Install setuptools and Django
RUN pip install setuptools django==3.2

COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

#CMD ["python","manage.py","runserver","0.0.0.0:8000"]
# Use an environment variable to specify the port to run Django on
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${PORT:-8000}"]

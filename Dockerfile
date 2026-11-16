FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

COPY app/ /app/app

# Create a non-root Linux user
RUN useradd --create-home appuser

# Run CloudStore as this user
USER appuser


CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
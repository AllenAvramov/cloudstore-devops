from fastapi import FastAPI


app = FastAPI()

@app.get("/health")
def health():
    return {"status": "healthy",
            "service": "cloudstore"}

@app.get("/health/live")
def liveness():
    return {"status": "alive"}

@app.get("/health/ready")
def readiness():
    return {"status": "ready"}
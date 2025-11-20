from fastapi import FastAPI
import requests
import time

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/check")
def check_urls(data: list[str]):
    results = []
    for url in data:
        start = time.time()
        try:
            response = requests.get(url, timeout=5)
            elapsed = round((time.time()-start)*1000,2)
            results.append({"url": url, "status": response.status_code, "time_ms": elapsed})
        except Exception as e:
            results.append({"url": url, "error": str(e)})
    return results
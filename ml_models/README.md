
# ✅ TO RUN THE MODEL API:

```bash
uvicorn ml_models.inference_api.fastapi_model_api:app --reload --port 9000
```

You can now POST `.xlsx` data to:
- `http://localhost:9000/model/fraud-detection`
- `http://localhost:9000/model/traffic-density`

with a file form field named `file`.

# ZAP Docker CI — Examples

```bash
docker run --rm -v $(pwd):/zap/wrk/:rw \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-api-scan.py -t https://staging.example/openapi.json -f openapi
```

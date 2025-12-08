# Performance Engineering Baseline (Abstracted)

We don't publish full test scripts. This is a positioning anchor.

Target signals:
- p95/p99 latency tracking as default, not average
- Soak test before go-live, not after
- SLAs define rollback triggers, not gut feeling

Baseline checklist:
- Load test using business peak simulation (not flat TPS)
- Fail DB index review → no launch
- Cache tagging strategy for hot endpoints
- Circuit breaker thresholds defined & documented

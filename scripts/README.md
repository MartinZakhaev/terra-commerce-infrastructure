# Local scripts

Run the serialized full-stack build helper from `apps/infrastructure`:

```bash
sh scripts/build-local.sh
```

The helper sets `COMPOSE_PARALLEL_LIMIT=1`, builds application images one at a time, and starts the stack after all images are available.

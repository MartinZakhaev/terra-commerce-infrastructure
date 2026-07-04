# Terra Commerce Infrastructure

Local and deployment infrastructure for Terra Commerce.

## Local prerequisites

The complete application build is heavier than the final runtime because Medusa and three Nuxt applications install and compile dependencies. Allocate at least 6 GB of memory to the Docker VM for a comfortable first build.

For Colima:

```bash
colima stop
colima start --cpu 4 --memory 6 --disk 40
```

Use Docker Compose v2 through `docker compose`, not the legacy `docker-compose` command.

## Local modes

From this directory, create the local environment file:

```bash
cp .env.example .env
```

Start only PostgreSQL and Redis:

```bash
docker compose up -d
```

Build the application images one at a time to avoid build-time memory spikes:

```bash
COMPOSE_PARALLEL_LIMIT=1 docker compose --profile apps build
```

Then start the complete stack:

```bash
docker compose --profile apps up -d
```

The equivalent Make target is:

```bash
make apps
```

The commerce API and worker reuse one shared local image; they are not built twice.

## Recovering from exit code 137

Exit code 137 during `pnpm install` means the build process was killed after the Docker VM exhausted its available memory.

```bash
docker compose --profile apps down
colima stop
colima start --cpu 4 --memory 6 --disk 40
COMPOSE_PARALLEL_LIMIT=1 docker compose --profile apps build

docker compose --profile apps up -d
```

A missing Buildx warning is separate from the memory failure. The stack can use the legacy builder, but Buildx provides the preferred modern build path.

## Local routes

- `http://platform.localhost` — superadmin
- `http://demo.admin.localhost` — tenant admin
- `http://demo.shop.localhost` — storefront

The production provider baseline is Midtrans, tenant-owned Biteship credentials, Cloudflare R2, Resend, and hosted ZITADEL.

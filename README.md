# Terra Commerce Infrastructure

Local and deployment infrastructure for Terra Commerce.

## Local modes

Start only PostgreSQL and Redis:

```bash
cp .env.example .env
docker compose up -d
```

Build and start the complete application stack from the master repository submodule layout:

```bash
docker compose --profile apps up --build
```

Local routes:

- `http://platform.localhost` — superadmin
- `http://demo.admin.localhost` — tenant admin
- `http://demo.shop.localhost` — storefront

The production provider baseline is Midtrans, tenant-owned Biteship credentials, Cloudflare R2, Resend, and hosted ZITADEL.

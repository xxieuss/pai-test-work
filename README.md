# Invest App

Portfolio tracker for Ukrainian investors that shows real returns
after taxes and inflation: stocks, ETFs, government bonds, deposits and currency.

## Architecture

| Service | Language | Responsibility |
|---|---|---|
| `auth` | C# | Registration, login, sessions |
| `bff` | C# | Single REST API for the frontend |
| `core-api` | C# | Portfolios, transactions, returns and tax calculations |
| `market-data` | Go | Quotes, NBU exchange rates, inflation, bonds |
| `notifications` | Go | Price alerts and push notifications |

Services talk to each other over gRPC (contracts in [`/proto`](proto/))
and publish events through RabbitMQ. More in [`/docs`](docs/).

## Prerequisites

- Docker Desktop (or Docker Engine with Compose v2)
- `make`
- Git

You only need .NET, Go or Node installed if you work on that service outside Docker.

## Quick start

```bash
git clone <repo-url> && cd invest-app
cp infra/.env.example infra/.env
make up
```

That's it. Check that everything is running:

```bash
make ps
```

## Local URLs

| What | URL |
|---|---|
| RabbitMQ management UI | http://localhost:15672 |
| PostgreSQL | `localhost:15432` |
| Redis | `localhost:6379` |

Default credentials are in `infra/.env.example`.

## Useful commands

| Command | What it does |
|---|---|
| `make up` | Start the whole stack |
| `make down` | Stop everything |
| `make logs` | Follow logs of all services |
| `make ps` | Show running containers |

## Repository structure

```
services/   backend services, one folder per service
frontend/   React app
proto/      shared gRPC contracts
infra/      docker-compose and server configs
docs/       architecture, decisions, diagrams
```

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening your first pull request.

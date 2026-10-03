# Contributing

## Branches

Never commit directly to `main`. Create a branch from the latest `main`:

    git checkout main && git pull
    git checkout -b feature/portfolio-list

Branch name format: `type/short-description`

| Type | When to use |
|---|---|
| `feature/` | New functionality |
| `fix/` | Bug fix |
| `chore/` | Config, dependencies, tooling |
| `docs/` | Documentation only |

`main` is not protected on GitHub. After cloning, run `make hooks`: the pre-commit hook blocks commits to `main` and scans for secrets.

## Commits

We use [Conventional Commits](https://www.conventionalcommits.org/):

    type(scope): short description in imperative mood

Examples:

    feat(market-data): add NBU exchange rates client
    fix(core-api): correct tax calculation for war bonds
    chore(infra): add RabbitMQ to docker-compose

Scope is the service or area: `auth`, `bff`, `core-api`, `market-data`,
`notifications`, `frontend`, `proto`, `infra`, `ci`.

## Pull requests

- Keep PRs small: one task per PR, ideally under 400 changed lines
- Fill in the PR template
- Get at least one approval from a teammate before merging; request a review from the owner of the area you changed
- All CI checks must be green before merge
- PR title follows the commit format — it becomes the commit message after merge
- We use **squash merge**: the whole PR becomes one commit in `main`
- Delete the branch after merge

## Code review

- Review requests are answered within one working day
- Comment on the code, not the person
- Prefix optional suggestions with `nit:` so the author knows they are not blocking

## Changes that affect other people

- `.proto` contracts → tag the API contracts owner
- New environment variable → add it to `.env.example` and tell DevOps
- Database migration → mention it in the PR description

## Toolchain versions

| Tool | Version | Pinned in |
|---|---|---|
| .NET SDK | 10 | `global.json` |
| Go | 1.27 | `go.mod` of each service |
| Node.js | 24.13.1 | `frontend/.nvmrc` |

## Configuration

Every service validates required environment variables on startup and exits with a clear error if any are missing. When you add a new variable, add it to `infra/.env.example` and mention it in the PR description.

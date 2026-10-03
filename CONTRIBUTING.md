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
- At least one approval is required; code owners are assigned automatically
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

# Fireworks Firectl

## How do I install these formulae?

```bash
brew tap fw-ai/firectl
brew install firectl
```

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "fw-ai/firectl"
brew "firectl"
```

## API Gateway Migration Notice

**Direct Routing is deprecated.** Please migrate to the Fireworks API Gateway for improved reliability and multi-region support.

### Migration Steps

1. **Update your API URL:**
   - Old: `https://<deployment>.direct.fireworks.ai/v1`
   - New: `https://api.fireworks.ai/inference/v1`

2. **Update your API key:**
   - Replace `DIRECT_ROUTE_API_KEY` with your standard `FIREWORKS_API_KEY`

3. **Creating deployments with firectl:**
   - Multi-region is now enabled by default
   - If you need single-region deployments, add `--disable-multi-region-sharding` to your `firectl create deployment` command

For detailed migration instructions, see the [Direct Routing Migration Guide](https://docs.fireworks.ai/deployments/direct-routing).

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

For firectl documentation, see the [firectl reference](https://readme.fireworks.ai/reference/firectl).

## Trigger

The workflow to update the SHA256 hash is triggered by a firectl stable release: https://github.com/fw-ai/fireworks/blob/719924c123401ce01e569a04e0138973cfead0ec/.github/workflows/firectl_release.yml#L63-L70

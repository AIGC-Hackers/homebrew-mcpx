# Homebrew Tap for mcpx

Extended TypeScript runtime and CLI for Model Context Protocol with batch operations and LLM-friendly output.

## Installation

```bash
# Add the tap
brew tap ethan-huo/mcpx

# Install mcpx
brew install mcpx

# Or install in one command
brew install ethan-huo/mcpx/mcpx
```

## Usage

```bash
# Check version
mcpx --version

# List MCP servers
mcpx list

# Call a tool
mcpx call server.tool arg1:value1 arg2:value2

# Batch calls via stdin
cat calls.txt | mcpx call
```

## Batch Call Example

Create a file with multiple calls:

```bash
# calls.txt
linear.list_issues({ limit: 5 })
github.search_repos({ query: "mcp" })
```

Execute:

```bash
cat calls.txt | mcpx call
```

Output is in TOON format (compact, LLM-friendly).

## Upgrading

```bash
brew upgrade mcpx
```

## Links

- [GitHub Repository](https://github.com/ethan-huo/mcpx)
- [Releases](https://github.com/ethan-huo/mcpx/releases)

## Maintainer

[@ethan-huo](https://github.com/ethan-huo)

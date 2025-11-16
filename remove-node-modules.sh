#!/bin/zsh

# Check if the target directory is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <target-directory>"
  exit 1
fi

TARGET_DIR="$1"

# Confirm the directory exists
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "Error: Directory '$TARGET_DIR' does not exist."
  exit 1
fi

# List of directories to ignore (easy to modify)
IGNORE_DIRS=(
  "airplane"
  "create-honc-app"
  "fp-services"
  "fp-console"
  "mcp-lite"
  "mcp-gateway"
)

# Build the prune conditions dynamically
PRUNE_CONDITIONS=""
first=true
for dir in "${IGNORE_DIRS[@]}"; do
  if [[ "$first" == true ]]; then
    PRUNE_CONDITIONS="-name \"$dir\""
    first=false
  else
    PRUNE_CONDITIONS="$PRUNE_CONDITIONS -o -name \"$dir\""
  fi
done

echo "Searching for node_modules and Yarn cache directories in $TARGET_DIR, excluding: ${IGNORE_DIRS[*]}"

# Remove node_modules directories
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \"node_modules\" -prune -exec rm -rf {} + 2>/dev/null"

# Remove Yarn cache directories (.yarn/cache, .yarn/install-state.gz, etc.)
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \".yarn\" -prune -exec rm -rf {} + 2>/dev/null"

# Remove Yarn PnP files
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type f -name \".pnp.cjs\" -delete 2>/dev/null"
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type f -name \".pnp.js\" -delete 2>/dev/null"

# Remove other Yarn artifacts
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type f -name \".yarn-integrity\" -delete 2>/dev/null"

# Remove Python virtual environments
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \"venv\" -prune -exec rm -rf {} + 2>/dev/null"
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \".venv\" -prune -exec rm -rf {} + 2>/dev/null"
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \"env\" -prune -exec rm -rf {} + 2>/dev/null"
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \"virtualenv\" -prune -exec rm -rf {} + 2>/dev/null"
eval "find \"$TARGET_DIR\" -type d \\( $PRUNE_CONDITIONS \\) -prune -o -type d -name \".virtualenv\" -prune -exec rm -rf {} + 2>/dev/null"

echo "All node_modules, .yarn directories, Yarn PnP files, and Python virtual environments (excluding: ${IGNORE_DIRS[*]}) have been removed from $TARGET_DIR"
#!/bin/bash

set -e

TOOLS=$(awk '{print $1}' .tool-versions)

for TOOL in $TOOLS; do
  LATEST=$(asdf list-all "$TOOL" | grep -v '[a-zA-Z]' | tail -1)
  if [ -n "$LATEST" ]; then
    # Use sed to replace the version for the tool
    sed -i '' "s|^$TOOL[[:space:]].*|$TOOL $LATEST|" .tool-versions
    echo "Updated $TOOL to $LATEST"
  else
    echo "Could not find latest version for $TOOL"
  fi
done

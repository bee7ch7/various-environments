#!/bin/bash
# ci tests
if [ $(git rev-parse --abbrev-ref HEAD) == 'main' ]; then gh pr create --base dev --head main --title 'docs: [skip ci] backmerge' --body '[skip ci] backmerge' ; fi

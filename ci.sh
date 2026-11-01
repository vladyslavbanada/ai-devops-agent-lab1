#!/usr/bin/env bash
set -euo pipefail

cmake -S . -B build
cmake --build build --config Release
ctest --test-dir build -C Release --output-on-failure

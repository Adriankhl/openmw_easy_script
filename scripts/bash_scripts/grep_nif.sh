#!/bin/bash

# find the .nif files which include Texture effect
grep -rla --include "*.nif" TextureEffect $1

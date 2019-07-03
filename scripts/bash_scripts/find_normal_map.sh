#!/bin/bash

# Find all the .dds with a _nm or _normals prefix.
find $1 -regex ".*_\([Nn][Mm]\|normals\)[.]dds$"

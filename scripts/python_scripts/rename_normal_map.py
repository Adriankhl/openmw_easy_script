import re
import sys
import os
from shutil import copyfile


def rename_dds(filename):
  """Rename and copy the filename if it is an old normal map name"""
  p = re.compile(r'_(?:[Nn][Mm]|normals)[.]dds$')
  newname = p.sub('_n.dds', filename)
  if (newname != filename):
    print("Rename and copy " + filename + " to " + newname)
    copyfile(filename, newname)
  return newname

if __name__ == "__main__":
  rename_dds(sys.argv[1])

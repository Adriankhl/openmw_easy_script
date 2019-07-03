import re
import sys
import os


def rename_dds(filename):
  """Rename the filename if it is an old normal map name"""
  p = re.compile(r'_(?:[Nn][Mm]|normals)[.]dds$')
  newname = p.sub('_n.dds', filename)
  if (newname != filename):
    print("Rename " + filename + " to " + newname)
    os.rename(filename, newname)
  return newname

if __name__ == "__main__":
  rename_dds(sys.argv[1])

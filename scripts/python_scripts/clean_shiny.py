import re
import sys
import os
from pyffi.formats.nif import NifFormat


def is_old_normal_map(name):
  """Return whether the name is an old name of normal map file"""
  p = re.compile(r'.*_(?:[Nn][Mm]|normals)[.]dds$')
  if (p.match(name)):
    return True
  else: 
    return False
  

def remove_shiny_node(parent):
  """Recursively remove the problematic children node 
  
  A node is problematic if it is a NiTextureEffect, or NiSourceTexture with 
  old normal map judging by the is_old_normal_map() function
  """
  child_iter = parent.get_global_child_nodes()
  for node in child_iter:
    if (type(node).__name__ == 'NiTextureEffect'):
      parent.replace_global_node(node, None)
      print("Remove NiTextureEffect")
    elif (type(node).__name__ == 'NiSourceTexture'):
      name = node.file_name.decode('utf-8') # Get the name of the node
      if (is_old_normal_map(name)):
        parent.replace_global_node(node, None)
        print("Remove NiSourceTexture, name: " + name)
    else:
      remove_shiny_node(node)


def remove_from_nif(filename):
  """Modify the file, remove blocks causing shiny texture from the nif file""" 
  print("Operating on this file: " + filename)
  stream = open(filename, 'r+b')
  data = NifFormat.Data()
  data.read(stream)
  root_node = data.roots[0]
  remove_shiny_node(root_node)
  stream.close()
  os.remove(filename)
  print("Delete the old file")
  newstream = open(filename, 'wb')
  newdata = NifFormat.Data(version=0x04000002, user_version=10) #Morrowind version number
  newdata.roots = [root_node]
  newdata.write(newstream)
  print("Create a new file")
  newstream.close()
      

if __name__ == "__main__":
   remove_from_nif(sys.argv[1])

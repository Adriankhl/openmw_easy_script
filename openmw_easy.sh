#!/bin/bash

RENAME_NM=""
CLEAN_NIF=""
DIR_PATH=""
PYTHON_NAME=""
HELP_MOD=""


# Help function
function script_usage() {
  cat << EOF
Usage:
     -h                         Displays this help
     -c                         Clean shiny nif files
     -r                         Rename old normal map files
     -f DIRECTORY               The root of the directory
EOF
}

if [[ $# -eq 0 ]] ; then
  echo "Please use -h for help"
  exit 0
fi

# Get the options from argument
while getopts ":hcrf:" opt; do
  case $opt in
    h)
      script_usage 
      HELP_MOD=true
      ;;
    r)
      RENAME_NM=true
      ;;
    c)
      CLEAN_NIF=true
      ;;
    f)
      DIR_PATH=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Exit and print an error message if there are invalid argument
shift "$((OPTIND-1))"
if (( $# > 0 )); 
then
  echo "Error: extra invalid args detected: $*" >&2
  exit 1
fi

# Exit if there is no folder path in the input
if [ -z $DIR_PATH ] && [ ! $HELP_MOD ] 
then
  echo "Error: No folder path, please use the -f option" >&2
  exit 1
fi

# Determine the python name, python or python3
PYTHON_VERSION=$(python -c 'import sys; print(sys.version_info[0])')
if [ $PYTHON_VERSION == 3 ]
then
  PYTHON_NAME="python"
else
  PYTHON_NAME="python3"
fi 


if [ $RENAME_NM ]
then 
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  mapfile -t FILELIST < <(source $DIR/scripts/bash_scripts/find_normal_map.sh $DIR_PATH)
  for file in "${FILELIST[@]}"
  do
    $PYTHON_NAME $DIR/scripts/python_scripts/rename_normal_map.py "$file"
  done
fi

if [ $CLEAN_NIF ]
then
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  mapfile -t FILELIST < <(source $DIR/scripts/bash_scripts/grep_nif.sh $DIR_PATH)
  for file in "${FILELIST[@]}"
  do
    $PYTHON_NAME $DIR/scripts/python_scripts/clean_shiny.py "$file"
  done
fi

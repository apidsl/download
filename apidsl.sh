#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 23.05.2022

## EXAMPLE
# ./apidsl.sh -h
# ./apidsl.sh --help
# ./apidsl.sh example2.txt
# ./apidsl.sh example/example3.txt
# ./apidsl.sh "http("https://www.rezydent.de/").xpath("title")"
# ./apidsl.sh 'http("https://www.rezydent.de/").xpath("title")'

## CONFIG
INPUT_FILE=$1

MODULE="apidsl"
FILE_EXT=".txt"
CMD_EXT=".sh"
CONFIG_FILE=".${MODULE}"
CONFIG_DEFAULT="${MODULE}${FILE_EXT}"
CONFIG_DEV="${MODULE}.dev${FILE_EXT}"
CONFIG_TEST="${MODULE}.test${FILE_EXT}"
LOGS=".${MODULE}.logs${FILE_EXT}"
INPUT_FOLDER=".${MODULE}"
COMMAND_LANGUAGE="bash"
CACHE_FOLDER=".${MODULE}.cache"
HISTORY_FOLDER=".${MODULE}.history"

# START
echo "`date +"%T.%3N"` START" > $LOGS
mkdir -p "$CACHE_FOLDER"
#

if [ "$CMD" == "-h" ] || [ "$CMD" == "--help" ]; then
  echo "set config for:"
  echo "init - the default config, for customers"
  echo "dev - development packages, for contributors and developers"
  echo "test - for testing the project"
  echo ""
  exit
fi
if [ "$CMD" == "init" ]; then
  echo -n "$CONFIG_DEFAULT" > "$CONFIG_FILE"
  exit
fi
if [ "$CMD" == "dev" ]; then
  echo -n "$CONFIG_DEV" > "$CONFIG_FILE"
  exit
fi
if [ "$CMD" == "test" ]; then
  echo -n "$CONFIG_TEST" > "$CONFIG_FILE"
  exit
fi
#
PROJECT_LIST=$2
[ -z "$PROJECT_LIST" ] && [ -f "$CONFIG_FILE" ] && PROJECT_LIST=$(cat "$CONFIG_FILE")
[ -z "$PROJECT_LIST" ] && PROJECT_LIST="$CONFIG_DEFAULT"
[ ! -f "$PROJECT_LIST" ] && echo -n "" > "$CONFIG_DEFAULT" && echo "$LOGS" >> ".gitignore"
#
FTIME="$(date +%s)"
INPUT_FILETIME="${CACHE_FOLDER}/${FTIME}"
INPUT_FILE_PATH="${INPUT_FILETIME}${FILE_EXT}"
echo "${INPUT_FILE}" > ${INPUT_FILE_PATH}

CACHE_FILE="${INPUT_FILETIME}.cache${FILE_EXT}"
BASH_FILE="${INPUT_FILETIME}${CMD_EXT}"
BASH_LOOP_FILE="${INPUT_FILETIME}.loop${CMD_EXT}"

PROJECT_PATH=$(pwd)
#echo $PROJECT_PATH
[ -z "$INPUT_FILE_PATH" ] && echo "INPUT_FILE is empty" && exit
echo "#!/bin/bash" >$BASH_FILE

#Create temporary file with new line in place
#cat $INPUT_FILE | sed -e "s/)/\n/" > $CACHE_FILE
DSL_HASH="#"
DSL_SLASHSLASH='//'
DSL_DOT="."
DSL_SEMICOLON=";"
DSL_LEFT_BRACE="("
DSL_RIGHT_BRACE=")"
DSL_RIGHT_BRACE_SEMICOLON=");"
DSL_RIGHT_BRACE_DOT=")."
DSL_NEW="\n"
DSL_EMPTY=""
DSL_LOOP="forEachLine"
#
# REMOVE COMMENTS
echo -n "" > $CACHE_FILE
while IFS= read -r line; do
  [ -z "$line" ] && continue
  #echo "${line:0:1}"
  # Remove Comments
  [ "${line:0:1}" == "${DSL_HASH}" ] && continue
  [ "${line:0:1}" == "${DSL_SLASHSLASH}" ] && continue
  echo "${line}" >>$CACHE_FILE
done <"$INPUT_FILE_PATH"

sed -i "s/${DSL_RIGHT_BRACE_DOT}/${DSL_NEW}/g" $CACHE_FILE
sed -i "s/${DSL_RIGHT_BRACE}/${DSL_NEW}/g" $CACHE_FILE

# array to hold all lines read
functions=()
values=()

# PRE processing
while IFS= read -r line; do
  [ -z "$line" ] && continue
  IFS="$DSL_LEFT_BRACE"
  read -ra line <<<"$line"
  index=0
  key=""
  value=""

  for i in "${line[@]}"; do
    index=$((index + 1))
    i="$(echo -e "${i}" | tr -d '[:space:]')"

    if [ $index -gt 2 ]; then
      echo $index "break"
    #  break
    fi

    if [ $index == 1 ]; then
      key=$i
    fi

  done

  [ "$key" = "$i" ] && functions+=("$key") && values+=("")
  [ "$key" != "$i" ] && functions+=("$key") && values+=("$i")
done <"$CACHE_FILE"

CURRENT_FOLDER=$(pwd)
length=${#functions[@]}
loop=
loop_functions=()
loop_values=()
for ((i = 0; i < ${length}; i++)); do
  #echo "$i"
  #echo "${functions[$i]}"
  #echo "${values[$i]}"
  # Replace dot to slash for path at installed packages
  #key="${functions[$i]/./\/}"
  key="${functions[$i]}"
  IFS='.' read -a keys <<< "$key"
  value="${values[$i]}"
  CMD_FILE_NAME=$key
  CMD_FOLDER_NAME=
  [ ! -z "${keys[1]}" ] && CMD_FILE_NAME=${keys[1]} && CMD_FOLDER_NAME=/${keys[0]}
  [ "$key" == "split" ] && loop="1"
  #[ "$key" == "filesRecursive" ] && loop="1"
  if [ -z "$loop" ]; then
    echo -n ".${CMD_FOLDER_NAME}/${CMD_FILE_NAME}.sh $value" >>$BASH_FILE
#    echo -n " && cd $CURRENT_FOLDER " >>$BASH_FILE
    echo -n " | " >>$BASH_FILE
  else
    loop_functions+=("$key")
    loop_values+=("$value")
  fi
done

## LOOP with split function
## TODO: more loop options
## TODO: many loop in one sentence
if [ ! -z "$loop" ]; then
  #echo $BASH_LOOP_FILE
  echo -n "./$BASH_LOOP_FILE " >>$BASH_FILE

  echo "#!/bin/bash" >$BASH_LOOP_FILE
  echo "IFS='' read -d '' -r list" >>$BASH_LOOP_FILE
  echo 'while IFS= read -r ITEM; do' >>$BASH_LOOP_FILE
  #echo ' echo "$ITEM"' >>$BASH_LOOP_FILE

  length=${#loop_functions[@]}
  first=1
  first_val=1
  for ((i = 0; i < ${length}; i++)); do

    #echo "${loop_functions[$i]}"
    #echo "${loop_values[$i]}"
    key="${loop_functions[$i]}"
    IFS='.' read -a keys <<< "$key"
    value="${loop_values[$i]}"
    CMD_FILE_NAME=$key
    CMD_FOLDER_NAME=
    [ ! -z "${keys[1]}" ] && CMD_FILE_NAME=${keys[1]} && CMD_FOLDER_NAME=/${keys[0]}

    if [ -z "$first" ]; then
      echo -n ".${CMD_FOLDER_NAME}/${CMD_FILE_NAME}.sh $value" >>$BASH_LOOP_FILE
      echo -n ' | ' >>$BASH_LOOP_FILE
      first_val=
    else
      #value='$ITEM'
      echo -n ' ' >>$BASH_LOOP_FILE
      echo -n 'echo "$ITEM" | ' >>$BASH_LOOP_FILE
      #echo -n "./$COMMAND_FOLDER/$key.sh $value" >>$BASH_LOOP_FILE
      #echo -n " | " >>$BASH_LOOP_FILE
    fi
    first=

  done
  truncate -s -3 $BASH_LOOP_FILE

  echo "" >>$BASH_LOOP_FILE
  #echo "done" >>$BASH_LOOP_FILE
  echo 'done <<< "$list"' >>$BASH_LOOP_FILE
else
  truncate -s -3 $BASH_FILE
fi

#cat $CACHE_FILE
#cat $BASH_FILE
#cat $BASH_LOOP_FILE

./$BASH_FILE

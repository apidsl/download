#!/bin/bash

# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 23.05.2022

## EXAMPLE
# ./apidsl.sh example2.txt
# ./apidsl.sh example/example3.txt
# ./apidsl.sh "http("https://www.rezydent.de/").xpath("title")"
# ./apidsl.sh 'http("https://www.rezydent.de/").xpath("title")'

## CONFIG
INPUT_FILE=$1
INPUT_FOLDER=".apidsl"
COMMAND_LANGUAGE="bash"
COMMAND_FOLDER="apidsl/$COMMAND_LANGUAGE"
CACHE_FOLDER=".apidsl"
mkdir -p "$CACHE_FOLDER"
#
INPUT_FTIME="$(date +%s).txt"
INPUT_FILE_PATH="$INPUT_FOLDER/$INPUT_FTIME"

if [ ! -f "$INPUT_FILE" ]; then
  # IF file not exist then create file with the input text
  echo "$1" >$INPUT_FILE_PATH
else
  # if file exist copy to folder
  cp $INPUT_FILE $INPUT_FILE_PATH
fi

CACHE_FILE="$INPUT_FILE_PATH.cache.txt"
BASH_FILE="$INPUT_FILE_PATH.sh"
BASH_LOOP_FILE="$CACHE_FOLDER/$INPUT_FTIME.loop.sh"
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

## START
[ -z "$INPUT_FILE_PATH" ] && echo "INPUT_FILE is empty" && exit
echo "#!/bin/bash" >$BASH_FILE

# REMOVE COMMENTS
echo "" >$CACHE_FILE
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
    echo -n "cd ${COMMAND_FOLDER}${CMD_FOLDER_NAME} && " >>$BASH_FILE
    echo -n "./${CMD_FILE_NAME}.sh $value" >>$BASH_FILE
    echo -n " && cd $CURRENT_FOLDER " >>$BASH_FILE

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
  echo $BASH_LOOP_FILE
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
    value="${loop_values[$i]}"

    if [ -z "$first" ]; then
      echo -n "./$COMMAND_FOLDER/$key.sh $value" >>$BASH_LOOP_FILE
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

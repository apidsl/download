#!/bin/bash
# Locally installed software must be placed within /usr/local rather than /usr unless it is being installed to replace or upgrade software in /usr.
# https://github.com/apidsl/bash
## USAGE:
# apidsl example2.txt
# apidsl example/example3.txt
# apidsl "http("https://www.rezydent.de/").xpath("title")"


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
CMD=$1
[ -z "$CMD" ] && CMD="-h"
OPTION=
(( $# == 2 )) && CMD=$2 && OPTION=$1
#[ $# -ne 1 ] && echo "Exactly 1 param is needed" &&  exit 1

MODULE="apidsl"
FILE_EXT=".txt"
CMD_EXT=".sh"
CONFIG_FILE=".${MODULE}"
CONFIG_DEFAULT="${MODULE}${FILE_EXT}"
CONFIG_DEV="${MODULE}.dev${FILE_EXT}"
CONFIG_TEST="${MODULE}.test${FILE_EXT}"
INPUT_FOLDER=".${MODULE}"
COMMAND_LANGUAGE="bash"
CACHE_FOLDER=".${MODULE}.cache"
HISTORY_FOLDER=".${MODULE}.history"
FTIME="$(date +%s)"
INPUT_FILETIME="${CACHE_FOLDER}/${FTIME}"
CACHE_FILE="${INPUT_FILETIME}.cache${FILE_EXT}"
LOGS="${INPUT_FILETIME}.logs${FILE_EXT}"

# START
echo "`date +"%T.%3N"` START" > $LOGS
mkdir -p "$CACHE_FOLDER"

# HELP INFO ######################################
if [ "$CMD" == "-h" ] || [ "$CMD" == "--help" ]; then
  echo "$MODULE with param or command is needed!"
  echo "# PARAM:"
  echo "$MODULE init - the default config, for customers"
  echo "$MODULE dev - development packages, for contributors and developers"
  echo "$MODULE test - for testing the project"
  echo "# COMMAND:"
  echo "$MODULE 'import(\"https://github.com/letpath/bash\",\"path\")' - import project from git"
  echo "$MODULE 'path.load(\"flatedit.txt\")' - use imported command, such load file "
  exit
fi
### HELP INFO ######################################

# CONFIG FILE ######################################
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
if [ "$CMD" == "-l" ] || [ "$CMD" == "--logs" ]; then
  # get latest logs ID
  FTIME_LOGS=$(cat "$CONFIG_FILE")
  # Prepare Path based on latest logs ID
  INPUT_FILETIME_LOGS="${CACHE_FOLDER}/${FTIME_LOGS}"
  LOGS_FILE="${INPUT_FILETIME_LOGS}.logs${FILE_EXT}"
  CACHE_FILE="${INPUT_FILETIME_LOGS}.cache${FILE_EXT}"
  # Print script and logs
  echo -e "SCRIPTS:"
  cat $CACHE_FILE
  echo -e "\nLOGS:"
  cat $LOGS_FILE
  exit
fi

PROJECT_LIST=$2
[ -z "$PROJECT_LIST" ] && [ -f "$CONFIG_FILE" ] && PROJECT_LIST=$(cat "$CONFIG_FILE")
[ -z "$PROJECT_LIST" ] && PROJECT_LIST="$CONFIG_DEFAULT"
[ ! -f "$PROJECT_LIST" ] && echo -n "" > "$CONFIG_DEFAULT" && echo "$LOGS" >> ".gitignore"
### CONFIG FILE ######################################

INPUT_FILE_PATH="${INPUT_FILETIME}${FILE_EXT}"
echo "${CMD}" > ${INPUT_FILE_PATH}

BASH_FILE="${INPUT_FILETIME}${CMD_EXT}"
BASH_LOOP_FILE="${INPUT_FILETIME}.loop${CMD_EXT}"

PROJECT_PATH=$(pwd)
#echo $PROJECT_PATH
[ -z "$INPUT_FILE_PATH" ] && echo "$INPUT_FILE_PATH is empty" >> $LOGS && exit
echo "#!/bin/bash" >$BASH_FILE

# PREPARE NUMBER for LOGS
echo -n "$FTIME" > "$CONFIG_FILE"

# PARSER CONFIG ######################################
#Create temporary file with new line in place
#cat $CMD | sed -e "s/)/\n/" > $CACHE_FILE
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
### PARSER CONFIG ######################################

# REMOVE COMMENTS ######################################
echo -n "" > $CACHE_FILE
while IFS= read -r line; do
  [ -z "$line" ] && echo "REMOVED: $line" >> $LOGS && continue
  #echo "${line:0:1}"
  # Remove Comments
  [ "${line:0:1}" == "${DSL_HASH}" ] && continue
  [ "${line:0:1}" == "${DSL_SLASHSLASH}" ] && continue
  echo "${line}" >>$CACHE_FILE
done <"$INPUT_FILE_PATH"

sed -i "s/${DSL_RIGHT_BRACE_DOT}/${DSL_NEW}/g" $CACHE_FILE
sed -i "s/${DSL_RIGHT_BRACE}/${DSL_NEW}/g" $CACHE_FILE
### REMOVE COMMENTS ######################################

# PREPARE functions ######################################
# array to hold all lines read
functions=()
values=()
while IFS= read -r LINE; do
#while line=; IFS=$' \t\r\n' read -r line || [[ $line ]]; do
  #LINE=($line)
  echo "LINE BEFORE CLEANING: $LINE" >> $LOGS
  [ -z "$LINE" ] && continue
  ### SPLIT BY BRACE ##################################
  IFS="$DSL_LEFT_BRACE"
  read -ra line <<<"$LINE"
  #echo "LINE: $line"
  index=0
  key=""

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
  echo " KEY: $key" >> $LOGS
  echo " VAL: $i" >> $LOGS

  ## depends param function exist or not
  [ "$key" = "$i" ] && functions+=("$key") && values+=("")
  [ "$key" != "$i" ] && functions+=("$key") && values+=("$i")
done <"$CACHE_FILE"
### PREPARE functions ######################################

BUILD_PHP="composer update"
BUILD_NODEJS="npm update"
BUILD_PYTHON="python"
CURRENT_FOLDER=$(pwd)
length=${#functions[@]}
loop=
loop_functions=()
loop_values=()
k=0
key=""
value=""
for ((i = 0; i < ${length}; i++)); do
  echo " F$i: ${functions[$i]}" >> $LOGS
  echo " V$i: ${values[$i]}" >> $LOGS
  # Replace dot to slash for path at installed packages
  #key="${functions[$i]/./\/}"
  key="${functions[$i]}"
  value="${values[$i]}"

  ## IMPORT ##########################
  # install dependencies by apifork
  cd "${CURRENT_FOLDER}"
  if [ "$key" == "import" ]; then
    #[ ! -z "${keys[1]}" ] && CMD_FILE_NAME=${keys[1]} && CMD_FOLDER_NAME=/${keys[0]}
    IFS=',' read -a repo <<< "$value"
    git_repo=${repo[0]}
    git_folder=${repo[1]}
    #echo "FOLDER: ${git_folder}/  FROM REPO:  (${git_repo})"
    #[ ! -f ${git_folder} ] && echo "!!! FOLDER ${git_folder} EXIST, PLEASE INSTALL IN ANOTHER FOLDER " && continue
    [ ! -f ${git_folder} ] && continue
    #echo "${git_folder}" >>.gitignore
    git clone ${git_repo} && cd ${git_folder}
    [ "$(pwd)" == "$CURRENT_FOLDER" ] && echo "!!! GIT PROJECT ${git_repo} NOT EXIST, PLEASE INSTALL FIRST " >> $LOGS && continue
    [ -f "composer.json" ] && ${BUILD_PHP}
    [ -f "package.json" ] && ${BUILD_NODEJS}
    continue
  fi
  ## IMPORT ##########################

  #k=$((k+1))
  IFS='.' read -a keys <<< "$key"
  #value="${values[$i]}"
  CMD_FILE_NAME=$key
  CMD_FOLDER_NAME=
  echo "ADD COMMAND $i: $key $value" >> $LOGS
  [ ! -z "${keys[1]}" ] && CMD_FILE_NAME=${keys[1]} && CMD_FOLDER_NAME=/${keys[0]}
  [ "$key" == "split" ] && loop="1"
  #[ "$key" == "filesRecursive" ] && loop="1"
  if [ -z "$loop" ]; then
    COMMAND_VALUE=".${CMD_FOLDER_NAME}/${CMD_FILE_NAME}.sh $value"
    echo -n "$COMMAND_VALUE" >>$BASH_FILE
#    echo -n " && cd $CURRENT_FOLDER " >>$BASH_FILE
    echo -n " | " >> $BASH_FILE
    echo "ADD SCRIPT $i: $COMMAND_VALUE TO FILE: $BASH_FILE" >> $LOGS
  else
    loop_functions+=("$key")
    loop_values+=("$value")
    echo "ADD KEY: $key TO ARRAY LOOP" >> $LOGS
  fi
done

## LOOP ##########################
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
## LOOP ##########################

#cat $CACHE_FILE
#cat $BASH_FILE
#cat $BASH_LOOP_FILE

#echo "RUN: $BASH_FILE" >> $LOGS
./$BASH_FILE
echo "END: $BASH_FILE" >> $LOGS

if [ "$OPTION" == "-d" ] || [ "$OPTION" == "--debug" ]; then
  echo -e "\n\nSCRIPTS:"
  cat $CACHE_FILE
  echo -e "\nLOGS:"
  cat $LOGS
fi

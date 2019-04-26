#!/bin/bash

# This argument sets a premium username Crunchyroll account.
# By command line, it is "-u username" or "--username username"
USERNAME="" # Default: "" (Means guest session).

# This argument sets a password for your username Crunchyroll account.
# By command line, it is "-p password" or "--password password"
PASSWORD="" # Default: "" (Means guest session if username is not specific).

# This argument sets video resolution.
# By command line, it is "-r value" or "--resolution value".
# Default: "" (Means best resolution).
# Change to other value as "worst", "240p", "360p", "480p", "720p", "1080p", "best".
RESOLUTION="1080p"

# This argument sets the episodes to download.
# By command line, it is "-e <s>" or "--episodes <s>"
EPISODES="" # Default: "" (Means all).

# This argument sets output file name.
# By command line, it is "-f value" or "--format value".
# Default: "" (Means :name Episode :ep [:resolution]).
FORMAT=":name Episode :ep [:resolution]"

# This argument sets language.
# By command line, it is "-l value" or "--language value".
# Default: "" (Means enUS).
LANG=""

# This argument sets download all boolean.
# By command line, it is "-d" or "--download-all".
# Default: "" (Means 0, no download all).
DALL="0"

# CHECKING...
if [ ${#} -eq 0 ]
then
    	echo "Error. crunchyroll-dl needs a input URL as parameter."
        echo "Syntaxis:"
        echo "  ${0} -i URL [-f format] [-s force] [-c] [-o output]"
        exit -1
fi

# PARSING...
while [ ${#} -gt 0 ]
do
  	case "${1}" in
                -i|--input)
                        INPUT="${2}"
                        shift
                ;;
                -u|--username)
                        USERNAME="${2}"
                        shift
                ;;
                -p|--password)
                        PASSWORD="${2}"
                        shift
                ;;

                -e|--episodes)
                        EPISODES="${2}"
                        shift
                ;;

                -f|--format)
                        FORMAT="${2}"
                        shift
                ;;

                -l|--language)
                        LANG="${2}"
                        shift
                ;;

                -d|--download-all)
                        DALL="1"
                        shift
                ;;

                -q|--quality)
                        RESOLUTION="${2}"
                        shift
                ;;

                *)
                  	echo "Error. Unexpected argument: ${1}"
                        exit -1
                ;;
        esac
	shift
done

# PREPARING PARAMETERS
if [ -n "${USERNAME}" ]
then
    	USERNAME="-u ${USERNAME}"
fi
if [ -n "${PASSWORD}" ]
then
    	PASSWORD="-p ${PASSWORD}"
fi
if [ -n "${RESOLUTION}" ]
then
    	RESOLUTION="-r ${RESOLUTION}"
else
    	RESOLUTION="-r 1080p"
fi
if [ -n "${EPISODES}" ]
then
    	EPISODES="-e ${EPISODES}"
fi
if [ -n "${FORMAT}" ]
then
    	FORMAT="-o ${FORMAT}"
else
    	FORMAT="-o :name Episode :ep [:resolution]"
fi
if [ -n "${LANG}" ]
then
    	LANG="-l ${LANG}"
fi
if [ -n "${INPUT}" ]
then
    	INPUT="-i ${INPUT}"
fi

# MAIN...


if [ "${DALL}" == 0 ]
then
    	if [ -n "${EPISODES}" ]
      then
                cd /downloads && crunchyroll-dl ${USERNAME} ${PASSWORD} ${INPUT} ${EPISODES} ${RESOLUTION} ${FORMAT} ${LANG}
      else
               cd /downloads && crunchyroll-dl ${USERNAME} ${PASSWORD} ${INPUT} ${RESOLUTION} ${FORMAT} ${LANG}
      fi
else
    	if [ -n "${EPISODES}" ]
	then
                cd /downloads && crunchyroll-dl ${USERNAME} ${PASSWORD} ${INPUT} ${EPISODES} ${RESOLUTION} ${FORMAT} ${LANG} -a
        else
                cd /downloads && crunchyroll-dl ${USERNAME} ${PASSWORD} ${INPUT} ${RESOLUTION} ${FORMAT} ${LANG} -a
        fi
fi

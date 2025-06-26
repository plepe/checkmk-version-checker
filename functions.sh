# Parameters:
# - Name of service (e.g. My Homepage)
# - Name of application (e.g. Wordpress)
# - List of supported versions, most current version first (CR separated) (e.g. "1.40.0\n1.39.5\n1.38.9")
# - Currently installed version (e.g. "1.39.4")
evaluate () {
  local SERVICE=${1}
  local APP=${2}
  local SUPPORTED_VERSIONS=${3}
  local CURRENT_VERSION=${4}

  local CHECK_NAME="${APP} version ${SERVICE}"
  if [ "${SERVICE}" == "" ] ; then
    CHECK_NAME="${APP} version"
  fi

  if [ "${CURRENT_VERSION}" = "" ] ; then
    echo "2 \"${CHECK_NAME}\" - Can't evaluate version"
    return
  fi

  local LATEST_VERSION=$(echo "${SUPPORTED_VERSIONS}" | head -n1 | xargs)
  local CURRENT_MINOR=$(echo ${CURRENT_VERSION} | cut -d\. -f1-2 | xargs)
  local LATEST_MINOR=$(echo "${SUPPORTED_VERSIONS}" | grep "^${CURRENT_MINOR}\." | head -n1 | xargs)
  local NEWER_MAJOR=$(echo "${SUPPORTED_VERSIONS}" | grep -B5000 "^${CURRENT_MINOR}\." | head -n-1 | tac | xargs)
  local NEWER_MAJOR_OR=${NEWER_MAJOR// / or }

  if [ "${CURRENT_VERSION}" = "${LATEST_VERSION}" ] ; then
    echo "0 \"${CHECK_NAME}\" - Current version: ${CURRENT_VERSION}"
  elif [ "${CURRENT_VERSION}" = "${LATEST_MINOR}" ] ; then
    echo "0 \"${CHECK_NAME}\" - Current version: ${CURRENT_VERSION} (still supported), available: ${NEWER_MAJOR_OR}"
  elif [ "${LATEST_MINOR}" = "" ] || [ "${LATEST_MINOR}" = "${LATEST_VERSION}" ] ; then
    echo "1 \"${CHECK_NAME}\" - Current version: ${CURRENT_VERSION}, available: ${LATEST_MINOR}"
  else
    echo "1 \"${CHECK_NAME}\" - Current version: ${CURRENT_VERSION}, available: ${LATEST_MINOR} or ${NEWER_MAJOR_OR}"
  fi
}

get_supported_endoflife () {
  local SERVICE=${1}
  local DATE=$(date +"%Y-%m-%d")

  echo "$(curl https://endoflife.date/api/${SERVICE}.json | jq ".[] | select(.eol >= \"${DATE}\" or .eol == false)" | jq -s . | jq "sort_by(.cycle | split(\".\") | map(tonumber)) | reverse" | jq -r ".[].latest")"
}

#evaluate "My Homepage" "Wordpress" "1.40.0\n1.39.5\n1.38.9" "1.38.9"

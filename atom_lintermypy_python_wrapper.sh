#!/bin/sh
# see https://github.com/elarivie/linter-mypy/issues/26#issuecomment-681950256

PROJECT_NAME=$MYPYPATH
unset $MYPYPATH
PYENVDIR="/Users/keisuke.nakata/.pyenv/versions/${PROJECT_NAME}"

if [ -d ${PYENVDIR} ]; then
  PYTHONEXECUTABLE=${PYENVDIR}/bin/python
else
  PYTHONEXECUTABLE=python
fi

$PYTHONEXECUTABLE "$@"

exit $?

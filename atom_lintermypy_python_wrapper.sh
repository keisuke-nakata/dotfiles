#!/bin/sh
# see https://github.com/elarivie/linter-mypy/issues/26#issuecomment-681950256

PROJECT_NAME=$MYPYPATH
unset $MYPYPATH
PYENVDIR="/Users/keisuke.nakata/.pyenv/versions/${PROJECT_NAME}"

if [ -d ${PYENVDIR} ]; then
  PYTHONEXECUTABLE=${PYENVDIR}/bin/python
else
  # PYTHONEXECUTABLE=python
  PYTHONEXECUTABLE=/Users/keisuke.nakata/.pyenv/versions/3.9.1/bin/python3.9  # なぜか絶対パス指定しないと動かない・・・
fi

$PYTHONEXECUTABLE "$@"

exit $?

#!/bin/sh

set -e
VENV="$1"
if [ "$VENV" = "" ] ; then
    VENV="fbsd-bugzilla-tool"
fi
if ! /usr/bin/which virtualenv ; then
    echo "Virtualenv not installed..."
    echo "please run:"
    echo "  sudo pkg install devel/py-virtualenv"
    echo " -or-"
    echo "  pip install --user virtualenv"
    echo "  export PATH=~/.local/bin:\$PATH"
    exit 1
fi
echo "Making virtualenv $VENV"
virtualenv "$VENV"

echo "Sourcing virtualenv $VENV"
. "$VENV/bin/activate"
echo "Installing requirements..."
pip install -r requirements.txt
echo "Installing binaries"

cp "bugzilla-fbsd" "$VENV/bin"

echo "Installed..."
echo "To run this:"
echo "  source $VENV/bin/activate"
echo "  bugzilla-fbsd"

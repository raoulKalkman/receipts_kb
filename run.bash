#!/bin/bash

# assumes the project and  is set up already and connection to database is made
# runs a local server in development mode, deploy using make

. venv/bin/activate


i=5000

export FLASK_APP=server
export FLASK_ENV=development
export FLASK_RUN_PORT=$i

flask run # bug: sometimes doesn't throw you out of venv

while [[ $? -ne "0" ]]
do
    if [[ portn -eq 7000 ]]; then
        echo "could not find port between 5000 and 7000"
        deactivate
        exit 1
    fi

    # try ports until free one is found
    ((i++))
    export FLASK_RUN_PORT=$i
    flask run
done

deactivate
exit 0
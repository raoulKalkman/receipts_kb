# basic_flask_server
a very bare bones flask server with the basics installed and documented

In this project WSGI is supported and Jinja is used as templating engine
The project is documented and documentation can be found in the "documentation/" directory

internally a SQLite relational database is implemented, this can be changed in settings and "server/__init__.py"

Also a shell script is provided to set up the venv and a makefile is provided to set up different releases

# prerequisites

The automatic setup for this project assumes a debian-based UNIX OS (debian / ubuntu)
If user has no root access, python3, make and python3.8-venv are assumed to be installed

An alternative setup script could be written, email raoulkalkman@outlook.com if this is necessary

# installation
In order to install this project locally on UNIX run:

```bash
sudo chmod +x ./setup.bash
./setup.bash
```

>alternatively (if no sudo is allowed) follow instructions described in "documentation/setup.txt"

# run

the ```./run.bash``` script is provided in order to seamlessly run the webserver locally
alternatively, in documentation/setup.txt a description is given to manually set upt the server and run it


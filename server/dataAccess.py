import sqlite3 # standard included in py
import click

from flask import current_app, g
from flask.cli import with_appcontext

# =================================================[INITIALIZATION]=============================================================================

def init_app(app):
    app.teardown_appcontext(close_connection) # destructor
    app.cli.add_command(init_db_command) # adds flask init_db_command

# define command line command 'flask init-db' which initializes the database
@click.command('init-db') 
@with_appcontext
def init_db_command():
    init_db()
    click.echo('Initialized database')


def init_db():
    db = connect_db()
    
    with current_app.open_resource('schema.sql') as f:
        db.executescript(f.read().decode('utf8'))

# =================================================[FUNCTIONALITY]=============================================================================


# todo: add cursor to interact with db (can be started at start of method)

# make a connection to db using current request obj g
def connect_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
            current_app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row # allow accessing columns by name
    return g.db


# remove connection to db
def close_connection(e=None):
    db = g.pop('db', None)
    
    if db is not None:
        db.close()

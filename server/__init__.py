import os

from flask import Flask

# initialize flask application
def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    
    # load in configurations for application
    if app.config["ENV"] == "production":
        app.config.from_object("config.ProductionConfig")
    else: 
        #todo: add testing
        app.config.from_object("config.DevelopmentConfig")
    app.config.from_mapping(DATABASE=os.path.join(app.instance_path, 'server.sqlite'), )

    # if not testing, load instance config
    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    # ensure instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # bind database to this application
    from . import dataAccess as db
    db.init_app(app)

    # =============================[page serving]======================================

    # smoke test
    @app.route('/hello/')
    def hello():
        return 'Hello, World!'

    return app
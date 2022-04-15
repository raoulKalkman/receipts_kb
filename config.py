class Config(object):
    DEBUG = False
    TESTING = False
    SECRET_KEY = "admin"
    
    DB_NAME = "production-db"
    DB_USERNAME = "admin"
    DB_PASSWORD = ""
    
    SESSION_COOKIE_SECURE = True

class DevelopmentConfig(Config):
    DEBUG = True
    
    DB_NAME = "schema"
    DB_USERNAME = "admin"
    DB_PASSWORD = ""
    
    SESSION_COOKIE_SECURE = False

class ProductionConfig(Config):
    pass
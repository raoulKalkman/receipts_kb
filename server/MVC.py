# from flask import Flask
# from flask import request
# from flask import render_template
# from flask import session

# from markupsafe import escape

# # following types can be expected in url:
# # string    -> any text without a slash
# # int       -> any positive integer
# # float     -> positive floating point values
# # path      -> string but with slash
# # uuid      -> UUID strings 

# # on a POST method, use request.form['username'] to get input -> can throw keyError (catchable)
# # access parameters in URL using request.args.get('key', '') -> wishable for GET

# # use if 'username' in session: return f'logged in as {session["username"]}' in order to keep session between requests

# @app.route('/', methods=['GET'])
# def hello_world():
#     return '<p>Hello, World!</p>'

# @app.route('/hello/<name>/', methods=['GET'])
# def hello_person(name):
#     return f"Hello, {escape(name)}!"

# @app.route('/<int:number>/', methods=['GET'])
# def show_post(number):
#     return f'Woah... {number}'

# @app.errorHandler(404)
# def page_not_found(error):
#     return render_template('page_not_found.html'), 404
# app/__init__.py

import os
from flask import Flask
from app.extensions import db, migrate
from app.routes import api
from dotenv import load_dotenv
import urllib.parse

def create_app():
    app = Flask(__name__)
    load_dotenv()

    driver = os.getenv('DB_DRIVER')
    server = os.getenv('DB_SERVER')
    database = os.getenv('DB_DATABASE')
    username = os.getenv('DB_USERNAME')
    password = os.getenv('DB_PASSWORD')
    encrypt = os.getenv('DB_ENCRYPT', 'yes')
    trust_cert = os.getenv('DB_TRUST_SERVER_CERTIFICATE', 'yes')

    password_encoded = urllib.parse.quote_plus(password)
    driver_encoded = urllib.parse.quote_plus(driver)

    app.config['SQLALCHEMY_DATABASE_URI'] = (
        f"mssql+pyodbc://{username}:{password_encoded}@{server}/{database}"
        f"?driver={driver_encoded}"
        f"&Encrypt={encrypt}"
        f"&TrustServerCertificate={trust_cert}"
    )

    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)
    migrate.init_app(app, db)

    with app.app_context():
        try:
            connection = db.engine.connect()
            print("Database connected successfully!")
            connection.close()
        except Exception as e:
            print("Database connection failed:", str(e))

    app.register_blueprint(api, url_prefix='/api')

    return app
from flask import Blueprint, jsonify
from app.models import User, Job, Company
from app.extensions import db, migrate
from flask import request

api = Blueprint('api', __name__)

#  GET all users
@api.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    if not users:
        return jsonify({"message": "No users found"}), 200
    return jsonify([{"email": u.email, "name": u.name, "class_year": u.class_year} for u in users])


# # POST a new user
@api.route('/users', methods=['POST'])
def add_user():
    data = request.json
    user = User(email=data['email'], name=data['name'], class_year=data['class_year'])
    db.session.add(user)
    db.session.commit()
    return jsonify({"message": "User added successfully"}), 201

# # PUT (update) an existing user
@api.route('/users/<email>', methods=['PUT'])
def update_user(email):
    user = User.query.get(email)
    if not user:
        return jsonify({"error": "User not found"}), 404
    data = request.json
    user.name = data.get('name', user.name)
    user.class_year = data.get('class_year', user.class_year)
    db.session.commit()
    return jsonify({"message": "User updated successfully"})

# DELETE a user
@api.route('/users/<email>', methods=['DELETE'])
def delete_user(email):
    user = User.query.get(email)
    if not user:
        return jsonify({"error": "User not found"}), 404
    db.session.delete(user)
    db.session.commit()
    return jsonify({"message": "User deleted successfully"})


# JOBS
# GET all jobs
@api.route('/jobs', methods=['GET'])
def get_jobs():
    jobs = Job.query.all()
    return jsonify([{"job_id": j.job_id, "company_id": j.company_id, "job_title": j.job_title} for j in jobs])

# # POST a new job
@api.route('/jobs', methods=['POST'])
def add_job():
    data = request.json
    job = Job(company_id=data['company_id'], job_title=data['job_title'])
    db.session.add(job)
    db.session.commit()
    return jsonify({"message": "Job added successfully"}), 201

# # PUT (update) an existing job
@api.route('/jobs/<int:job_id>', methods=['PUT'])
def update_job(job_id):
    job = Job.query.get(job_id)
    if not job:
        return jsonify({"error": "Job not found"}), 404
    data = request.json
    job.job_title = data.get('job_title', job.job_title)
    db.session.commit()
    return jsonify({"message": "Job updated successfully"})

# # DELETE a job
@api.route('/jobs/<int:job_id>', methods=['DELETE'])
def delete_job(job_id):
    job = Job.query.get(job_id)
    if not job:
        return jsonify({"error": "Job not found"}), 404
    db.session.delete(job)
    db.session.commit()
    return jsonify({"message": "Job deleted successfully"})

# COMPANIES
# GET all companies
@api.route('/companies', methods=['GET'])
def get_companies():
    companies = Company.query.all()
    return jsonify([{"company_id": c.company_id, "name": c.name, "description": c.description} for c in companies])

# POST a new company
@api.route('/companies', methods=['POST'])
def add_company():
    data = request.json
    company = Company(name=data['name'], description=data.get('description'))
    db.session.add(company)
    db.session.commit()
    return jsonify({"message": "Company added successfully"}), 201

# PUT (update) an existing company
@api.route('/companies/<int:company_id>', methods=['PUT'])
def update_company(company_id):
    company = Company.query.get(company_id)
    if not company:
        return jsonify({"error": "Company not found"}), 404
    data = request.json
    company.name = data.get('name', company.name)
    company.description = data.get('description', company.description)
    db.session.commit()
    return jsonify({"message": "Company updated successfully"})

# DELETE a company
@api.route('/companies/<int:company_id>', methods=['DELETE'])
def delete_company(company_id):
    company = Company.query.get(company_id)
    if not company:
        return jsonify({"error": "Company not found"}), 404
    db.session.delete(company)
    db.session.commit()
    return jsonify({"message": "Company deleted successfully"})



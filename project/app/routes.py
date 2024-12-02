from flask import Blueprint, jsonify
from app.models import User, Job, Company, Interview, Application
from app.extensions import db, migrate
from flask import request

api = Blueprint('api', __name__)

## USERS

#  GET all users
@api.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    if not users:
        return jsonify({"message": "No users found"}), 200
    return jsonify([{"email": u.email, "name": u.name, "class_year": u.class_year} for u in users])

# GET a specific user by email
@api.route('/users/<string:email>', methods=['GET'])
def get_user_by_email(email):
    user = User.query.filter_by(email=email).first()
    if not user:
        return jsonify({"error": "User not found"}), 404

    return jsonify({
        "email": user.email,
        "name": user.name,
        "class_year": user.class_year
    })


# POST a new user
@api.route('/users', methods=['POST'])
def add_user():
    data = request.json
    user = User(email=data['email'], name=data['name'], class_year=data['class_year'])
    db.session.add(user)
    db.session.commit()
    return jsonify({"message": "User added successfully"}), 201

# PUT (update) an existing user
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
# -----------------------------------------------------------------

# JOBS
# GET all jobs
@api.route('/jobs', methods=['GET'])
def get_jobs():
    jobs = Job.query.all()
    return jsonify([{"job_id": j.job_id, "company_id": j.company_id, "job_title": j.job_title} for j in jobs])

# GET a specific job by job_id
@api.route('/jobs/<int:job_id>', methods=['GET'])
def get_job(job_id):
    job = Job.query.get(job_id)
    if not job:
        return jsonify({"error": "Job not found"}), 404
    return jsonify({
        "job_id": job.job_id,
        "company_id": job.company_id,
        "job_title": job.job_title
    })

# GET all jobs for a specific company
@api.route('/companyJobs', methods=['GET'])
def get_jobs_by_company():
    company_id = request.args.get('company_id', type=int)
    if company_id:
        jobs = Job.query.filter_by(company_id=company_id).all()
    else:
        jobs = Job.query.all()
    return jsonify([{"job_id": j.job_id, "company_id": j.company_id, "job_title": j.job_title} for j in jobs])


# POST a new job
@api.route('/jobs', methods=['POST'])
def add_job():
    data = request.json
    job = Job(company_id=data['company_id'], job_title=data['job_title'])
    db.session.add(job)
    db.session.commit()
    return jsonify({"message": "Job added successfully"}), 201

# PUT (update) an existing job
@api.route('/jobs/<int:job_id>', methods=['PUT'])
def update_job(job_id):
    job = Job.query.get(job_id)
    if not job:
        return jsonify({"error": "Job not found"}), 404
    data = request.json
    job.job_title = data.get('job_title', job.job_title)
    db.session.commit()
    return jsonify({"message": "Job updated successfully"})

# DELETE a job
@api.route('/jobs/<int:job_id>', methods=['DELETE'])
def delete_job(job_id):
    job = Job.query.get(job_id)
    if not job:
        return jsonify({"error": "Job not found"}), 404
    db.session.delete(job)
    db.session.commit()
    return jsonify({"message": "Job deleted successfully"})

#-------------------------------------------------------------------------------

# COMPANIES
# GET all companies
@api.route('/companies', methods=['GET'])
def get_companies():
    companies = Company.query.all()
    return jsonify([{"company_id": c.company_id, "name": c.name, "description": c.description} for c in companies])

# GET a specific company by ID
@api.route('/companies/<int:company_id>', methods=['GET'])
def get_company_by_id(company_id):
    company = Company.query.get(company_id)
    if not company:
        return jsonify({"error": "Company not found"}), 404

    return jsonify({
        "company_id": company.company_id,
        "name": company.name,
        "description": company.description
    })

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

# ------------------------------------------------------------------

#INTERVIEW
# GET all interviews for a specific application, given application id
@api.route('/interviews/<int:application_id>', methods=['GET'])
def get_interviews_for_application(application_id):
    interviews = Interview.query.filter_by(application_id=application_id).all()
    if not interviews:
        return jsonify({"error": "No interviews found for this application"}), 404
    return jsonify([{
        "interviewId": i.interview_id,
        "applicationId": i.application_id,
        "date": i.date,
        "round": i.round,
        "roundType": i.round_type
    } for i in interviews])


# POST a new interview
@api.route('/interviews', methods=['POST'])
def add_interview():
    data = request.json
    interview = Interview(
        application_id=data['applicationId'],
        date=data['date'],
        round=data['round'],
        round_type=data['roundType']
    )
    db.session.add(interview)
    db.session.commit()
    return jsonify({"message": "Interview added successfully"}), 201

# PUT (update) an existing interview
@api.route('/interviews/<int:interview_id>', methods=['PUT'])
def update_interview(interview_id):
    interview = Interview.query.get(interview_id)
    if not interview:
        return jsonify({"error": "Interview not found"}), 404
    data = request.json
    interview.date = data.get('date', interview.date)
    interview.round = data.get('round', interview.round)
    interview.round_type = data.get('roundType', interview.round_type)
    db.session.commit()
    return jsonify({"message": "Interview updated successfully"})

# DELETE an interview
@api.route('/interviews/<int:interview_id>', methods=['DELETE'])
def delete_interview(interview_id):
    interview = Interview.query.get(interview_id)
    if not interview:
        return jsonify({"error": "Interview not found"}), 404
    db.session.delete(interview)
    db.session.commit()
    return jsonify({"message": "Interview deleted successfully"})
#------------------------------------------------------------------------------------------------

# APPLICATION
#GET application by ID
@api.route('/applications/<int:application_id>', methods=['GET'])
def get_application(application_id):
    application = Application.query.get(application_id)
    if not application:
        return jsonify({"error": "Application not found"}), 404
    return jsonify({
        "application_id": application.application_id,
        "email": application.email,
        "job_id": application.job_id,
        "status": application.status,
        "additional_notes": application.additional_notes,
        "created_date": application.created_date.isoformat()
    })

# GET applications for given user
@api.route('/applications', methods=['GET'])
def get_applications_by_email():
    email = request.args.get('email')
    if not email:
        return jsonify({"error": "Email query parameter is required"}), 400

    applications = Application.query.filter_by(email=email).all()
    if not applications:
        return jsonify({"error": "No applications found for the specified user"}), 404

    return jsonify([
        {
            "application_id": a.application_id,
            "email": a.email,
            "job_id": a.job_id,
            "status": a.status,
            "additional_notes": a.additional_notes,
            "created_date": a.created_date.isoformat()
        } for a in applications
    ])


# POST a new application
@api.route('/applications', methods=['POST'])
def add_application():
    data = request.json
    application = Application(
        email=data['email'],
        job_id=data['job_id'],
        status=data['status'],
        additional_notes=data.get('additional_notes'),
        created_date=data['created_date']
    )
    db.session.add(application)
    db.session.commit()
    return jsonify({"message": "Application added successfully"}), 201

# PUT an existing application
@api.route('/applications/<int:application_id>', methods=['PUT'])
def update_application(application_id):
    application = Application.query.get(application_id)
    if not application:
        return jsonify({"error": "Application not found"}), 404
    data = request.json
    application.email = data.get('email', application.email)
    application.job_id = data.get('job_id', application.job_id)
    application.status = data.get('status', application.status)
    application.additional_notes = data.get('additional_notes', application.additional_notes)
    application.created_date = data.get('created_date', application.created_date)
    db.session.commit()
    return jsonify({"message": "Application updated successfully"})

#DELETE existing application
@api.route('/applications/<int:application_id>', methods=['DELETE'])
def delete_application(application_id):
    application = Application.query.get(application_id)
    if not application:
        return jsonify({"error": "Application not found"}), 404
    db.session.delete(application)
    db.session.commit()
    return jsonify({"message": "Application deleted successfully"})


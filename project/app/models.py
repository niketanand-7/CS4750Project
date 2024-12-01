from app.extensions import db

class User(db.Model):
    __tablename__ = 'user'
    __table_args__ = {'extend_existing': True}

    email = db.Column(db.String(255), primary_key=True, nullable=False)
    name = db.Column(db.String(255), nullable=False)
    class_year = db.Column('classYear', db.Integer, nullable=False)


class UserMajor(db.Model):
    __tablename__ = 'user_major'
    email = db.Column(db.String(255), db.ForeignKey('user.email', ondelete="CASCADE"), primary_key=True, nullable=False)
    major = db.Column(db.String(100), primary_key=True, nullable=False)


class Company(db.Model):
    __tablename__ = 'company'
    company_id = db.Column('companyId', db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)

    jobs = db.relationship('Job', backref='company', cascade="all, delete-orphan")


class Job(db.Model):
    __tablename__ = 'job'
    job_id = db.Column('jobId', db.Integer, primary_key=True, autoincrement=True)
    company_id = db.Column('companyId', db.Integer, db.ForeignKey('company.companyId', ondelete="CASCADE"), nullable=False)
    job_title = db.Column('jobTitle', db.String(255), nullable=False)

    locations = db.relationship('JobLocation', backref='job', cascade="all, delete-orphan")
    internship_details = db.relationship('Internship', backref='job', cascade="all, delete-orphan", uselist=False)
    fulltime_details = db.relationship('FullTime', backref='job', cascade="all, delete-orphan", uselist=False)
    applications = db.relationship('Application', backref='job', cascade="all, delete-orphan")


class JobLocation(db.Model):
    __tablename__ = 'job_location'
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('job.jobId', ondelete="CASCADE"), primary_key=True)
    location = db.Column(db.String(255), primary_key=True, nullable=False)



class Internship(db.Model):
    __tablename__ = 'internship'
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('job.jobId', ondelete="CASCADE"), primary_key=True)
    hourly_pay = db.Column('hourlyPay', db.Numeric(10, 2))
    start_date = db.Column('startDate', db.Date, nullable=False)
    end_date = db.Column('endDate', db.Date, nullable=False)

class FullTime(db.Model):
    __tablename__ = 'fullTime'
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('job.jobId', ondelete="CASCADE"), primary_key=True)
    start_date = db.Column('startDate', db.Date, nullable=False)
    salary = db.Column(db.Numeric(10, 2), nullable=False)
    benefits = db.relationship('FullTimeBenefits', backref='fulltime', cascade="all, delete-orphan")


class FullTimeBenefits(db.Model):
    __tablename__ = 'fullTime_benefits'
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('fullTime.jobId', ondelete="CASCADE"), primary_key=True)
    benefit = db.Column(db.String(255), primary_key=True, nullable=False)


class Application(db.Model):
    __tablename__ = 'application'
    application_id = db.Column('applicationId', db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String(255), db.ForeignKey('user.email', ondelete="CASCADE"), nullable=False)
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('job.jobId', ondelete="CASCADE"), nullable=False)
    status = db.Column(db.String(50), nullable=False)
    additional_notes = db.Column('additionalNotes', db.Text)
    created_date = db.Column('createdDate', db.Date, nullable=False)

    interviews = db.relationship('Interview', backref='application', cascade="all, delete-orphan")
    contains = db.relationship('Contains', backref='application', cascade="all, delete-orphan")


class Interview(db.Model):
    __tablename__ = 'interview'
    interview_id = db.Column('interviewId', db.Integer, primary_key=True, autoincrement=True)
    application_id = db.Column('applicationId', db.Integer, db.ForeignKey('application.applicationId', ondelete="CASCADE"), nullable=False)
    date = db.Column(db.Date, nullable=False)
    round = db.Column(db.Integer, nullable=False)
    round_type = db.Column('roundType', db.String(50), nullable=False)


class Contains(db.Model):
    __tablename__ = 'contains'
    application_id = db.Column('applicationId', db.Integer, db.ForeignKey('application.applicationId', ondelete="CASCADE"), primary_key=True)
    interview_id = db.Column('interviewId', db.Integer, db.ForeignKey('interview.interviewId', ondelete="CASCADE"), primary_key=True)

class Submits(db.Model):
    __tablename__ = 'submits'
    email = db.Column(db.String(255), db.ForeignKey('user.email', ondelete="CASCADE"), primary_key=True)
    application_id = db.Column('applicationId', db.Integer, db.ForeignKey('application.applicationId', ondelete="CASCADE"), primary_key=True)


class LocatedAt(db.Model):
    __tablename__ = 'locatedAt'
    company_id = db.Column('companyId', db.Integer, db.ForeignKey('company.companyId', ondelete="CASCADE"), primary_key=True)
    job_id = db.Column('jobId', db.Integer, db.ForeignKey('job.jobId', ondelete="CASCADE"), primary_key=True)

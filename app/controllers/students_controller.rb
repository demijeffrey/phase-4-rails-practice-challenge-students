class StudentsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def create
        new_student = Student.create!(student_params)
        render json: new_student, status: :created
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student, status: :accepted
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def invalid_record(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def record_not_found
        render json: { error: "student not found" }, status: :not_found
    end

end

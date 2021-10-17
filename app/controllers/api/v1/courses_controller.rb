module Api
  module V1
		class CoursesController < ApplicationController
			before_action :authenticate_user!
			before_action :find_course, only: [:show,:destroy,:update]

			def index
         courses = Course.all
        if courses.present?
          render json:  {courses: courses, status: :success, message: "Got all course successfully"}
        else
          render json:  {courses: [], status: :success, message: "No course found"}
        end
      end
      
      def create
        course = Course.new(course_params)
        if course.save
          render json:  {course: course, status: :success, message: "course created successfully"}
        else
          render json:  {course: [], message: course.formatted_error, status: :unprocessable_entity}
        end
      end

      def show
        if @course
          render json:  {course: @course, status: :success, message: "course found successfully"}
        else
          render json:  {course: [], status: :failure, message: "course not present"}
        end
      end

      def destroy
        if @course && @course.destroy
          render json: {status: :success, message: "course delete successfully"}
        else
          render json: {status: :failure, message: "course info delete failed"}
        end
      end

      def update
        if @course && @course.update_attributes(course_params)
          render json: {course: @course, status: :success, message: "course update successfully"}
        else
          render json: {course: [], status: :failure, message: "course not update successfully"}
        end
      end
      
      private

      def find_course
        @course = Course.find_by_id(params[:id])
      end

      def course_params
        params.require(:course).permit(:name, :student_id)
      end

		end
  end
end

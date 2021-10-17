module Api
  module V1
		class ExamsController < ApplicationController
			before_action :authenticate_user!
			before_action :find_exam, only: [:show,:destroy,:update]

      def index
         exams = Exam.all
        if exams.present?
          render json:  {exams: exams, status: :success, message: "Got all exam successfully"}
        else
          render json:  {exams: [], status: :success, message: "No exam found"}
        end
      end
      
      def create
        exam = Exam.new(exam_params)
        
        if exam.save
          render json:  {exam: exam, status: :success, message: "exam created successfully"}
        else
          render json:  {exam: [], message: exam.formatted_error, status: :unprocessable_entity}
        end
      end

      def show
        if @exam
          render json:  {exam: @exam, status: :success, message: "exam found successfully"}
        else
          render json:  {exam: [], status: :failure, message: "exam not present"}
        end
      end

      def destroy
        if @exam && @exam.destroy
          render json: {status: :success, message: "exam delete successfully"}
        else
          render json: {status: :failure, message: "exam info delete failed"}
        end
      end

      def update
        if @exam && @exam.update_attributes(exam_params)
          render json: {exam: @exam, status: :success, message: "exam update successfully"}
        else
          render json: {exam: [], status: :failure, message: "exam not update successfully"}
        end
      end
      
      private

      def find_exam
        @exam = Exam.find_by_id(params[:id])
      end

      def answer_params
        params.require(:exam).permit(:name, :date_from, :date_to, :timing, :no_of_questions)
      end

		end
  end
end
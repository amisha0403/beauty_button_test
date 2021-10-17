module Api
  module V1
		class AnswersController < ApplicationController
			before_action :authenticate_user!
			before_action :find_answer, only: [:show,:destroy,:update]

      def index
         answers = Answer.all
        if answers.present?
          render json:  {answers: answers, status: :success, message: "Got all answer successfully"}
        else
          render json:  {answers: [], status: :success, message: "No answer found"}
        end
      end
      
      def create
        answer = Answer.new(answer_params)
        if answer.save
          render json:  {answer: answer, status: :success, message: "answer created successfully"}
        else
          render json:  {answer: [], message: answer.formatted_error, status: :unprocessable_entity}
        end
      end

      def show
        if @answer
          render json:  {answer: @answer, status: :success, message: "answer found successfully"}
        else
          render json:  {answer: [], status: :failure, message: "answer not present"}
        end
      end

      def destroy
        if @answer && @answer.destroy
          render json: {status: :success, message: "answer delete successfully"}
        else
          render json: {status: :failure, message: "answer info delete failed"}
        end
      end

      def update
        if @answer && @answer.update_attributes(answer_params)
          render json: {answer: @answer, status: :success, message: "answer update successfully"}
        else
          render json: {answer: [], status: :failure, message: "answer not update successfully"}
        end
      end
      
      private

      def find_answer
        @answer = Answer.find_by_id(params[:id])
      end

      def answer_params
        params.require(:answer).permit(:question_id, :answer, :is_correct)
      end

		end
  end
end

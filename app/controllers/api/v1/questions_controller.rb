module Api
  module V1
		class QuestionsController < ApplicationController
			before_action :authenticate_user!
			before_action :find_question, only: [:show,:destroy,:update]

			def index
         questions = Question.all
        if questions.present?
          render json:  {questions: questions, status: :success, message: "Got all question successfully"}
        else
          render json:  {questions: [], status: :success, message: "No question found"}
        end
      end
      
      def create
        question = Question.new(question_params)
        if question.save
          render json:  {question: question, status: :success, message: "question created successfully"}
        else
          render json:  {question: [], message: question.formatted_error, status: :unprocessable_entity}
        end
      end

      def show
        if @question
          render json:  {question: @question, status: :success, message: "question found successfully"}
        else
          render json:  {question: [], status: :failure, message: "question not present"}
        end
      end

      def destroy
        if @question && @question.destroy
          render json: {status: :success, message: "question delete successfully"}
        else
          render json: {status: :failure, message: "question info delete failed"}
        end
      end

      def update
        if @question && @question.update_attributes(question_params)
          render json: {question: @question, status: :success, message: "question update successfully"}
        else
          render json: {question: [], status: :failure, message: "question not update successfully"}
        end
      end
      
      private

      def find_question
        @question = Question.find_by_id(params[:id])
      end

      def question_params
        params.require(:question).permit(:exam_question_id, :question)
      end
		end
  end
end

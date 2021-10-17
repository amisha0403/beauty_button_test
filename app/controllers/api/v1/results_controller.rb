module Api
  module V1
		class ResultsController < ApplicationController
			before_action :authenticate_user!
			before_action :find_result, only: [:show,:destroy,:update]

      def index
         results = Result.all
        if results.present?
          render json:  {results: results, status: :success, message: "Got all result successfully"}
        else
          render json:  {results: [], status: :success, message: "No result found"}
        end
      end
      
      def create
        result = result.new(result_params)
        if result.save
          render json:  {result: result, status: :success, message: "result created successfully"}
        else
          render json:  {result: [], message: result.formatted_error, status: :unprocessable_entity}
        end
      end

      def show
        if @result
          render json:  {result: @result, status: :success, message: "result found successfully"}
        else
          render json:  {result: [], status: :failure, message: "result not present"}
        end
      end

      def destroy
        if @result && @result.destroy
          render json: {status: :success, message: "result delete successfully"}
        else
          render json: {status: :failure, message: "result info delete failed"}
        end
      end

      def update
        if @result && @result.update_attributes(result_params)
          render json: {result: @result, status: :success, message: "result update successfully"}
        else
          render json: {result: [], status: :failure, message: "result not update successfully"}
        end
      end
      
      private

      def find_result
        @result = Result.find_by_id(params[:id])
      end

      def result_params
        params.require(:result).permit(:student_id, :exam_id, :no_correct, :no_incorrect, :score, :result)
      end

		end
  end
end
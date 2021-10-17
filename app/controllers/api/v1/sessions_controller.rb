module Api
  module V1
    class SessionsController < Devise::SessionsController
      def create
        user = warden.authenticate!(auth_options) 
        student_details = []
        if user
          token = Tiddle.create_and_return_token(user, request, expires_in: 1.month)
          student_details = {id: user.id, email: user.email, authentication_token: token, name: user.name, phone_number: user.phone_number, enrollment_number: user.enrollment_number, address: user.address}
          render json: { message: "User successfully logged in", student_details: student_details, status: 200 } 
        else
          render json: {message: "User not logging"}
        end
      end

      def destroy
        if current_user && Tiddle.expire_token(current_user, request)
          head :ok
        else
          render json: { error: 'invalid token' }, status: 401
        end
      end

      protected
      def verify_signed_out_user; end

      def resource_name
        :user
      end

    end
  end 
end

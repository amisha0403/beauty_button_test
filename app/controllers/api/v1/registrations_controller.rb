module Api  
  module V1
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_permitted_parameters
      skip_before_action :verify_authenticity_token

      def create
        ActiveRecord::Base.transaction do
          build_resource(sign_up_params)
          resource.save
          yield resource if block_given?
          unless resource.persisted?
            clean_up_passwords resource
            set_minimum_password_length
            return render json:{errors: resource.errors.as_json}
          end
          if resource.active_for_authentication?
            sign_up(resource_name, resource)
          else
            expire_data_after_sign_in!
          end
          @user = resource
          @token = Tiddle.create_and_return_token(@user, request, expires_in: 1.month)
          render json: { user: resource, authentication_token: @token, status: :success, message: "User created successfully" }
        end
      end

      protected
      def configure_permitted_parameters
        param_keys = [:name, :email, :password, :password_confirmation, :phone_number, :enrollment_number, :address]
        devise_parameter_sanitizer.permit(:sign_up, keys: param_keys)
      end

      def resource_name
        :user
      end

    end
  end
end

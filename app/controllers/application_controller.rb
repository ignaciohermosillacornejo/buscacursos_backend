class ApplicationController < ActionController::API

    include ActionController::RequestForgeryProtection
    #protect_from_forgery unless: -> { request.format.json? }

    def authenticate
        return render "status/400_bad_request", status: :bad_request unless authorization_token?
        return render "status/401_unauthorized", status: :unauthorized unless user_signed_in?
    end

    def optional_authentication
        if authorization_token?
            current_user
        end
    end


    private

        def current_token
            @authorization_token ||= request.headers["Authorization"]
        end

        def current_user
            @current_user ||= User.find_by(oauth_token: @authorization_token)
        end

        def authorization_token?
            !!current_token
        end

        def user_signed_in?
            # converts current_user to a boolean by negating the negation
            !!current_user
        end
end

module Cabinet
  module Client
    class SubscriptionsController < BaseController
      expose_decorated :subscription
      expose_decorated :courses, -> { fetch_courses }

      def index
      end

      def create
        subscription.save

        respond_with subscription, location: cabinet_client_subscriptions_path
      end

      private

      def subscription_params
        params.require(:subscription).permit(:user_id, :course_id)
      end

      def fetch_courses
        current_user.courses
      end
    end
  end
end

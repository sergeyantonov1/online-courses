module Cabinet
  module Client
    class SubscriptionsController < BaseController
      expose_decorated :subscription
      expose_decorated :courses, -> { fetch_courses }

      def index
      end

      def create
        subscription.user_id = current_user.id
        subscription.course_id = params[:course_id]

        subscription.save

        respond_with subscription, location: cabinet_client_subscriptions_path
      end

      private

      def fetch_courses
        current_user.courses
      end
    end
  end
end

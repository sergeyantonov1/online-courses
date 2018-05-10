module Cabinet
  module Client
    class SubscriptionsController < BaseController
      expose_decorated :subscription, -> { fetch_subscription }
      expose_decorated :courses, -> { fetch_courses }

      def index
      end

      def create
        subscription.user_id = current_user.id
        subscription.course_id = params[:course_id]
        subscription.status = "new"

        subscription.save

        respond_with subscription, location: cabinet_client_subscriptions_path
      end

      private

      def fetch_courses
        current_user.courses
      end

      def fetch_subscription
        subscription = Subscription.find_by(course_id: params[:course_id], user_id: current_user.id)
        subscription = Subscription.new if subscription.nil?

        subscription
      end
    end
  end
end

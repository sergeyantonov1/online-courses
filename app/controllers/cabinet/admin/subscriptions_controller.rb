module Cabinet
  module Admin
    class SubscriptionsController < BaseController
      expose_decorated :subscription
      expose_decorated :subscriptions, -> { fetch_subscriptions }

      def index
      end

      def approve
        subscription.update(status: "approved")

        respond_with subscription, location: cabinet_admin_subscriptions_path
      end

      def cancel
        subscription.update(status: "canceled")

        respond_with subscription, location: cabinet_admin_subscriptions_path
      end

      private

      def fetch_subscriptions
        Subscription.includes(:user).where(status: "new")
      end
    end
  end
end

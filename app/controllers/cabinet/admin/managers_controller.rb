module Cabinet
  module Admin
    class ManagersController < BaseController
      expose_decorated :managers, -> { fetch_managers }

      private

      def fetch_managers
        Managers::AllExceptCurrentManager.new(
          Manager.all,
          manager_id: current_manager.id,
          page: params[:page]
        ).all
      end
    end
  end
end

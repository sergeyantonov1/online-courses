module Cabinet
  class ManagersController < BaseController
    expose_decorated :managers, -> { fetch_managers }

    private

    def fetch_managers
      Managers::AllExceptCurrentManager.new(
        Manager.all,
        current_manager: current_manager,
        page: params[:page]
      ).all
    end
  end
end

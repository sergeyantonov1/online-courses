module Managers
  class InvitationsController < Devise::InvitationsController
    def new
      authorize_manager ? super : redirect_to(root_path)
    end

    private

    def authorize_manager
      current_manager && current_manager&.super_manager
    end
  end
end

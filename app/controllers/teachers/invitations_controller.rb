module Teachers
  class InvitationsController < Devise::InvitationsController

    def new
      current_manager ? super : redirect_to(root_path)
    end

    private

    def authenticate_inviter!
      send(:"authenticate_manager!", force: true)
    end
  end
end

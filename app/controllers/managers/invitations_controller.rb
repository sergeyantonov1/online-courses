module Managers
  class InvitationsController < Devise::InvitationsController
    def new
      super
    end
  end
end

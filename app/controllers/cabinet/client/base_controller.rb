module Cabinet
  module Client
    class BaseController < ApplicationController
      before_action :authenticate_user!
    end
  end
end

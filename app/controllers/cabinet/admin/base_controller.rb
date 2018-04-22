module Cabinet
  module Admin
    class BaseController < ApplicationController
      before_action :authenticate_manager!
    end
  end
end

module Cabinet
  class BaseController < ApplicationController
    before_action :authenticate_manager!
  end
end

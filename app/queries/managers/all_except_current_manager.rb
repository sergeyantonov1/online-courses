module Managers
  class AllExceptCurrentManager < BaseQuery
    def all
      apply_managers
    end

    private

    def apply_managers
      Manager.where.not(id: params[:current_manager])
    end
  end
end

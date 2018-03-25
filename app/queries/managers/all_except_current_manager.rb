module Managers
  class AllExceptCurrentManager < BaseQuery
    def all
      apply_managers
      paginate
    end

    private

    def apply_managers
      @relation.where.not(id: params[:current_manager])
    end

    def paginate
      @relation.page(params[:page]).per(DEFAULT_PER_PAGE)
    end
  end
end

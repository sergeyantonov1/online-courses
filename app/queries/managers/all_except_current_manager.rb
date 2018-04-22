module Managers
  class AllExceptCurrentManager < BaseQuery
    def all
      apply_managers
      paginate
    end

    private

    def apply_managers
      @relation = @relation.where.not(id: params[:manager_id])
    end

    def paginate
      @relation = @relation.page(params[:page]).per(DEFAULT_PER_PAGE)
    end
  end
end

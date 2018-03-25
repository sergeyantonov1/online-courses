class BaseQuery
  attr_reader :relation, :params

  DEFAULT_PER_PAGE = 10

  def initialize(relation, params = {})
    @relation = relation
    @params = params
  end

  def all
  end
end

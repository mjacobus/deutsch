require 'json'

class Collection < SimpleDelegator
  def initialize(collection = [])
    super(collection)
  end

  def to_json
    JSON.generate(map(&:to_h))
  end

  def paginate(per_page: 100, page: 1)
    Pagination.new(collection: self, page: page, per_page: per_page)
  end

  def shuffle
    self.class.new(super)
  end

  def remove_duplicate(attribute_name)
    unique_values = uniq do |element|
      element.send(attribute_name).downcase
    end

    self.class.new(unique_values)
  end

  def sort_by_attribute(attribute_name)
    new_collection = __getobj__.sort_by(&attribute_name)
    self.class.new(new_collection)
  end
end

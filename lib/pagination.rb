class Pagination < Collection
  attr_reader :current_page_number, :per_page

  def initialize(collection: [], page: 1, per_page: 50)
    super([])
    self.per_page = per_page
    self.current_page_number = page

    collection_class = collection.class

    collection.each_slice(self.per_page).map do |elements|
      push(collection_class.new(elements))
    end
  end

  def current_page
    pages[current_page_number - 1]
  end

  def pages
    to_a
  end

  private

  def per_page=(per_page)
    @per_page = per_page.to_i
    @per_page = 50 if @per_page < 1
  end

  def current_page_number=(page_number)
    begin
      @current_page_number = Integer(page_number)
    rescue
      @current_page_number = 1
    end

    @current_page_number = 1 if @current_page_number < 1
  end
end


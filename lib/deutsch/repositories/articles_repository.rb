class ArticlesRepository
  Entity = Struct.new(:article, :noun, :translation)
  def initialize(file_path:, csv_parser:)
    @file_path = file_path
    @csv_parser = csv_parser
  end

  def fetch_all(per_page: nil, page: nil)
    Collection.new.tap do |collection|
      string = File.read(@file_path).force_encoding(Encoding::UTF_8)
      @csv_parser.parse(string) do |column|
        collection << filter(column)
      end
    end.sort_by_attribute(:noun).paginate(per_page: per_page, page: page)
  end

  private

  def filter(column)
    Entity.new(
      column['article'].to_s.capitalize.strip,
      column['noun'].to_s.capitalize.strip,
      column['translation'].to_s.capitalize.strip
    )
  end
end

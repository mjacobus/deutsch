class ArticlesRepository
  Entity = Struct.new(:article, :noun, :translation)
  def initialize(file_path:, csv_parser:)
    @file_path = file_path
    @csv_parser = csv_parser
  end

  def fetch_all(limit: nil, page: nil)
    collection = []
    string = File.read(@file_path).force_encoding(Encoding::UTF_8)
    @csv_parser.parse(string) do |column|
      collection << filter(column)
    end
    collection.sort_by(&:noun)
  end

  private

  def filter(column)
    Entity.new(
      column['article'].capitalize,
      column['noun'].capitalize,
      column['translation'].capitalize,
    )
  end
end

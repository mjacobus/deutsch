module Factories
  class ArticlesRepositoryFactory < Nurse::ServiceFactory
    def dependency_key
      :articles_repository
    end

    def create_service(container)
      ArticlesRepository.new(
        file_path: Hanami.root.join("data", "articles.csv"),
        csv_parser: Koine::Csv::NamedColumnsParser.new(
          col_sep: ",",
          quote_char: '"'
        )
      )
    end
  end
end

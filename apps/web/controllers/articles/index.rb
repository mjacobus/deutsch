module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :articles

    def call(params)
      @articles = ApplicationDependencies.get(:articles_repository).fetch_all(
        per_page: 10000,
        page: 1
      )
    end
  end
end

module Web::Controllers::Articles
  class Test
    include Web::Action

    expose :articles

    def call(params)
      filename = params[:filename] || 'articles'
      factory = Factories::ArticlesRepositoryFactory.new
      repository = factory.create_service(nil, filename: filename)

      per_page = params[:per_page] || 100

      @articles = repository.fetch_all(per_page: per_page, page: params[:page])
    end
  end
end

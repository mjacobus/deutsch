module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :articles

    def call(params)
      @articles = ApplicationDependencies.get(:articles_repository).fetch_all(
        limit: params[:per_page],
        page: params[:page],
      )
    end
  end
end

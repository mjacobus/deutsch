module Web::Controllers::Articles
  class Test
    include Web::Action

    expose :articles

    def call(params)
      @articles = ApplicationDependencies.get(:articles_repository).fetch_all(
        per_page: params[:per_page],
        page: params[:page],
      )
    end
  end
end

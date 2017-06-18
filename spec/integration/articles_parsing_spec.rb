require 'spec_helper'

RSpec.describe 'articles parsing' do
  it 'parses files' do
    skip if ENV['CODE_COVERAGE']

    articles = ApplicationDependencies.get(:articles_repository).fetch_all(
      per_page: 10,
      page: 1,
    )

    expect(articles.size > 10).to be(true)
  end
end

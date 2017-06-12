require_relative '../../../../apps/web/controllers/articles/test'

RSpec.describe Web::Controllers::Articles::Test do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end

require_relative '../../../../apps/web/controllers/index/index'

RSpec.describe Web::Controllers::Index::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end

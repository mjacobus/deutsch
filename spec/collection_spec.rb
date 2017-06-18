require 'spec_helper'

RSpec.describe Collection do
  let(:elements) do
    (1..10).to_a
  end

  subject do
    Collection.new(elements)
  end

  describe '#paginate' do
    it 'can paginate' do
      paginated = subject.paginate(per_page: 3)

      expect(paginated.pages.length).to eq(4)
      expect(paginated.pages[0]).to eq(Collection.new([1, 2, 3]))
      expect(paginated.pages[1]).to eq(Collection.new([4, 5, 6]))
      expect(paginated.pages[2]).to eq(Collection.new([7, 8, 9]))
      expect(paginated.pages[3]).to eq(Collection.new([10]))
    end

    it 'can set the current page' do
      paginated = subject.paginate(per_page: 3, page: 2)

      expect(paginated.current_page_number).to eq(2)
      expect(paginated.current_page).to eq(paginated.pages[1])
    end

    it 'can convert page number to integer' do
      expect(subject.paginate(page: '1').current_page_number).to eq(1)
      expect(subject.paginate(page: '').current_page_number).to eq(1)
      expect(subject.paginate(page: '2').current_page_number).to eq(2)
      expect(subject.paginate(page: '-2').current_page_number).to eq(1)
    end

    it 'can coerce per page' do
      expect(subject.paginate(per_page: '1').per_page).to eq(1)
      expect(subject.paginate(per_page: '2').per_page).to eq(2)
      expect(subject.paginate(per_page: '').per_page).to eq(50)
      expect(subject.paginate(per_page: '-2').per_page).to eq(50)
    end
  end

  it 'can shuffle the colleciton' do
    shuffled = subject.shuffle

    expect(shuffled).to be_a(Collection)
    expect(shuffled.sort).to eq(subject)
    expect(shuffled.to_a).not_to eq(subject.to_a)
  end

  describe '#remove_duplicate' do
    it 'makes elements unique by key' do
      Element = Struct.new(:name, :last_name)

      el1 = Element.new('Marcelo', 'Silva')
      el2 = Element.new('Marcelo', 'JACOBUS')
      el3 = Element.new('Pamela', 'Jacobus')

      result = Collection.new([el1, el2, el3]).remove_duplicate(:last_name)

      expect(result).to eq(Collection.new([el1, el2]))
    end
  end

  describe '#sort_by_attribute' do
    it 'sort elements by' do
      DummyNumber = Struct.new(:number)

      el1 = DummyNumber.new(1)
      el2 = DummyNumber.new(2)
      el3 = DummyNumber.new(3)

      result = Collection.new([el2, el1, el3]).sort_by_attribute(:number)

      expect(result).to eq(Collection.new([el1, el2, el3]))
    end
  end
end

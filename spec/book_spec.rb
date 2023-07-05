require_relative '../book'

describe Book do
  describe "#can_be_archived?" do
    let(:label) { Label.new('red', 'Important') }
   let(:item) { Item.new('genre', 'author', 'source', 'label', 'publish_date', 'archived') }
   

    it "adds an item to the label" do
      label.add_item(item)
      expect(label.items.size).to eq(1)
      expect(label.items.first).to eq(item)
      expect(item.label).to eq(label)
    end
  end
end
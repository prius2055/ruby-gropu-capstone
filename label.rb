require './item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(color, title)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end

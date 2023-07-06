require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(author, publish_date, archived, publisher, cover_state)
    super(author, label, publish_date, archived, 'fiction')
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    if move_to_archive || @cover_state == 'bad'
      true
    else
      false
    end
  end
end

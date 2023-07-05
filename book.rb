require './item'

class Book < Item
    attr_accessor :publisher, :cover_state
  def initialize(author, source, publish_date, archived, publisher, cover_state, label = nil, genre = 'fiction')
    super(genre, author, source, label, publish_date, archived)
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

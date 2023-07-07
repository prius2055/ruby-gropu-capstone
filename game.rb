require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(publish_date, multiplayer, last_played_at)
    super(nil, nil, publish_date, nil, nil)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    
  end

  def can_be_archived?
    last_played_date = DateTime.parse(last_played_at).to_date
    archived = (Date.today.year - last_played_date.year) > 2

    if move_to_archive || archived
      true
    else
      false
    end
  end
end

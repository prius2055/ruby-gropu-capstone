class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(author, label, publish_date, archived, genre)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    should_be_archived = Time.now.year - @publish_date
    should_be_archived > 10
  end
end

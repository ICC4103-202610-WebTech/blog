class Post < ApplicationRecord
  has_rich_text :body
  validates :title, presence: true
  #validates :content, presence: true

  before_validation :clean_title

  private
  def clean_title
    self.title = title.strip.titleize
  end

end

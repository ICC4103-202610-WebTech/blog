class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  before_validation :clean_title

  private
  def clean_title
    self.title = title.strip.titleize
  end

end

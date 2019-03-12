class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    ["Won't Believe", "Secret", "Top [number]", "Guess"].any? do |e|
      !title.include?(e) if title
    end
  end
end

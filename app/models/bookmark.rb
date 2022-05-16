class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6, message: "Comment should be at least 6 characters" }
  validates :movie, uniqueness: { scope: :list, message: "Movie already added" }
end

class Movie < ApplicationRecord
  validates :title, presence: true
  validates :creation_year, presence: true, numericality: true
  validates :genre, presence: true
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_youngest_to_oldest
    actors.order(age: :asc).pluck(:name)
  end

  def average_age_of_actors
    actors.average(:age)
  end
end

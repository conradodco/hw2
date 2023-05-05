class Movie < ApplicationRecord
    belongs_to :studio
    has_many :roles, dependent: :destroy
    has_many :actors, through: :roles
  end
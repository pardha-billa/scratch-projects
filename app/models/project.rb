class Project < ApplicationRecord
  validates :description, presence: true
  validates :name, 
    presence: true,
    length: {
      in: 2..8, 
      too_short: "must have atleast two characters",
      too_long: "should not have more than 8 characters"
    },
    format: {
      with: /\A[a-z]+\z/i,
      message: "should not contain any numeric values"
    }



end

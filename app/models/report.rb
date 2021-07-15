class Report < ApplicationRecord
  belongs_to :user

  def self.assign_from_row(row)
    # add something
  end
end

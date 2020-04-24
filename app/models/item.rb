class Item < ApplicationRecord
  belongs_to :user

  def completed?
    !completed_at.blank?
    # meaning, an item is completed, if the completed_at attribute is not blank
  end
end

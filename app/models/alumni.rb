class Alumni < ApplicationRecord
  has_many :users, as: :actable, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end

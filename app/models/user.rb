class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :notifications, dependent: :destroy
  belongs_to :actable, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[actable]
  end
end

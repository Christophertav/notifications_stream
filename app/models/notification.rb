class Notification < ApplicationRecord
  belongs_to :user

  enum notification_type: {
    notice: 1,
    alert: 2
  }

  after_create :broadcast_to_user

  def broadcast_to_user
    broadcast_prepend_to(
      "#{ActionController::Base.helpers.dom_id(user)}_notifications",
      partial: "channels/notifications/notification"
    )
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end

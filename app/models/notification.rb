class Notification < ApplicationRecord
  belongs_to :user

  enum notification_type: {
    notice: 1,
    alert: 2,
    success: 3
  }
  # app/models/notification.rb

  # après la création d'une Notification -> on broadcast vers les users subscribed au stream 'notifications' et qu'on l'on doit ajouter le contenu de la partial "notifications/notification" à l'élément du DOM avec l'id 'notifications'
  # after_create -> {
  #   broadcast_prepend_to("notifications",
  #     partial: "notifications/notification",
  #     locals: { notification: self },
  #     target: "notifications")
  # }

  after_create -> {
    broadcast_render_later_to("#{ActionController::Base.helpers.dom_id(user)}_notifications", locals: { user: user})
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[title content notification_type]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end

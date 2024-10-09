class NotificationsController < ApplicationController

  def index
    @all_notifications = Notification.all
    @query = @all_notifications.ransack(params[:q])
    if params[:q].present?
      @search_params = search_params
      @query = @all_notifications.ransack(@search_params)
    end
    @all_notifications = @query.result(distinct: true)
    @pagy, @notifications = pagy_countless(@all_notifications, limit: 8)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
  def new
    @notification = Notification.new(
      title: 'Some title',
      content: 'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
      notification_type: 1,
      user: User.last
    )
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to new_notification_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:user_id, :content, :title, :notification_type)
  end

  def search_params
    params.require(:q).permit(:title_i_cont, :content_i_cont, :notification_type_eq, :user_id_eq, :user_actable_of_Company_type_name_or_user_actable_of_Alumni_type_name_i_cont, :s)
  end
end

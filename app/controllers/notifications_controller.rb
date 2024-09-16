class NotificationsController < ApplicationController

  def index
    @all_notifications = Notification.all
    @query = @all_notifications.ransack(params[:q])
    if params[:q].present?
      @search_params = search_params
      @query = @all_notifications.ransack(@search_params)
    end
    @notifications = @query.result(distinct: true)

    respond_to do |format|
      format.html
      format.turbo_stream { render turbo_stream: turbo_stream.update(:table_notifications, partial: 'table', locals: { notifications: @notifications }) }
    end
  end
  def new
    @test = true
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
    params.require(:q).permit(:title_i_cont, :content_i_cont, :user_id_eq)
  end
end

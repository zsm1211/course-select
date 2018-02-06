class NoticesController < ApplicationController
  def index
    @notice = Notice.all.order("updated_at DESC")
  end

  def detail
    puts(params[:id])
    @notice = Notice.find_by_id(params[:id])
  end
end

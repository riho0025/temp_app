class RecordsController < ApplicationController
  # before_action :authenticate_user![:index]
  before_action :correct_user, only: [:destroy]

  def index
    @user = current_user
    @records = current_user.records
    @graph_records = current_user.records.pluck(:value)
    @graph_date = current_user.records.pluck(:date).map{|date| date.strftime("%m/%d")}
  end

  def new
    @record = Record.new
    @user = current_user
    @graph_records = current_user.records.pluck(:value)
    @graph_date = current_user.records.pluck(:date).map{|date| date.strftime("%m/%d")}
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:notice] = '体温を投稿しました。'
    else
      @records = current_user.records.includes(:user)
      flash[:alert] = '体温の投稿に失敗しました。'
    end
    redirect_to root_path
  end

  private

  def record_params
    params.require(:record).permit(:value, :date)
  end
  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @record
      redirect_to root_url
    end
  end
end

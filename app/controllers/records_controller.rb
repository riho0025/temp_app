class RecordsController < ApplicationController
  # before_action :authenticate_user![:index]
  before_action :correct_user, only: [:destroy]

  # def search
  #   @users = User.search(params[:search])
  # end

  def index
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
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
    redirect_to record_path(current_user)
  end

  def show
    if user_signed_in?
      @user = current_user
      @users = User.all.where.not(id: current_user.id)
      @records = current_user.records
      @graph_records = current_user.records.pluck(:value)
      @graph_date = current_user.records.pluck(:date).map{|date| date.strftime("%m/%d")}
    end
  end


  # def self.search(search)
  #   if search
  #     User.where(['user.name LIKE ?', "%#{search}%"])
  #   else
  #     User.all.where.not(id: current_user.id)
  #   end
  # end



  private

  def record_params
    params.require(:record).permit(:value, :date).merge(user_id: current_user.id)
  end
  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @record
      redirect_to root_url
    end
  end
end

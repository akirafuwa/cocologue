class DiariesController < ApplicationController
  before_action :require_user_logged_in, :set_current_user
  before_action :correct_user, only: [:destroy]

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      flash[:success] = '日記が正常に投稿されました'
      redirect_to "/dashboard/#{@diary.diary_date.strftime("%Y-%m")}"
    else
      flash.now[:danger] = '日記が投稿されませんでした'
      render template: "dashboards/index"
    end
  end

  def destroy
    @diary.destroy
    flash[:success] = '日記を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def correct_user
    @diary = current_user.diaries.find_by(id: params[:id])
    unless @diary
      redirect_to root_url
    end
  end

  #strong parameter
  def diary_params
    params.require(:diary).permit(:content, :woke_up_at, :slept_at, :activity, :mood, :appetite, :walking, :diary_date)
  end
end

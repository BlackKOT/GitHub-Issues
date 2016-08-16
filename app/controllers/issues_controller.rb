class IssuesController < ApplicationController
  before_action :set_issue, only: [:show]

  def index
    @issues = Issue
    @predicate = params[:filter][:predicate] if params[:filter]
    @issues = @issues.filtered(@predicate)
  end

  def show
  end

  def create
    err = Issue::parse(params[:issue])

    if err
      flash.now[:alert] = "Error: #{err}"
      render :new
    else
      redirect_to issues_path, notice: 'Issues successfully parsed'
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:title, :body, :project_name, :user_name)
    end
end

class IssuesController < ApplicationController
  before_action :set_issue, only: [:show]

  def index
    @issues = Issue
    @issues.filtered(params[:filter]) if params[:filter]
  end

  def show
  end

  def create
    err = Issue::parse(params[:user_name], params[:project_name])

    if err
      render :new, alert: err
    else
      redirect_to :index, notice: 'Issues successfully parsed'
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

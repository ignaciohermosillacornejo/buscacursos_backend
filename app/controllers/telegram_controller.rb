class TelegramController < ApplicationController
 
  before_action :set_command, only: [:callback]

  # GET /webhooks (.json)
  def callback

    case @command
    when '/help'
      render "bot/help", status: :ok
    when '/list'
      list_reports
    when '/get'
      get_report
    when '/reject'
      reject_report
    when '/accept'
      accept_report
    else
      render "bot/no_command", status: :ok
    end
  end

  def list_reports
    @reports = Report.where(state: 1).all
    render "bot/list", status: :ok
  end

  def get_report
    if @report
      render "bot/get", status: :ok
    else
      render "bot/id_not_found", status: :ok
    end
  end

  def reject_report

    if @report
      @user = @report.review.user
      if @report.review.destroy
		    @user.faults += 1
        if (@user.faults > 3)
          @user.banned = true
        end
		    @user.save!
        @report.state = 2
        @report.save!
        render "bot/reject", status: :ok
      end
    else
      render "bot/id_not_found", status: :ok
    end
  end

  def accept_report
    if @report
      render "bot/get", status: :ok
    else
      render "bot/id_not_found", status: :ok
    end
  end


  private

    def set_command
      @chat_id = params['message']['chat']['id']
      if params['message']['new_chat_participant']
        render "bot/help", status: :ok
      else
        @text = params['message']['text'].split()
        @command = @text[0]
        @param = @text[1]
        @report = Report.find_by(id: @param, state: 1)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:id)
    end
end

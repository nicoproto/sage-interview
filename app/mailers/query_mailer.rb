class QueryMailer < ApplicationMailer
  def facts
    @email = params[:email]
    @facts = params[:facts]

    mail to: @email, subject: 'Your requested Chuck Norris facts', facts: @facts
  end
end

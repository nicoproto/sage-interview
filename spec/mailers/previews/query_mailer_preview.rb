# Preview all emails at http://localhost:3000/rails/mailers/query_mailer
class QueryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/query_mailer/facts
  def facts
    QueryMailer.facts
  end

end

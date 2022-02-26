require "rails_helper"

RSpec.describe QueryMailer, type: :mailer do
  describe "facts" do
    let(:mail) { QueryMailer.facts }

    it "renders the headers" do
      expect(mail.subject).to eq("Facts")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

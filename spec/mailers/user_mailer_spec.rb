require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "sending_score" do
    user = FactoryBot.build(:user)
    score = FactoryBot.build(:score)
    let(:mail) { UserMailer.sending_score(user,score) }

    it "renders the headers" do
      expect(mail.subject) == ("New score posted")
      expect(mail.to) == (user.email)
      expect(mail.from) == (["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

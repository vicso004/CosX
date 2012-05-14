class MatchMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.match_mailer.assignment_notification.subject
  #
  
  def subject(match)
    "Match mot "+match.other_team+match.datum.strftime(" %A %d/%m")+match.tid.strftime(" klockan %H:%M")
    
  end
  
  def assignment_notification(player, match, assignment)
    @player = player
    @user = player.user
    @match = match
    @assignment = assignment

    mail to: @user.email, subject: subject(@match)
  end
end

# -*- coding: utf-8 -*-  
# Mailer till de spelare som blivit uttagna till en match
class MatchMailer < ActionMailer::Base
  #Den mailadress mailen kommer från
  default from: "CosXinnebandy@gmail.com"

  def subject(match)
    "Match mot "+match.other_team+match.datum.strftime(" %A %d/%m")+match.tid.strftime(" klockan %H:%M")    
  end
  
  # Mailets innehåll visas i views/match_mailer/assignment_notification.xxx.erb
  def assignment_notification(assignment)
    @assignment = assignment

    mail to: assignment.player.user.email, subject: subject(assignment.match)
  end
end

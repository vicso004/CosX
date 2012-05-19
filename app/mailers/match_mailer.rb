# -*- coding: utf-8 -*-
class MatchMailer < ActionMailer::Base
  default from: "CosXinnebandy@gmail.com"

  def subject(match)
    "Match mot "+match.other_team+match.datum.strftime(" %A %d/%m")+match.tid.strftime(" klockan %H:%M")
    
  end
  
  def assignment_notification(assignment)
    @assignment = assignment

    mail to: assignment.player.user.email, subject: subject(assignment.match)
  end
end

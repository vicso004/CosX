module MatchesHelper
  
  def result(match)
    if match.score_other == nil
      "ej rapporterad"
    else
      link_to match.goals.length.to_s + " - "+match.score_other.to_s, match_path(match)
    end
  end
  
  
  def mail_path(match)
    	'matches/'+match.id.to_s+'/send_mail'
 	end
  
end

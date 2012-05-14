module MatchesHelper
  
  
  
  
  def mail_path(match)
    	'matches/'+match.id.to_s+'/send_mail'
 	end
  
end

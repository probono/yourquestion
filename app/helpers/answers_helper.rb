module AnswersHelper
  
  def coincidence_rate(answer, vote)
    vote.positive? ? answer.rate : 100 - answer.rate
  end
  
  def google_chart(answer)
    ok = answer.rate
    nok = 100 - answer.rate
    image_tag "http://chart.apis.google.com/chart?cht=p&chs=200x130&chd=t:#{nok},#{ok}&chco=FC9700,8CC338&chf=bg,s,EBF4DC", 
              :alt => "#{ok}% completa y #{nok}% incompleta"
  end
  
end

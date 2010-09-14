module QuestionsHelper
  
  def last_pending_questions(size=4)
    Question.pending.order('sent_at desc').limit(size)
  end
  
  def last_answered_questions(size=4)
    Question.answered.order('answered_at desc').limit(size)
  end
  
  def elapse_time(question)
    distance_of_time_in_words(question.sent_at, question.answered_at) if question.answered?
  end
  
  
end

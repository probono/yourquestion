module ApplicationHelper
  
  SECTION_CLASSES = {
    'home' => 'home',
    'questions' => 'question-answer',
    'administrations' => 'question-answer',
    'departments' => 'question-answer',
    'search' => 'search-results'
  }
  
  def section_class
    SECTION_CLASSES[controller_name]
  end
  
  def home?
    controller_name == 'home'
  end
  
end

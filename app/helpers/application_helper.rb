module ApplicationHelper
  
  SECTION_CLASSES = {
    'home' => 'home',
    'questions' => 'question-answer'
  }
  
  def section_class
    SECTION_CLASSES[controller_name]
  end
  
  def home?
    controller_name == 'home'
  end
  
end

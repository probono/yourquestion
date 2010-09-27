module DepartmentsHelper
  
  def department_link(dpt)
    link_to dpt.name, administration_department_path(dpt.administration, dpt), :title => "Preguntas a #{dpt.name}" if dpt
  end
  
end

module AdministrationsHelper
  
  def administration_logo(adm)
    image_tag "/images/logos/test-admin.gif", :alt => adm.name, :width => 44, :height => 44
  end
  
  def administration_link(adm)
    link_to adm.name, adm, :title => "Preguntas a #{adm.name}"
  end
  
end

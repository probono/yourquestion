#############################################
#    Some seed data
#############################################
DAYS_AGO = [10, 30, 45, 60, 20, 120]

#############################################
#    Sample administrations
#############################################
unless RAILS_ENV == "production"
  
  administrations = {
    "Ayuntamiento de Madrid" => ["Consejería de cultura", "Consejería de educación", "Consejería de Transporte"],
    "Comunidad de Madrid" => ["Consejería de interior", "Consejería de educación", "Consejería de obras públicas"],
    "Ministerio de industria" => ["Red.es", "SEPI"]
  }
  administrations.each do |n,ds|
    a = Administration.create!(:name => n)
    ds.each do |d|
      a.departments << Department.create(:name => d)
    end
  end
  
end

#############################################
#    Sample questions
#############################################
unless RAILS_ENV == "production"
  
  questions = [
    {:text => '¿Cuantas personas fueron expulsadas de España en el último año?', :tags => 'derechos humanos'},
    {:text => '¿Cuántos coches oficiales hay en el Ayuntamiento de Madrid y cuánto cuestan?', :tags => 'gasto, madrid'},
    {:text => '¿Cómo reparte la SGAE el dinero del canon?', :tags => 'cultura, opendata'},
    {:text => '¿Cuánto gasta su departamento en software?', :tags => 'gasto'},
    {:text => '¿Cuántas fuentes de datos tiene liberada su departamento?', :tags => 'opendata'},
    {:text => '¿Que proporción dedica su administración a personal, a subcontratación y a obras?', :tags => 'gasto, obras'},
    {:text => '¿Cuantos aeropuertos hay con menos de 20 vuelos diarios y cuanto cuesta cada uno?', :tags => 'gasto'}
  ]

  questions.each do |hash|
    q = Question.create!(:title => hash[:text], 
                         :tag_list => hash[:tags],
                         :body => "blah, blah, blah, #{hash[:text]}, blah, blah, blah, #{hash[:text]}, blah, blah, blah")
    if (Time.now.to_i % 2 == 0)
      depts = Department.all.sort_by {rand}
      q.department = depts.first
      q.administration = q.department.administration
      q.sent!(Time.now - DAYS_AGO.sort_by{rand}.first.days)
      if (Time.now.to_i % 3 == 0)
        q.answer = Answer.new(:body => "Respuesta a #{hash[:text]}, blah, blah, blah, #{hash[:text]}", :question => q)
        q.answered!
      end
    end
    sleep 1
  end
  
end
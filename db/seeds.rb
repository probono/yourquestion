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
  
  questions = ['¿Cuantas personas fueron expulsadas de España en el último año?',
               '¿Cuántos coches oficiales hay en el Ayuntamiento de Madrid y cuánto cuestan?',
               '¿Cómo reparte la SGAE el dinero del canon?',
               '¿Cuánto gasta su departamento en software?',
               '¿Cuántas fuentes de datos tiene liberada su departamento?',
               '¿Que proporción dedica su administración a personal, a subcontratación y a obras?',
               '¿Cuantos aeropuertos hay con menos de 20 vuelos diarios y cuanto cuesta cada uno?']

  questions.each do |t|
    q = Question.create!(:title => t, :body => "blah, blah, blah #{t}, blah, blah, blah")
    if (Time.now.to_i % 2 == 0)
      depts = Department.all.sort_by {rand}
      q.department = depts.first
      q.administration = q.department.administration
      q.sent!(Time.now - 1.days)
      if (Time.now.to_i % 3 == 0)
        q.answer = Answer.new(:body => "Respesta a #{t}", :question => q)
        q.answered!
      end
    end
    sleep 1
  end
  
end
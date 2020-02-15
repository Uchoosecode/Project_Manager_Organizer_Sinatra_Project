Manager.create(:name => "Mike", :email => "mikeproject@email.com", :password => "Mike")
Manager.create(:name => "Peter", :email => "peterproject@email.com", :password => "Peter")
Manager.create(:name => "Susan", :email => "susanproject@email.com", :password => "Susan")


Project.create(:name => "Spring St", :project_type => "reconstruction", :start_date => "Jan. 01, 2019", :due_date => Date.today.next, :manager_id => Manager.first.id )
Project.create(:name => "MSG", :project_type => "transformation", :start_date => "Aug. 05, 2012", :due_date => "Oct. 22, 2019", :manager_id => Manager.second.id )

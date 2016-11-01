def prepare(evaluator)

	page = {
	    :name         => "Dam",
	    :full_name    => "Dam Sam",
	    :age         => 32,
	    :address => {:city => "Delhi", :from => {:day => 3, :month => 2, :year => 2014}},
	    :past_addresses => [
	        {:city => "Mumbai",    :from => {:day => 13, :month => 7, :year => 2012},   :to => {:day => 3, :month  => 2, :year => 2014}},
	        {:city => "Chennai",   :from => {:day => 17, :month => 3, :year => 2010},   :to => {:day => 13, :month => 7, :year => 2012}},
	        {:city => "Guwahati",  :from => {:day => 4,  :month => 2, :year => 2006},   :to => {:day => 17, :month => 3, :year => 2010}}
	    ]
	}

	evaluator.expect("first_name(page)"					, first_name(page)						, 	"Dam")
	evaluator.expect("full_name(page)"					  , full_name(page)							, 	"Dam Sam")

	evaluator.expect("last_name(page)"						, last_name(page)						, 	"Sam")
  evaluator.expect("year_of_birth(page)"				, year_of_birth(page)				, 	1984)
  evaluator.expect("current_city(page)"				, current_city(page)				, 	"Delhi")
  evaluator.expect("past_cities(page)"					, past_cities(page)					, 	["Mumbai", "Chennai", "Guwahati"])
	evaluator.expect("address_change_dates(page)", address_change_dates(page), 	["02/2006", "03/2010", "07/2012"])
	evaluator.report
end


begin
  proc = Proc.new {}
  eval(submission, proc.binding)
  return prepare(report)
rescue Exception => se
  return report.error(se)
end
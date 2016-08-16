def prepare

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

	evaluator= RubyLab::Evaluator.new("exercise-one")
	evaluator.verify_scenario("first_name(page)"					, first_name(page)						, 	"Dam")
	evaluator.verify_scenario("full_name(page)"					  , full_name(page)							, 	"Dam Sam")

	evaluator.verify_scenario("last_name(page)"						, last_name(page)						, 	"Sam")
  evaluator.verify_scenario("year_of_birth(page)"				, year_of_birth(page)				, 	1984)
  evaluator.verify_scenario("current_city(page)"				, current_city(page)				, 	"Delhi")
  evaluator.verify_scenario("past_cities(page)"					, past_cities(page)					, 	["Mumbai", "Chennai", "Guwahati"])
	evaluator.verify_scenario("address_change_dates(page)", address_change_dates(page), 	["02/2006", "03/2010", "07/2012"])
	evaluator.report
end


def execute solution_string
	begin
		proc = Proc.new {}
	 	eval(solution_string, proc.binding)
	 	return prepare
	rescue Exception => se
		return RubyLab::Evaluator.new("exercise-one").error(se)
	end
end

# __solution_file must be in process scope
execute(__solution_string)

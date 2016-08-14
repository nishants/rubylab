def prepare 
	 report = []

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

	def verify (value, expected, testName)
	  error       = (value != expected)
	  title       = (error ?  "Failed : " : "Okay   : ") + testName
	  line_break  = ("\n"+ ("-" * 20) +"\n")
	  result      = title + line_break
	  error_message  = (error ? "Expected : #{expected} \nActual   : #{value}" : "")
	  return  error ? (result  + error_message +"\n\n") : result +"\n\n"
	end

	report.push (verify(last_name(page)      , "Sam"     , "last_name(page)"))
	report.push (verify(year_of_birth(page)  , 1984      , "year_of_birth(page)"))
	report.push (verify(current_city(page)   , "Delhi"   , "current_city(page)"))

	report.push (verify(past_cities(page)    , ["Mumbai", "Chennai", "Guwahati"]   , "past_cities(page)"))
	report.push (verify(address_change_dates(page)    , ["02/2006", "03/2010", "07/2012"]   , "address_change_dates(page)"))

	report
end


def execute solution_string
	begin
		proc = Proc.new {}
	 	eval(solution_string, proc.binding)
	 	return prepare
	rescue Exception => se
		return se.message.sub("(eval)", "Solutions file")
	end
end

# __solution_file must be in process scope
execute(__solution_string)

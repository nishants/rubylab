def first_name(page)
  page[:name]
end

def full_name(page)
  page[:full_name]
end

def last_name(page)
  page[:full_name].sub(page[:name], "").strip
end

def year_of_birth(page)
  Time.new.year - page[:age]
end

def current_city(page)
  "Delhi"
end


def past_cities(page)
  page[:past_addresses].map { |address| address[:city] }
end

def address_change_dates(page)
  page[:past_addresses].reverse.map { |address|
    month = address[:from][:month]
    year  = address[:from][:year]
    "#{month.to_s.rjust(2, "0")}/#{year}"
  }
end

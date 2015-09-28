DAYS_IN_YEAR = 365.242 #this is a constant

def hours_in_year
  return DAYS_IN_YEAR * 24
end

def minutes_in_decade
  return 10 * DAYS_IN_YEAR * 24 * 60
end

p hours_in_year
p minutes_in_decade
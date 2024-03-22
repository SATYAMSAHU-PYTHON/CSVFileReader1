require_relative 'CSVFileReader'
class State< CSVFileReader
end
state_file = 'states.csv'
st = State.new(state_file)
st.name = "Bihar"
st.capital = "Patna"
st.population = "22Crore"

 
st1 = State.find_by(state_file,"name", "Karnataka")
# puts st1.capital # this should print Bangalore 
# puts st1.population # this should print 6crore
puts st1['capital'] 
puts st1['population'] 
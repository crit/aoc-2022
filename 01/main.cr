# Elf representation for this input
struct Elf
  property position, calories

  def initialize(
    @positon : Int32,
    @calories : Int32 = 0
  )
  end
end

# Elves in this input
elves = [] of Elf

# Process input file
data = File.read("input.txt")
sets = data.split("\n\n") # double return is the delimiter of elves in input

# Process sets of calories per elf
sets.each_with_index do | set, index |
  elf = Elf.new(index) # new elf

  set.split("\n").each do | value |
    elf.calories += value.to_i
  end

  elves << elf # add to elf collection
end

# sort elves by total calorie carried (high to low)
sorted = elves.sort { |a, b| b.calories <=> a.calories }
puts "Top elf by calorie sum: #{sorted[0]}"

# sum top 3 elves
top3amount = 0
sorted[0..2].each do | elf |
  top3amount += elf.calories
end

puts "Top 3 elves total calories: #{top3amount}"

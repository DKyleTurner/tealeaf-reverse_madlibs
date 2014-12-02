# Method to open specified text file
def text_file(file)
  File.open(file, 'r') do |f|
    f.read
  end.split
end

# ALL OF THE FOLLOWING CODE IS REPLACED BY THE METHOD ABOVE
# nouns = File.open('nouns.txt', 'r') do |f|
#   f.read
# end.split
#
# adjectives = File.open('adjectives.txt', 'r') do |f|
#   f.read
# end.split
#
# verbs = File.open('verbs.txt', 'r') do |f|
#   f.read
# end.split
#
# pronouns = File.open('pronouns.txt', 'r') do |f|
#   f.read
# end.split

def say(msg)
  puts "=> #{msg}"
end

# If no parameter is passed into ARGV, output a message
if ARGV.empty?
say "No input file"
exit
end

# If a non existent file is passed into ARGV, output a message
if !File.exists?(ARGV[0])
  say "Input file doesn't exist."
  exit
end

# Method that opens and reads the file passed into ARGV
contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

# The following lines of code takes the value of the 'contents' variable and substitutes the
# a random word from the specified file
contents.gsub!('NAME').each do
  text_file('pronouns.txt').sample
end

contents.gsub!('NOUN').each do
  text_file('nouns.txt').sample
end

contents.gsub!('ADJECTIVE').each do
  text_file('adjectives.txt').sample
end

contents.gsub!('VERB').each do
  text_file('verbs.txt').sample
end

p contents
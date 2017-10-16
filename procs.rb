[1,2,3,4,5].each {|number| puts number}

##############

def call_block
	yield 1
	yield 2
end

call_block { |iterator| puts "Here is my block.  Iterator: #{iterator}"}

##############

def call_explicit_block(&block) #ampersand indicates that the parameter is a block
	return "There's no block" unless block_given?
	# block.call #making the call to the paramter
	yield
end

call_explicit_block {puts "This is an explicit block."}

check_for_block = call_explicit_block
puts check_for_block

##############
#Lamdas
#Lamdas are a type of Proc.  They don't have their own class.
#If defined arguments, Lambda's won't run without them.
say_hello = -> (name) {puts "Hello, #{name}."}
say_hello.call("Dan")

#Proc
#Procs are a class.  They need to be initialized.  Even though we defined 3 args, the proc is fine without them.
my_proc = Proc.new{|arg1, arg2, arg3| puts "This is a proc.  Arg1: #{arg1}"}

my_proc.call("Hello", "Goodbye")

#Lambda
return_lambda = -> {return "something"}
puts "#{return_lambda.call}"

#Proc
def return_proc
	puts "Before"
	return_proc = Proc.new{return "something else"}
	return_proc.call
	puts "After"
end
p return_proc

#Lambda
#lamda returns to the code after the return
def another_lambda
	l = lambda {return}
	l.call
	puts "After Lambda"
end

another_lambda

#proc returns to where it was called
def another_proc
	p = Proc.new {return}
	p.call
	puts "After Proc"
end

another_proc
puts "Next line after Proc"

#another proc
def call_the_proc(new_proc)
	count = 1
	new_proc.call
end
#scope is 2017 because that's where proc is defined
count = 2017
new_proc = Proc.new {puts count}
p call_the_proc(new_proc)











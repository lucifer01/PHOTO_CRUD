module Parent
  def say
    puts "I'm the parent"
  end
end

class Middle 
   include Parent
end

class Child < Middle
  def say(message)
    super()
  end
end

Child.new.say('Hi!')

class Numeric
  def root rt  
  	self**(1.0/rt)
  end
end

module RPN

  def initialize
  	@stack = []
  end
  
  def enter value
  	case value
  	  when '='
  	  	return result
  	  when '+'
  	  	@stack.push @stack.pop + @stack.pop
  	  when '-'
  	  	subtrahend = @stack.pop
  	  	@stack.push @stack.pop - subtrahend
  	  when '*'
  	  	@stack.push @stack.pop * @stack.pop
  	  when '^'
  	  	exponent = @stack.pop
  	  	@stack.push @stack.pop ** exponent
  	  when 'r'
  	  	rt = @stack.pop
  	  	@stack.push @stack.pop.root rt
  	  when '/', 'd'
  	  	divisor = @stack.pop
  	  	@stack.push @stack.pop / divisor
  	  when '%'
  	  	divisor = @stack.pop
  	  	@stack.push @stack.pop % divisor
  	  else	
        @stack.push value.to_f
    end    
    self
  rescue Exception => @err
    @stack.push 'invalid input'
    return self
  end

  def result
  	@stack.first.to_s || ''
  end

end
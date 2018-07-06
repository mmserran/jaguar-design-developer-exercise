class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    _return = str.split(/ +/)
    _return = _return.map(&Exercise.method(:do_marklar_logic))
    
    return _return.join(' ')
  end
  
  def self.do_marklar_logic(item)
    _return = item
    if (item.length > 4)
      # replace only the word
      _return = item.gsub(/([a-zA-Z]+)/, 'marklar')
      
      # respect capitalization
      is_capitalized = (/^([A-Z])/.match(item) != nil)
      if (is_capitalized == true)
        _return = _return.capitalize
      end
    end
    
    return _return
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    list_fib = Exercise.list_fib_sequence(nth)
    list_even = list_fib.select {|x| x % 2 == 0}
    
    _return = list_even.reduce {|sum, x| sum + x}
    
    return _return
  end
  
  def self.list_fib_sequence(nth)
    _return = []
    while (_return.length < nth)
      _return.push(Exercise.fib_memoization(_return.length))
      #_return.push(Exercise.fib_recursive(_return.length))
    end
    
    return _return
  end
  
  def self.fib_recursive(nth)
    # very slow, does redundant calculations
    _return = 1
    if (nth > 1)
      _return = Exercise.fib_recursive(nth - 1) + Exercise.fib_recursive(nth - 2)
    end
    
    return _return
  end
  
  @cache = {}
  def self.fib_memoization(nth)
    if (@cache[nth] == nil)
      # do calculation if not yet calculated
      _return = 1
      if (nth > 1)
        _return = Exercise.fib_memoization(nth - 1) + Exercise.fib_memoization(nth - 2)
      end
      @cache[nth] = _return
    end
    
    return @cache[nth]
  end

end

# Thank you Jaguar Design Studio, for introducing me to Ruby and BitBucket!

module DiariesHelper

  def condition_generator(value)
    conditions = {}
    numbers = [-2, -1, 0, 1, 2]
    numbers.each do |number|
      if number == value
        conditions[number] = true
      else
        conditions[number] = false
      end
    end
    conditions
  end

  def class_generator(bool)
    bool ? 'list-group-item list-group-item-info' : 'list-group-item'
  end

end

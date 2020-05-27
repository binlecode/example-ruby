

class MyGS

  # use hash params for mass assignment
  def initialize(attributes)
    attributes.keys.each do |key|
      instance_variable_set "@#{key}", attributes[key]
    end
  end

  # can use setter for name mismatch
  def var1=(value)
    @prop1 = value
  end

  # can use getter to decorate exposed value
  def prop2
    @prop2.to_s.upcase
  end

end


myGs = MyGS.new({:key1 => 'value1', :key2 => 'value2', :prop2 => 'prop2 value'})

myGs.var1 = 'value for prop1'
puts myGs.prop2
puts myGs.inspect
puts myGs.instance_variables.first
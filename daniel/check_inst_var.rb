class CheckThis
  attr_reader :data

  def more_data
    @more_data
  end
end

ct = CheckThis.new
pp ct.data
pp ct.more_data

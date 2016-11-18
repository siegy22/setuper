class StubIO
  def gets
    @val
  end

  def puts(output = nil)
    @output ||= []
    @output << output
  end

  def returning=(val)
    @val = val
  end

  def output
    @output
  end
end

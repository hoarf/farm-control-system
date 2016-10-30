class BaseIndicator

  def data
    {
      data: values,
      label: label,
      backgroundColor: background_color,
      fill: false,
      yAxisID: axis
    }
  end

  def axis
    "y-axis-0"
  end

  def background_color
    'rgba(150,150,150,1)'
  end

  def values
    []
  end

  def self.date_range
    (0..11).collect { |i| i.months.ago.at_beginning_of_month.to_date }.reverse
  end

  def label
    "Indicator"
  end

end

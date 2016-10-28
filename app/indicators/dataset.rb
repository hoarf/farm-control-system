# coding: utf-8
class Dataset

  def datasets
    []
  end

  def labels
    BaseIndicator.date_range
  end

  def data
    { datasets: datasets, labels: labels }
  end

  def title
    "Gráfico"
  end

  def options
    {
      title: { display: true, text: title }
    }
  end

end

# coding: utf-8
class InventoryLevelsDataset < Dataset

  def initialize(farm)
    @farm = farm
  end

  def title
    "Nível do estoque"
  end

  def datasets
    [ CattleCountIndicator.new(@farm).data, CattleFoodIndicator.new(@farm).data  ]
  end

  def options
    {
      title: { display: true, text: title },
      scales: {
        yAxes: [
          {
            position: "left",
            "id": "y-axis-0"
          }, {
            position: "right",
            "id": "y-axis-1"
          }]
      }
    }
  end

end

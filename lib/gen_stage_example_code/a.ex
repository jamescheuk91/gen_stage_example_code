defmodule GenStageExampleCode.A do
  use GenStage

  def start_link(number) do
    GenStage.start_link(__MODULE__, number, name: __MODULE__)
  end

  def init(number) do
    {:producer, number}
  end

  def handle_demand(demand, number) when demand > 0 do
    from = number
    to = number + demand - 1
    {:noreply, generate_list(from, to), number + demand}
  end

  def generate_list(from, to) do
    from..to
    |> Enum.to_list
  end

end

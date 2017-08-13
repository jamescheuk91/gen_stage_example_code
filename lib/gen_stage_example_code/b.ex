defmodule GenStageExampleCode.B do
  use GenStage

  alias GenStageExampleCode.A

  def start_link(number) do
    GenStage.start_link(__MODULE__, number, name: __MODULE__)
  end

  def init(number) do
    opts = [{:subscribe_to, [{A, max_demand: 10}]}]
    {:producer_consumer, number, opts}
  end

  def handle_events(events, __form, number) do
    {:noreply, events |> multiply_by(number), number}
  end

  defp multiply_by(events, number) do
    events
    |> Enum.map(& &1 * number)
  end
end

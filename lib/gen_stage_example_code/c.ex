defmodule GenStageExampleCode.C do
  use GenStage
  require Logger

  alias GenStageExampleCode.B

  def start_link() do
    GenStage.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:consumer, :ok, subscribe_to: [B]}
  end

  def handle_events(events, _from, state) do
    Process.sleep(2000)

    print_to_console(events)

    {:noreply, [], state}
  end

  def print_to_console(events) do
    Logger.info("Handling Events: #{inspect events}")
  end

end

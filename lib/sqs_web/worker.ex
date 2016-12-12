alias Experimental.GenStage

defmodule SqsWeb.Worker do
  use GenStage

  def start_link(opts \\ []), do: GenStage.start_link(__MODULE__, :ok, opts)
  def stop(stage), do: GenStage.stop(stage)

  def init(_) do
    {:producer, {:queue.new, 0}}
  end

  def handle_demand(demand, {queue, old_demand}) do
    {events, new_queue, new_demand} = take(queue, demand + old_demand)
    {:noreply, events, {new_queue, new_demand}}
  end

  defp take(queue, count, items \\ [])
  defp take(queue, 0, items), do: {items, queue, 0}
  defp take(queue, count, items) do
    case :queue.out(queue) do
      { {:value, item}, queue} -> take(queue, count - 1, items ++ [item])
      {:empty, queue} -> {items, queue, count}
    end
  end

  def handle_call({:notify, event}, _from, {queue, demand}) do
    queue = :queue.in(event, queue)
    {events, new_queue, new_demand} = take(queue, demand)
    {:reply, :ok, events, {new_queue, new_demand}}
  end
end

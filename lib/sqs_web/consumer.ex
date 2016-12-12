alias Experimental.GenStage

defmodule SqsWeb.Consumer do
  use GenStage

  def start_link(opts \\ []), do: GenStage.start_link(__MODULE__, :ok, opts)
  def stop(stage), do: GenStage.stop(stage)

  def init(_) do
    {:consumer, nil, subscribe_to: [:sqs_notification_center]}
  end

  def handle_events(events, _from, _state) do
    Enum.each events, fn
      {:update, message} -> SqsWeb.Endpoint.broadcast("messages:lobby", "update", message)
    end

    {:noreply, [], nil}
  end

end

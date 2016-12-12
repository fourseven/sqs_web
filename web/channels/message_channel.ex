defmodule SqsWeb.MessageChannel do
  use Phoenix.Channel

  def join("message:lobby", _message, socket) do
    {:ok, socket}
  end
end

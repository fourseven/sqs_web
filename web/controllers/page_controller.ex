defmodule SqsWeb.PageController do
  use SqsWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

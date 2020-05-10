defmodule ComposWeb.PageLive do
  use ComposWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("PAGELIVE MOUNT runs")

    socketParams = if connected?(socket), do: get_connect_params(socket), else: %{}
    IO.inspect(socketParams)

    {:ok,
     assign(socket,
       socketParams: socketParams
     )}
  end
end

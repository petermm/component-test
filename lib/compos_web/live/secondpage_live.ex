defmodule ComposWeb.SecondPageLive do
  use ComposWeb, :live_view
  alias ComposWeb.CartComponent

  @impl true
  def mount(_params, _session, socket) do
    IO.puts("SecondPage mount")
    socketParams = if connected?(socket), do: get_connect_params(socket), else: %{}

    {:ok,
     assign(socket,
       socketParams: socketParams
     )}
  end

  def render(assigns) do
    ~L"""
    <h1>SecondPage</h1>
    <br/>
    <%= live_component @socket, ComposWeb.CartComponent, id: :cart_component, socketParams: @socketParams %>
    <br/>
    <%= live_patch "Go to Root", to: Routes.live_path(@socket, ComposWeb.PageLive) %>
    """
  end
end

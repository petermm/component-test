defmodule ComposWeb.SecondPageLive do
  use ComposWeb, :live_view
  alias ComposWeb.CartComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  def render(assigns) do
    ~L"""
    <h1>SecondPage</h1>
    <br/>
    <%= live_component @socket, CartComponent, id: :cart_component %>
    <br/>
    <%= live_patch "Go to Root", to: Routes.live_path(@socket, ComposWeb.PageLive) %>
    """
  end
end

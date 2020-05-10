defmodule ComposWeb.CartComponent do
  use Phoenix.LiveComponent

  def mount(socket) do
    shoppingCart = %{
      total: 0
    }

    if connected?(socket) do
      # shoppingCart = Map.get(socket.socketParams, "shoppingCart", %{})
      IO.puts("CartComponent mount connected")
      IO.inspect(socket, printable_limit: :infinity)
    end

    {:ok,
     assign(socket,
       shoppingCart: shoppingCart
     )}
  end

  def update(assigns, socket) do
    IO.puts("CartComponent update")
    IO.inspect(assigns)
    IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    shoppingCart = Jason.encode!(assigns.shoppingCart)

    ~L"""
    <div phx-hook="CartComponent" id="cartcomponent" data-shopping-cart="<%= shoppingCart %>">
    <br/>
    <br/>
    <br/>
    <button phx-click="component-click" phx-target="#cartcomponent">Change Cart Total</button>
    </div>
    """
  end

  def handle_event("component-click", _value, socket) do
    shoppingCart = %{
      total: Enum.random(10..1000)
    }

    {:noreply, assign(socket, :shoppingCart, shoppingCart)}
  end
end

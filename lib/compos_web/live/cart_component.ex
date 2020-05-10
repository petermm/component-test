defmodule ComposWeb.CartComponent do
  use Phoenix.LiveComponent

  def mount(socket) do
    IO.puts("CartComponent mount")

    {:ok, socket}
  end

  def update(assigns, socket) do
    IO.puts("CartComponent update")
    IO.inspect(assigns)


    shoppingCart = if connected?(socket) do
      IO.puts("Component connected")
      Jason.decode!(Map.get(assigns.socketParams, "shoppingCart"))
    else
      %{}
    end

    {:ok, assign(socket, :shoppingCart, shoppingCart)}
  end

  def render(assigns) do
    shoppingCart = Jason.encode!(assigns.shoppingCart)

    ~L"""
    <div phx-hook="CartComponent" id="cartcomponent" data-shopping-cart="<%= shoppingCart %>">
    <div><%= Map.get(assigns.shoppingCart,"total") %></div>
    <br/>
    <br/>
    <br/>
    <button phx-click="component-click" phx-target="#cartcomponent">Change Cart Total</button>
    </div>
    """
  end

  def handle_event("component-click", _value, socket) do
    shoppingCart = %{
      "total" => Enum.random(10..1000)
    }

    {:noreply, assign(socket, :shoppingCart, shoppingCart)}
  end
end

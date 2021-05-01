defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "Renders create.json" do
      params = %{name: "Restaurant Test", email: "restaurant_test@email.com"}

      {:ok, restaurant} = Inmana.create_restaurant(params)
      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "restaurant_test@email.com",
                 id: _id,
                 name: "Restaurant Test"
               }
             } = response
    end
  end
end

defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "When all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Restaurant Test", email: "restaurant_test@email.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "restaurant_test@email.com",
                 "id" => _id,
                 "name" => "Restaurant Test"
               }
             } = response
    end

    test "When there are invalid, returns an error", %{conn: conn} do
      params = %{email: "restaurant_test@email.com"}

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end

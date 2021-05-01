defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Restaurant Test", email: "restaurant_test@email.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Restaurant Test", email: "restaurant_test@email.com"},
               valid?: true
             } = response
    end

    test "When there are valid params, returns an invalid changeset" do
      params = %{name: "R", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_response
    end
  end
end

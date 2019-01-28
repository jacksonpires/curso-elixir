defmodule FriendsAppTest do
  use ExUnit.Case
  doctest FriendsApp

  test "greets the world" do
    assert FriendsApp.hello() == :world
  end
end

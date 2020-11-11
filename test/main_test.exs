defmodule MainTest do
  use ExUnit.Case
  doctest Main

  test "Execute main.client() for create a server and aument value" do
    {:ok, value} = Main.client()
    assert value == "Server Start!"
  end

end

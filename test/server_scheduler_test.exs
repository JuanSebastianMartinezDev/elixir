defmodule ServerSchedulerTest do
  use ExUnit.Case
  doctest ServerScheduler

  test "Create a Server with value by default" do
    {:ok, pid} = ServerScheduler.create()
    assert pid != nil
    assert ServerScheduler.read(pid) == 0
  end

  test "Create a Server with initial value negative" do
    {:error, reason} = ServerScheduler.create(-3)
    assert reason == "value can't be negative"
  end

  test "Increments initial value in 2000" do
    {:ok, pid} = ServerScheduler.create()
    value = ServerScheduler.aument(pid, 2000)
    assert value == 2000
    assert ServerScheduler.read(pid) == value
  end

  test "Create Server with initial value 2000 and stop services" do
    {:ok, pid} = ServerScheduler.create(2000)
    assert ServerScheduler.read(pid) == 2000
    assert ServerScheduler.terminate(pid)
  end

end

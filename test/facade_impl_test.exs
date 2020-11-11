defmodule FacadeimplTest do
  use ExUnit.Case
  doctest Facadeimpl

  test "Create a Server width value by default and aument value in 150" do
    {:ok,pid} = ServerScheduler.create()
    facade_impl = %Facadeimpl{pid: pid}
    value = Ifacade.aument(facade_impl,150)
    assert value == 150
    assert ServerScheduler.read(facade_impl.pid) == 150
  end

  test "Create a FacadeImpl with pid = null" do
    facade_impl = %Facadeimpl{pid: nil}
    assert facade_impl.pid == nil
  end


end

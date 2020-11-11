defmodule IfacadeTest do
  use ExUnit.Case
  doctest Ifacade

  test "Create Server width value = 1000 and aument value at 2000 " do
    {:ok,pid} = ServerScheduler.create(1000)
    facade_impl = %Facadeimpl{pid: pid}
    value = Ifacade.aument(facade_impl,2000)
    assert value == 3000
    assert ServerScheduler.read(facade_impl.pid) == 3000
  end

  test "Create Server width value = 1000 and Stop Server" do
    {:ok,pid} = ServerScheduler.create(1000)
    facade_impl = %Facadeimpl{pid: pid}
    assert Ifacade.stop_server(facade_impl)
  end

  test "Verify validation with Ifacade width value = nil" do
    facade_impl = %Facadeimpl{pid: nil}
    {:error, message} = Ifacade.aument(facade_impl,1000)
    assert message == "pid must be different of nil"
  end

  test "Verify stop_server with Ifacade with value = nil" do
    facade_impl = %Facadeimpl{pid: nil}
    {:error, message} = Ifacade.aument(facade_impl,1000)
    {:error, message2} = Ifacade.stop_server(facade_impl)
    assert message == "pid must be different of nil"
    assert message2 == "pid must be different of nil"
  end

  test "Create Server width value = 1000 and aument value at 500 anf after 1000 " do
    {:ok,pid} = ServerScheduler.create(1000)
    facade_impl = %Facadeimpl{pid: pid}
    value = Ifacade.aument(facade_impl,500)
    assert value == 1500
    Ifacade.aument(facade_impl,1000)
    assert ServerScheduler.read(facade_impl.pid) == 2500
  end

end

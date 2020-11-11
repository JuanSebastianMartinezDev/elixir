defmodule Main do
  def client() do
    {:ok,pid} = ServerScheduler.create(0)
    facade_impl = %Facadeimpl{pid: pid}
    IO.puts(Ifacade.aument(facade_impl,100))
    {:ok,"Server Start!"}
  end
end
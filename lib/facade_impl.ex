defmodule Facadeimpl do
  @enforce_keys [:pid]
  defstruct [:pid]
end

defimpl Ifacade, for: Facadeimpl do
  #Implementacion start_server
  def aument(facadeimpl, amount) do
    if facadeimpl.pid == nil do
        {:error,"pid must be different of nil"}
      else
        ServerScheduler.aument(facadeimpl.pid,amount)
        ServerScheduler.read(facadeimpl.pid)
    end
  end

  def stop_server(facadeimpl) do
    if facadeimpl.pid == nil do
      {:error,"pid must be different of nil"}
    else
      ServerScheduler.terminate(facadeimpl.pid)
    end
  end

end


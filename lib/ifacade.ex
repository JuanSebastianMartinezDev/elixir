defprotocol Ifacade do
  @fallback_to_any true
  def aument(server, amount)
  def stop_server(server)
end
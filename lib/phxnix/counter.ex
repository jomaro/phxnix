defmodule Phxnix.Counter do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def start(_opts) do
    0
  end

  def init(value) do
    {:ok, value}
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  def inc() do
    GenServer.call(__MODULE__, :inc)
  end

  def handle_call(:get, _from, value) do
    {:reply, value, value}
  end
  def handle_call(:inc, _from, value) do
    {:reply, value+1, value+1}
  end
end

defmodule ElixirEssentialsPractice.PingPong do

  def ping_pong do
    receive do
      {:ping, caller} ->
        IO.puts "Ping !!!"
        :timer.sleep 500
        send caller, {:pong, self()}
      {:pong, caller} ->
        IO.puts "Pong !!!"
        :timer.sleep 500
        send caller, {:ping, self()}
      _ -> :error
    end
    ping_pong()
  end

  def spawn_ping_pong do
    spawn __MODULE__, :ping_pong, []
  end

  def start_ping_pong do
    ping = spawn_ping_pong()
    pong = spawn_ping_pong()
    send ping, {:ping, pong}
    {:ok, ping, pong}
  end
end

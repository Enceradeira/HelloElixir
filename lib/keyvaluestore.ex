defmodule KeyValueStore do
  def start do
    Task.start_link(fn -> loop(%{}) end)
  end

  def start_with_name(name) do
    {:ok, pid} = start()
    true = Process.register(pid, name)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)

      {:put, key, value} ->
        loop(map |> Map.put(key, value))
    end
  end
end

defmodule ProcessesTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "Process" do
    test "retrieving own pid" do
      assert self() != nil
    end

    test "with spawn" do
      pid = spawn(fn -> :timer.sleep(10) end)
      assert Process.alive?(pid) == true
    end

    test "send messages to me" do
      me = self()
      spawn(fn -> send(me, :wake_me_up) end)

      woken_up =
        receive do
          :wake_me_up -> true
        after
          1000 -> false
        end

      assert woken_up == true
    end
  end

  describe "Holding State" do
    test "by starting a process" do
      {:ok, store} = KeyValueStore.start()

      send(store, {:put, :name, "John"})
      send(store, {:put, :age, 45})
      send(store, {:get, :name, self()})

      john_received =
        receive do
          "John" -> true
        after
          10 -> false
        end

      assert john_received == true
    end

    test "by starting and registering a process" do
      KeyValueStore.start_with_name(:global_store)

      send(:global_store, {:put, :name, "John"})
      send(:global_store, {:get, :name, self()})

      john_received =
        receive do
          "John" -> true
        after
          10 -> false
        end

      assert john_received == true
    end
  end
end

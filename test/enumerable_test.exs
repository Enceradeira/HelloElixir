defmodule EnumerableTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "Enumerables" do
    test "with map" do
      assert Enum.map([0, 1, 2], fn e -> e * 2 end) == [0, 2, 4]
    end

    test "with map and neater lambda syntax" do
      assert Enum.map([0, 1, 2], &(&1 * 2)) == [0, 2, 4]
    end

    test "with ranges" do
      assert Enum.reduce(1..3, fn e, t -> e + t end) == 6
    end

    test "with pipe operator" do
      result = [1, 2, 3] |> Enum.map(&(1 + &1)) |> Enum.map(fn a -> a * 2 end)
      assert result == [4, 6, 8]
    end
  end

  describe "Stream" do
    test "with map" do
      infinite_stream = Stream.cycle(0..2)
      stream = Stream.map(infinite_stream, fn e -> e * 2 end)
      assert (stream |> Enum.take(6)) == [0,2,4,0,2,4]
    end
  end

end

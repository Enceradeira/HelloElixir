defmodule FuntionCapturingTest do
  use ExUnit.Case

  describe "capturing a function" do
    test "with Math.sum and binaries" do
      sum = &Math.sum/2
      assert sum.("1", "3") == 4
    end

    test "with Math.sum and integer" do
      sum = &Math.sum/2
      assert sum.(1, 3) == 4
    end

    test "shortcut for creating a function" do
      sum = &(&1 + &2)
      assert sum.(1, 5) == 6
    end
  end
end

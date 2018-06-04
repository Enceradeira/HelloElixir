defmodule ModuleTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "Math" do
    test "sum" do
      assert Math.sum(1, 2) == 3
    end

    test "sum strings" do
      assert Math.sum("1", "2") == 3
    end

    test "sum 0,0" do
      assert Math.sum(0, 0) == -1
    end

    test "sum with default argument" do
      assert Math.sum(5) == 5
    end
  end
end

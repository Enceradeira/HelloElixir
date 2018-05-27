defmodule BasicOperatorsTest do
  use ExUnit.Case
  use ExUnit.Parameterized

    test "concat list" do
      assert Enum.sort([1,2]++[3]) == Enum.sort([5,4,4,3,2,1] -- [5,4,4])
    end

    test "concat string" do
      assert "Hello" <> " World" == "Hello World"
    end

end

defmodule RecursionTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  def repeat(element, nr) when nr == 0 do
    []
  end

  def repeat(element, nr) do
    [element] ++ repeat(element, nr - 1)
  end

  describe "recursion" do
    test "for repeating an eleement" do
      result = repeat('a', 3)
      assert result == ['a', 'a', 'a']
    end

    test "for sum of a list" do
      assert (Math.sum_list([1,4,5])) == 10
    end
  end
end

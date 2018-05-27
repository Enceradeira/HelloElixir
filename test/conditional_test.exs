defmodule ConditionalTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "case" do
    test "with tuples" do
      result =
        case {1, "John", :yesterday} do
          {1, "John", :tomorrow} -> 0
          {1, name, date} -> [name, date]
          _ -> :all
        end

      assert result == ["John", :yesterday]
    end

    test "with variables" do
      x = 7
      y = 3

      result =
        case 2 do
          ^x -> x
          y -> y
        end

      assert result == 2
    end

    test "with guard" do
      i1 = 22
      i2 = :all

      result =
        case {i1, i2} do
          {y, :nope} when y > 20 -> :a
          {y, :all} when y < 20 -> :b
          {y, :all} when y >= 22 -> :c
          _ -> :d
        end

      assert result == :c
    end

    test "with anonymous function" do
      f = fn
        x, y when (x < 0 and y > 0) or (x > 0 and y < 0) -> -1 * x * y
        x, y -> x * y
      end

      assert [f.(1, 2), f.(-1, 2), f.(1, -2), f.(-1, -2)] == [2, 2, 2, 2]
    end
  end

  describe "cond" do
    test "matching" do
      result =
        cond do
          2 + 2 == 5 -> :a
          2 + 2 < 6 -> :b
          true -> :c
        end
      assert result == :b
    end

    test "matching not nil" do
      result = cond do
        nil -> :a
        false -> :b
        "Han Solo" -> :c
      end
      assert result == :c
    end
  end

  describe "if" do
    test "with do block" do
      result = if nil do
        :a
      else
        :b
      end
      assert result == :b
    end
    test " with do in regular syntax" do
      result = if nil, do: :a, else: :b
      assert result == :b
    end
  end
end

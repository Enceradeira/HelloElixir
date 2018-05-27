defmodule PatternMatchingTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "simple match" do
    test "variable to the left" do
      assert (x = 1) == 1
    end

    test "variable to the right" do
      x = 1
      assert (1 = x) == 1
    end
  end

  describe "matching tuples" do
    test "with match" do
      assert ({a, "world", c} = {:hello, "world", 42}) == {:hello, "world", 42}
    end

    test "with MatchError on mismatching number elements" do
      assert_raise MatchError, fn -> {a} = {1, 2} end
    end

    test "with MatchError on mismatching types" do
      assert_raise MatchError, fn ->
        {a, b} = [1, 2]
      end
    end
  end

  describe "matching list" do
    test "with matching individual elements" do
      assert ([a, b, c] = [2, 3, 4]) == [2, 3, 4]
    end

    test "with head and tail" do
      assert ([kopf | schwanz] = [1, 4, 3]) == [1, 4, 3]
      assert kopf == 1
      assert schwanz == [4, 3]
    end

    test "for prepending items" do
      assert [0 | [1, 2]] == [0, 1, 2]
    end

    test "with MatchError on mismatching number elements" do
      assert_raise MatchError, fn -> [a, b, c] = [1, 2] end
    end
  end

  describe "pin operator" do
    test "helps matching against existing variable" do
      a = 7
      assert_raise MatchError, fn -> [^a,b] = [4,4] end
    end
  end
end

defmodule KeywordlistAndMapsTest do
  use ExUnit.Case

  describe "Keyword lists" do
    test "concat" do
      lst = [a: 1, b: 2] ++ [c: 3]
      assert lst == [a: 1, b: 2, c: 3]
    end

    test "fetches first on lookup" do
      lst = [a: 1, b: 3, a: 5]
      assert lst[:a] == 1
    end

    test "if with keywordlist" do
      result1 = if(nil, [{:do, 1}, {:else, 2}])
      result2 = if(nil, do: 1, else: 4)
      result3 = if nil, do: 1, else: 6

      result4 =
        if nil do
          1
        else
          12
        end

      assert result1 + result2 + result3 + result4 == 24
    end
  end

  describe "Maps" do
    test "matching whole map" do
      map = %{:a => 1, :b => 2}
      assert (%{} = map) == %{:a => 1, :b => 2}
    end

    test "matching some keys" do
      %{:b => b, :c => c} = %{:d => "1", :b => "2", :c => "3", :a => "4"}
      assert [b, c] == ["2", "3"]
    end

    test "get a value" do
      map = %{"a" => "Hello", "b" => "World"}
      assert "#{map["a"]} #{Map.get(map, "b")}" == "Hello World"
    end

    test "put a value" do
      map = %{"a" => "Hello"}
      map = Map.put(map, "b", "World")
      assert map == %{"a" => "Hello", "b" => "World"}
    end

    test "updating a value" do
      map = %{1 => "Hello", 2 => "World"}
      map = %{map | 2 => "Peter"}
      assert map[2] == "Peter"
    end

    test "keyword syntax" do
      map = %{a: 1, b: 2}
      %{a: a, b: b} = map
      assert a + b == 3
    end
  end

  describe "Nested data structures" do
    test "accessing values" do
      users = [
        john: %{name: "John", age: 23, languages: ["German", "English"]},
        mary: %{name: "Mary", age: 45, languages: ["French"]}
      ]

      assert users[:john].age == 23
    end

    test "updating values" do
      users = [
        john: %{name: "John", age: 23, languages: ["German", "English"]},
        mary: %{name: "Mary", age: 45, languages: ["French"]}
      ]
      users = put_in users[:mary].age, 24

      assert users[:mary].age == 24
    end

    test "updating values with a fn" do
      users = [
        john: %{name: "John", age: 23, languages: ["German", "English"]},
        mary: %{name: "Mary", age: 45, languages: ["French"]}
      ]
      users = update_in users[:john].languages, fn lgns -> List.delete(lgns, "German") end

      assert users[:john][:languages] == ["English"]

    end
  end
end

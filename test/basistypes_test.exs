defmodule BasicTypesTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  doctest HelloWorld

  describe "Basic Types" do
    test "atoms" do
      assert is_atom(:atom) == true
    end

    test "list" do
      assert is_list([1, :me, nil]) == true
    end
  end

  describe "String" do
    test "interpolation" do
      value = "value"
      assert "My #{value}" == "My value"
    end

    test "are binaries" do
      assert is_binary("Hello")
    end

    test "have byte size" do
      assert byte_size("This") == 4
    end

    test "can be made upcase" do
      assert String.upcase("hello") == "HELLO"
    end
  end

  describe "Anonynomous functions" do
    test "can be defined and called" do
      add = fn a, b -> a + b end
      assert add.(3, 4) == 7
    end

    test "is a function" do
      assert is_function(fn -> 4 end)
    end
  end

  describe "Linked Lists" do
    test "has length" do
      assert length([1, 2]) == 2
    end

    test "has first element" do
      assert hd([1, 2]) == 1
    end

    test_with_params "elements can be accessed",
                     fn function, expected ->
                       assert function.([1, 2]) == expected
                     end do
      [
        head: {&hd/1, 1},
        last: {&List.last/1, 2},
        tail: {&tl/1, [2]}
      ]
    end
  end

  describe "Tuples" do
    test "can put_elem" do
      name_and_age = {'John', 78}
      updated_name_and_age = put_elem(name_and_age, 1, 77)
      assert updated_name_and_age == {'John', 77}
    end

    test "can be deconstructed" do
      name_and_age = {'John', 78}
      { _, age} = name_and_age
      assert age == 78
    end

  end
end

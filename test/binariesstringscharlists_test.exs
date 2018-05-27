defmodule BinariesStringsCharlistsTest do
  use ExUnit.Case
  use ExUnit.Parameterized

  describe "utf-8" do
    test "byte_size" do
      assert byte_size("hełło") == 7
    end

    test "String.length" do
      assert String.length("hełło") == 5
    end
  end

  describe "Binaries" do
    test "byte_size" do
      a = <<0, 1, 2, 3>>
      assert byte_size(a) == 4
    end

    test "String.valid?" do
      assert String.valid?(<<104, 101, 197, 130, 197, 130, 111>>) == true
    end

    test "String is Binary" do
      assert <<104, 101, 197, 130, 197, 130, 111>> == "hełło"
    end

    test "Equality" do
      assert <<154::size(8)>> != <<154::size(16)>>
    end

    test "Equality with utf-8" do
      assert <<256::utf8>> == <<196, 128>>
    end

    test "Binary modifier" do
      <<0, x, y, _::binary>> = <<0, 5, 6, 2, 3, 4>>
      assert x + y == 11
    end

    test "Pattern match string" do
      "he" <> rest = "hello"
      assert rest == "llo"
    end
  end

  describe "Charlists" do
    test "Is List" do
      assert 'hełło' == [104, 101, 322, 322, 111]
    end
  end
end

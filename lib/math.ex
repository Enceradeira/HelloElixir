defmodule Math do
  def sum(a, b \\ 0)

  def sum(0, 0) do
    -1
  end

  def sum(a, b) when is_binary(a) and is_binary(b) do
    {a_int, _} = Integer.parse(a)
    {b_int, _} = Integer.parse(b)
    sum(a_int, b_int)
  end

  def sum(a, b) when not (is_binary(a) and is_binary(b)) do
    sum_internal(a, b)
  end

  defp sum_internal(a, b) do
    a + b
  end
end

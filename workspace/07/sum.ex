defmodule Sum do
  def to(1), do: 1
  def to(n) when n > 0 and is_integer(n), do: n + to(n-1)
end

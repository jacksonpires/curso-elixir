defmodule ComparaNumero do
  def maior(n1, n2) do
    check(n1 >= n2, n1, n2)
  end

  defp check(true, n1, _), do: n1
  defp check(false, _, n2), do: n2
end

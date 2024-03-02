defmodule TopSecret do
  def to_ast(string) do
    {:ok, ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part({op, _meta, args} = ast, acc) when op in [:def, :defp] do
    {func_name, arity} = get_function_name_and_arity(args)

    {ast, [func_name |> to_string() |> String.slice(0, arity) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp get_function_name_and_arity([{:when, _, args}, _]), do: get_function_name_and_arity(args)
  defp get_function_name_and_arity([{func_name, _, nil}, _]), do: {func_name, 0}
  defp get_function_name_and_arity([{func_name, _, args}, _]), do: {func_name, length(args)}

  def decode_secret_message(string) do
    {_new_ast, acc} = to_ast(string) |> Macro.prewalk([], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join()
  end
end

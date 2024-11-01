defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(%{data: data, left: nil, right: nil} = tree, value) do
    key = if data >= value, do: :left, else: :right

    Map.put(tree, key, new(value))
  end

  def insert(%{data: data, left: left, right: right} = tree, value) do
    if data >= value do
      Map.put(tree, :left, insert(left, value))
    else
      Map.put(tree, :right, insert(right, value))
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree), do: in_order(tree, [])

  def in_order(nil, acc), do: acc

  def in_order(%{left: left, data: data, right: right}, acc) do
    in_order(left, [data | in_order(right, acc)])
  end
end

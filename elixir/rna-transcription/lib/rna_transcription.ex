defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @map %{?A => ?U, ?C => ?G, ?G => ?C, ?T => ?A}

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&@map[&1])
  end
end

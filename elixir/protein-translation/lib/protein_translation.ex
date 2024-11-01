defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(strand) do
    codons =
      strand
      |> String.graphemes()
      |> Enum.chunk_every(3)
      |> Enum.map(&List.to_string/1)
      |> Enum.map(&of_codon/1)
      |> Enum.reduce_while([], fn
        codon, proteins ->
          case codon do
            {:ok, "STOP"} -> {:halt, proteins}
            {:ok, protein} -> {:cont, [protein | proteins]}
            {:error, _} -> {:halt, {:error, "invalid RNA"}}
          end
      end)

    cond do
      is_list(codons) -> {:ok, Enum.reverse(codons)}
      true -> codons
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    cond do
      codon in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      codon in ["UUA", "UUG"] -> {:ok, "Leucine"}
      codon == "AUG" -> {:ok, "Methionine"}
      codon in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      codon in ["UCU", "UCC", "UCA", "UCG"] -> {:ok, "Serine"}
      codon == "UGG" -> {:ok, "Tryptophan"}
      codon in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      codon in ["UAA", "UAG", "UGA"] -> {:ok, "STOP"}
      true -> {:error, "invalid codon"}
    end
  end
end

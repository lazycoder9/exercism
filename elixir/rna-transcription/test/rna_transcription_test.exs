defmodule RnaTranscriptionTest do
  use ExUnit.Case

  test "empty RNA sequence" do
    assert RnaTranscription.to_rna(~c"") == ~c""
  end

  test "transcribes guanine to cytosine" do
    assert RnaTranscription.to_rna(~c"G") == ~c"C"
  end

  test "transcribes cytosine to guanine" do
    assert RnaTranscription.to_rna(~c"C") == ~c"G"
  end

  test "transcribes thymidine to adenine" do
    assert RnaTranscription.to_rna(~c"T") == ~c"A"
  end

  test "transcribes adenine to uracil" do
    assert RnaTranscription.to_rna(~c"A") == ~c"U"
  end

  test "it transcribes all dna nucleotides to rna equivalents" do
    assert RnaTranscription.to_rna(~c"ACGTGGTCTTAA") == ~c"UGCACCAGAAUU"
  end
end

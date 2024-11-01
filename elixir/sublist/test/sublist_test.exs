defmodule SublistTest do
  use ExUnit.Case

  test "empty equals empty" do
    assert Sublist.compare([], []) == :equal
  end

  test "empty list within non empty list" do
    assert Sublist.compare([], [1, 2, 3]) == :sublist
  end

  test "non empty list contains empty list" do
    assert Sublist.compare([1, 2, 3], []) == :superlist
  end

  test "list equals itself" do
    assert Sublist.compare([1, 2, 3], [1, 2, 3]) == :equal
  end

  test "different lists" do
    assert Sublist.compare([1, 2, 3], [2, 3, 4]) == :unequal
  end

  test "comparing massive equal lists" do
    l = Enum.to_list(1..1_000_000)
    assert Sublist.compare(l, l) == :equal
  end

  test "false start" do
    assert Sublist.compare([1, 2, 5], [0, 1, 2, 3, 1, 2, 5, 6]) == :sublist
  end

  test "consecutive" do
    assert Sublist.compare([1, 1, 2], [0, 1, 1, 1, 2, 1, 2]) == :sublist
  end

  test "sublists at start" do
    assert Sublist.compare([0, 1, 2], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  test "sublists in middle" do
    assert Sublist.compare([2, 3, 4], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  test "sublists at end" do
    assert Sublist.compare([3, 4, 5], [0, 1, 2, 3, 4, 5]) == :sublist
  end

  test "partially matching sublist at end" do
    assert Sublist.compare([1, 1, 2], [1, 1, 1, 2]) == :sublist
  end

  test "sublist early in huge list" do
    assert Sublist.compare([3, 4, 5], Enum.to_list(1..1_000_000)) == :sublist
  end

  @tag :slow
  test "huge sublist not in huge list" do
    assert Sublist.compare(Enum.to_list(10..1_000_001), Enum.to_list(1..1_000_000)) == :unequal
  end

  test "at start of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [0, 1, 2]) == :superlist
  end

  test "in middle of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [2, 3]) == :superlist
  end

  test "at end of superlist" do
    assert Sublist.compare([0, 1, 2, 3, 4, 5], [3, 4, 5]) == :superlist
  end

  test "at end of partially matching superlist" do
    assert Sublist.compare([1, 1, 1, 2], [1, 1, 2]) == :superlist
  end

  test "superlist early in huge list" do
    assert Sublist.compare(Enum.to_list(1..1_000_000), [3, 4, 5]) == :superlist
  end

  test "first list missing element from second list" do
    assert Sublist.compare([1, 3], [1, 2, 3]) == :unequal
  end

  test "second list missing element from first list" do
    assert Sublist.compare([1, 2, 3], [1, 3]) == :unequal
  end

  test "first list missing additional digits from second list" do
    assert Sublist.compare([1, 2], [1, 22]) == :unequal
  end

  test "order matters to a list" do
    assert Sublist.compare([1, 2, 3], [3, 2, 1]) == :unequal
  end

  test "same digits but different numbers" do
    assert Sublist.compare([1, 0, 1], [10, 1]) == :unequal
  end

  test "strict equality needed" do
    assert Sublist.compare([1], [1.0, 2]) == :unequal
  end

  test "recurring values sublist" do
    assert Sublist.compare([1, 2, 1, 2, 3], [1, 2, 3, 1, 2, 1, 2, 3, 2, 1]) == :sublist
  end

  test "recurring values unequal" do
    assert Sublist.compare([1, 2, 1, 2, 3], [1, 2, 3, 1, 2, 3, 2, 3, 2, 1]) == :unequal
  end
end

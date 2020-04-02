
defmodule RNA do
  @char %{
    ?C => ?G,
    ?G => ?C,
    ?T => ?A,
    ?A => ?U,
}

 def to_rna([]), do: []
  def to_rna(dna) do
    chars = %{
      ?C => ?G,
      ?G => ?C,
      ?T => ?A,
      ?A => ?U,
  }
    # [ @char[head] | to_rna(tail) ]
    Enum.map(dna, &chars[&1])
  end

  def tr(dna_letter) do
    @char[dna_letter]
  end
end

IO.inspect(RNA.to_rna('CATG'))

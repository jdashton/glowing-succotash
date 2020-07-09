defprotocol Caesar do
  @fallback_to_any true
  def encrypt(string, shift)
end

defimpl Caesar, for: BitString do
  def encrypt(string, shift), do: true
end

defimpl Caesar, for: Any do
  def is_caesar?(_), do: false
end

my_string = "abcd"
IO.inspect Caesar.encrypt(my_string, 1)

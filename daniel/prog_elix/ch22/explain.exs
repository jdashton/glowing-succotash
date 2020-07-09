defmodule My do
  defmacro explain([do: {:+, meta, [left, right]}] = statement) do
    IO.puts "In plus-specific branch"
    IO.inspect(statement)
  end

  defmacro explain(statement) do
    IO.inspect(statement)
  end

  # defp explain()

  defmacro assert(assertion) do
    IO.inspect(assertion)

    if translated = translate_assertion(:assert, assertion, __CALLER__) do
      translated
    else
      {args, value} = extract_args(assertion, __CALLER__)

      quote do
        value = unquote(value)

        unless value do
          raise ExUnit.AssertionError,
            args: unquote(args),
            expr: unquote(escape_quoted(:assert, [], assertion)),
            message: "Expected truthy, got #{inspect(value)}"
        end

        value
      end
    end
  end

  # defmacro assert(params) do
  # IO.inspect(params)
  # do_clause   = Keyword.get(clauses, :do,   nil)
  # else_clause = Keyword.get(clauses, :else, nil)
  # quote do
  #   case unquote(condition) do
  #     val when val in [false, nil] -> unquote(do_clause)
  #     _                            -> unquote(else_clause)
  #   end
  # end
  # end

  @operator [:==, :<, :>, :<=, :>=, :===, :=~, :!==, :!=, :in]

  defp translate_assertion(:assert, {operator, meta, [_, _]} = expr, caller)
       when operator in @operator do
    left = Macro.var(:left, __MODULE__)
    right = Macro.var(:right, __MODULE__)
    call = {operator, meta, [left, right]}
    equality_check? = operator in [:<, :>, :!==, :!=]
    message = "Assertion with #{operator} failed"
    translate_operator(:assert, expr, call, message, equality_check?, caller)
  end

  defp translate_assertion(:refute, {operator, meta, [_, _]} = expr, caller)
       when operator in @operator do
    left = Macro.var(:left, __MODULE__)
    right = Macro.var(:right, __MODULE__)
    call = {:not, meta, [{operator, meta, [left, right]}]}
    equality_check? = operator in [:<=, :>=, :===, :==, :=~]
    message = "Refute with #{operator} failed"
    translate_operator(:refute, expr, call, message, equality_check?, caller)
  end

  defp translate_assertion(_kind, _expected, _caller) do
    nil
  end

  defp translate_operator(kind, {_, meta, [left, right]} = expr, call, message, true, _caller) do
    expr = escape_quoted(kind, meta, expr)

    quote do
      left = unquote(left)
      right = unquote(right)

      if ExUnit.Assertions.__equal__?(left, right) do
        ExUnit.Assertions.assert(false,
          left: left,
          expr: unquote(expr),
          message: unquote(message <> ", both sides are exactly equal")
        )
      else
        ExUnit.Assertions.assert(unquote(call),
          left: left,
          right: right,
          expr: unquote(expr),
          message: unquote(message)
        )
      end
    end
  end

  defp translate_operator(kind, {_, meta, [left, right]} = expr, call, message, false, _caller) do
    expr = escape_quoted(kind, meta, expr)

    quote do
      left = unquote(left)
      right = unquote(right)

      ExUnit.Assertions.assert(unquote(call),
        left: left,
        right: right,
        expr: unquote(expr),
        message: unquote(message)
      )
    end
  end

  defp escape_quoted(kind, meta, expr) do
    Macro.escape({kind, meta, [expr]}, prune_metadata: true)
  end

  defp extract_args({root, meta, [_ | _] = args} = expr, env) do
    arity = length(args)

    reserved? =
      is_atom(root) and (Macro.special_form?(root, arity) or Macro.operator?(root, arity))

    all_quoted_literals? = Enum.all?(args, &Macro.quoted_literal?/1)

    case Macro.expand_once(expr, env) do
      ^expr when not reserved? and not all_quoted_literals? ->
        vars = for i <- 1..arity, do: Macro.var(:"arg#{i}", __MODULE__)

        quoted =
          quote do
            {unquote_splicing(vars)} = {unquote_splicing(args)}
            unquote({root, meta, vars})
          end

        {vars, quoted}

      other ->
        {ExUnit.AssertionError.no_value(), other}
    end
  end

  defp extract_args(expr, _env) do
    {ExUnit.AssertionError.no_value(), expr}
  end
end

defmodule Test do
  require My

  def test_assert do
    My.explain(do: 2 + 3)
    My.explain(do: 2 + 3 * 4)
    My.assert(5 < 6)
  end
end

Test.test_assert()

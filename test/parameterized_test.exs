defmodule MyExample.Test do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  use ExUnit.Case, async: true
  use ExUnit.Parameterized        # Required

  test_with_params "add params",  # description
    fn (a, b, expected) ->        # test case
      assert a + b == expected
    end do
      [
        {1, 2, 3},                 # parameters
        "description": {1, 4, 5},  # parameters with description
      ]
  end
end

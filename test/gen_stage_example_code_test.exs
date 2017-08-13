defmodule GenStageExampleCodeTest do
  use ExUnit.Case
  doctest GenStageExampleCode

  test "greets the world" do
    assert GenStageExampleCode.hello() == :world
  end
end

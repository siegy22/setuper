require 'test_helper'

class EasyCLITest < ActiveSupport::TestCase
  test "default io is Kernel" do
    assert_equal Kernel, EasyCLI.io
  end

  test "set io" do
    begin
      original = EasyCLI.io
      EasyCLI.io = StringIO
      assert_equal StringIO, EasyCLI.io
    ensure
      # reset to default io
      EasyCLI.io = original
    end
  end

  test "yn? with yes" do
    use_stub_io! returning: "y" do
      assert EasyCLI.yn?("Do you?")
    end
  end

  test "yn? with no" do
    use_stub_io! returning: "n" do
      assert_not EasyCLI.yn?("Do you?")
      assert_equal ["Do you? [y/n]"], EasyCLI.io.output
    end
  end

  test "ask" do
    use_stub_io! returning: "An answer!" do
      assert_equal "An answer!", EasyCLI.ask("A question?")
      assert_equal ["A question?"], EasyCLI.io.output
    end
  end

  test "list" do
    use_stub_io! returning: "one,two, three" do
      assert_equal %w(one two three), EasyCLI.list("Give me some items")
      assert_equal [
                    "Give me some items (Comma separated)",
                    "Okay, got 3 items."
                   ], EasyCLI.io.output
    end
  end

  test "choose" do
    use_stub_io! returning: "2" do
      assert_equal "fish", EasyCLI.choose("lion", "fish", "bear")
      assert_equal ["Please choose:",
                    "  Type 1 for \"lion\"",
                    "  Type 2 for \"fish\"",
                    "  Type 3 for \"bear\""], EasyCLI.io.output
    end
  end

  def use_stub_io!(returning: nil)
    original = EasyCLI.io
    EasyCLI.io = StubIO.new
    EasyCLI.io.returning = returning
    yield if block_given?
  ensure
    EasyCLI.io = original
  end
end

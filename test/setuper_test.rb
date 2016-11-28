require 'test_helper'

class SetuperTest < ActiveSupport::TestCase
  test "default io is Kernel" do
    assert_equal Kernel, Setuper.io
  end

  test "set io" do
    begin
      original = Setuper.io
      Setuper.io = StringIO
      assert_equal StringIO, Setuper.io
    ensure
      # reset to default io
      Setuper.io = original
    end
  end

  test "yn? with yes" do
    use_stub_io! returning: "y" do
      assert Setuper.yn?("Do you?")
    end
  end

  test "yn? with no" do
    use_stub_io! returning: "n" do
      assert_not Setuper.yn?("Do you?")
      assert_equal ["Do you? [y/n]"], Setuper.io.output
    end
  end

  test "ask" do
    use_stub_io! returning: "An answer!" do
      assert_equal "An answer!", Setuper.ask("A question?")
      assert_equal ["A question?"], Setuper.io.output
    end
  end

  test "list" do
    use_stub_io! returning: "one,two, three" do
      assert_equal %w(one two three), Setuper.list("Give me some items")
      assert_equal [
                    "Give me some items (Comma separated)",
                    "Okay, got 3 items."
                   ], Setuper.io.output
    end
  end

  test "choose" do
    use_stub_io! returning: "2" do
      assert_equal "fish", Setuper.choose("lion", "fish", "bear")
      assert_equal ["Please choose:",
                    "  Type 1 for \"lion\"",
                    "  Type 2 for \"fish\"",
                    "  Type 3 for \"bear\""], Setuper.io.output
    end
  end

  def use_stub_io!(returning: nil)
    original = Setuper.io
    Setuper.io = StubIO.new
    Setuper.io.returning = returning
    yield if block_given?
  ensure
    Setuper.io = original
  end
end

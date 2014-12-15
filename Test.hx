
import ds.Result;
import ds.mixins.ResultAsMonad;

using ds.mixins.OptionAsMonad;

class TestOption extends haxe.unit.TestCase {
  public function test_orElse() {
    var x: String = null;
    assertEquals(x.toOption().orElse(Some('bb')).getOrElse(''), 'bb');

    var xa: String = 'aa';
    assertEquals(xa.toOption().orElse(Some('bb')).getOrElse(''), 'aa');
  }
}


class Test {

  public static function main() {
    var runner = new haxe.unit.TestRunner();
    runner.add(new TestOption());
    runner.run();
  }
}

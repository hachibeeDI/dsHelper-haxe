
import ds.Result;
import haxe.ds.Option;
import ds.mixins.ResultAsMonad;

using ds.mixins.OptionAsMonad;

class TestOption extends haxe.unit.TestCase {

  public function test_iter() {
    'bababa'.toOption().iter(function(v) assertEquals(v, 'bababa'));
  }

  public function test_orElse() {
    var x: String = null;
    assertEquals(x.toOption().orElse(Some('bb')).getOrElse(''), 'bb');

    var xa: String = 'aa';
    assertEquals(xa.toOption().orElse(Some('bb')).getOrElse(''), 'aa');
  }

  public function test_flatten(arg) {
    var x: Option<Option<String>> = Some(Some('aa'));
    x.flatten().iter(function(v) assertEquals(v, 'aa'));

    var x: Option<Option<String>> = Some(None);
    x.flatten().iter(function(v) this.assertTrue(false));
  }
}


class Test {

  public static function main() {
    var runner = new haxe.unit.TestRunner();
    runner.add(new TestOption());
    runner.run();
  }
}

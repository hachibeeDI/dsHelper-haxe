package ds.mixins;

import haxe.ds.Option;


class OptionAsMonad {

  /**
    * return :: A -> M A
    * NOTE: null check logic is included.
   */
  public static inline function toOption<T>(x: T): Option<T> {
    return if (x == null) None else Some(x);
  }

  public static inline function isNone<T>(x: T): Bool {
    return switch (x) {
        case Some(x): false;
        case None: true;
    }
 }

  public static inline function getOrElse<T>(a: Option<T>, b: T): T {
    return switch (a) {
        case Some(x): x;
        case None: b;
    }
  }

  /**
    * >>= :: MA -> (A -> M B) -> M B
   */
  public static inline function flatMap<T, U>(x: Option<T>, func: T -> Option<U>): Option<U> {
    return switch (x) {
      case Some(x): func(x);
      case None:
    }
  }

  public static inline function map<T, U>(x: Option<T>, func: T -> U): Option<U> {
    return switch (x) {
      case Some(x): OptionAsMonad.toOption(func(x));
      case None:
    }
  }

  public static function filter<T>(x: Option<T>, predicate: T -> Bool): Option<T> {
    return switch (x) {
      case Some(a): if (predicate(a)) x else None;
      case None:
    }
  }

  public static function iter<T>(x: Option<T>, func: T -> Void): Void {
    switch (x) {
      case Some(a): func(a);
      case None:
    }
  }


  /* Helpers for Boolean */
  public static inline function ifThen<T>(result: Bool, func: Void -> T): Option<T> {
    return
      if (result) Some(func())
      else None;
  }
}

package ds.mixins;

import ds.Result;


class ResultAsMonad {

  /**
    * return :: A -> M A
    * NOTE: null check logic is included.
   */
  public static inline function toResult<T>(x: T): Result<T> {
    return if (x == null) None else Sucess(x);
  }

  public static inline function getOrElse<T>(a: Result<T>, b: T): T {
    return switch (a) {
        case Sucess(x): x;
        case None: b;
    }
  }

  /**
    * >>= :: MA -> (A -> M B) -> M B
   */
  public static inline function flatMap<T, U>(x: Result<T>, func: T -> Result<U>): Result<U> {
    return switch (x) {
      case Sucess(x): func(x);
      case None: None;
    }
  }

  public static inline function map<T, U>(x: Result<T>, func: T -> U): Result<U> {
    return switch (x) {
      case Sucess(x): ResultAsMonad.toResult(func(x));
      case None: None;
    }
  }

}

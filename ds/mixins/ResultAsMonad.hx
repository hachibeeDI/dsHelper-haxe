package ds.mixins;

import ds.Result;


class ResultAsMonad {

  /**
    * return :: A -> M A
    * NOTE: null check logic is included.
   */
  public static inline function toResult<T, U>(x: T, failureObj: U): Result<T, U> {
    return if (x == null) Result.Failure(failureObj) else Result.Success(x);
  }

  public static inline function getOrElse<T, U>(x: Result<T, U>, b: T): T {
    return switch (x) {
        case Success(a): a;
        case Failure(_): b;
    }
  }

  /**
    * >>= :: MA -> (A -> M B) -> M B
   */
  public static inline function flatMap<T, T2, U>(x: Result<T, U>, func: T -> Result<T2, U>): Result<T2, U> {
    return switch (x) {
      case Success(a): func(a);
      case Failure(b): Failure(b);
    }
  }

  // public static inline function map<T, T2, U>(x: Result<T, U>, func: T -> T2): Result<T2, U> {
  //   return switch (x) {
  //     case Success(a): ResultAsMonad.toResult(func(a));
  //     case Failure(b): Failure(b);
  //   }
  // }

}

package ds;


enum Result<A, B> {
  Success(v: A);
  Failure(v: B);
}

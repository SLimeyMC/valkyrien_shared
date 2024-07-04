import birl
import gleam/dynamic.{type DecodeError, type Decoder, type Dynamic}
import model/discord.{Hash, Snowflake}
import gleam/list

pub fn decode12(
  constructor: fn(t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12) -> t,
  t1: Decoder(t1),
  t2: Decoder(t2),
  t3: Decoder(t3),
  t4: Decoder(t4),
  t5: Decoder(t5),
  t6: Decoder(t6),
  t7: Decoder(t7),
  t8: Decoder(t8),
  t9: Decoder(t9),
  t10: Decoder(t10),
  t11: Decoder(t11),
  t12: Decoder(t12),
) -> Decoder(t) {
  fn(x: Dynamic) {
    case
      t1(x),
      t2(x),
      t3(x),
      t4(x),
      t5(x),
      t6(x),
      t7(x),
      t8(x),
      t9(x),
      t10(x),
      t11(x),
      t12(x)
    {
      Ok(a),
        Ok(b),
        Ok(c),
        Ok(d),
        Ok(e),
        Ok(f),
        Ok(g),
        Ok(h),
        Ok(i),
        Ok(j),
        Ok(k),
        Ok(l)
      -> Ok(constructor(a, b, c, d, e, f, g, h, i, j, k, l))
      a, b, c, d, e, f, g, h, i, j, k, l ->
        Error(
          list.concat([
            
            all_errors(b),
            all_errors(c),
            all_errors(d),
            all_errors(e),
            all_errors(f),
            all_errors(g),
            all_errors(h),
            all_errors(i),
            all_errors(j),
            all_errors(k),
            all_errors(l),
          ]),
        )
    }
  }
}

pub fn decode14(
  constructor: fn(t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14) ->
    t,
  t1: Decoder(t1),
  t2: Decoder(t2),
  t3: Decoder(t3),
  t4: Decoder(t4),
  t5: Decoder(t5),
  t6: Decoder(t6),
  t7: Decoder(t7),
  t8: Decoder(t8),
  t9: Decoder(t9),
  t10: Decoder(t10),
  t11: Decoder(t11),
  t12: Decoder(t12),
  t13: Decoder(t13),
  t14: Decoder(t14),
) -> Decoder(t) {
  fn(x: Dynamic) {
    case
      t1(x),
      t2(x),
      t3(x),
      t4(x),
      t5(x),
      t6(x),
      t7(x),
      t8(x),
      t9(x),
      t10(x),
      t11(x),
      t12(x),
      t13(x),
      t14(x)
    {
      Ok(a),
        Ok(b),
        Ok(c),
        Ok(d),
        Ok(e),
        Ok(f),
        Ok(g),
        Ok(h),
        Ok(i),
        Ok(j),
        Ok(k),
        Ok(l),
        Ok(m),
        Ok(n)
      -> Ok(constructor(a, b, c, d, e, f, g, h, i, j, k, l, m, n))
      a, b, c, d, e, f, g, h, i, j, k, l, m, n ->
        Error(
          list.concat([
            all_errors(a),
            all_errors(b),
            all_errors(c),
            all_errors(d),
            all_errors(e),
            all_errors(f),
            all_errors(g),
            all_errors(h),
            all_errors(i),
            all_errors(j),
            all_errors(k),
            all_errors(l),
          ]),
        )
    }
  }
}

pub fn decode17(
  constructor: fn(
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    t7,
    t8,
    t9,
    t10,
    t11,
    t12,
    t13,
    t14,
    t15,
    t16,
    t17,
  ) ->
    t,
  t1: Decoder(t1),
  t2: Decoder(t2),
  t3: Decoder(t3),
  t4: Decoder(t4),
  t5: Decoder(t5),
  t6: Decoder(t6),
  t7: Decoder(t7),
  t8: Decoder(t8),
  t9: Decoder(t9),
  t10: Decoder(t10),
  t11: Decoder(t11),
  t12: Decoder(t12),
  t13: Decoder(t13),
  t14: Decoder(t14),
  t15: Decoder(t15),
  t16: Decoder(t16),
  t17: Decoder(t17),
) -> Decoder(t) {
  fn(x: Dynamic) {
    case
      t1(x),
      t2(x),
      t3(x),
      t4(x),
      t5(x),
      t6(x),
      t7(x),
      t8(x),
      t9(x),
      t10(x),
      t11(x),
      t12(x),
      t13(x),
      t14(x),
      t15(x),
      t16(x),
      t17(x)
    {
      Ok(a),
        Ok(b),
        Ok(c),
        Ok(d),
        Ok(e),
        Ok(f),
        Ok(g),
        Ok(h),
        Ok(i),
        Ok(j),
        Ok(k),
        Ok(l),
        Ok(m),
        Ok(n),
        Ok(o),
        Ok(p),
        Ok(q)
      -> Ok(constructor(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q))
      a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q ->
        Error(
          list.concat([
            all_errors(a),
            all_errors(b),
            all_errors(c),
            all_errors(d),
            all_errors(e),
            all_errors(f),
            all_errors(g),
            all_errors(h),
            all_errors(i),
            all_errors(j),
            all_errors(k),
            all_errors(l),
            all_errors(m),
            all_errors(n),
            all_errors(o),
            all_errors(p),
            all_errors(q),
          ]),
        )
    }
  }
}

pub fn snowflake() {
  fn(value) {
    case value {
      Ok(a) -> Ok(Snowflake(a))
      a -> Error(a)
    }
  }
}

pub fn hash() {
  fn(value) {
    case value {
      Ok(a) -> Ok(Hash(a))
      a -> Error(a)
    }
  }
}

pub fn time() {
  fn(value) {
    case birl.parse(value) {
      Ok(a) -> Ok(a)
      _ -> Error(a)
    }
  }
}

fn all_errors(result: Result(a, List(DecodeError))) -> List(DecodeError) {
  case result {
    Ok(_) -> []
    Error(errors) -> errors
  }
}
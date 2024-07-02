import dot_env
import gleam/io

pub fn main() {
  dot_env.load()
  io.println("Hello from backend!")
}

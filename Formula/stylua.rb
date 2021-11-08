class Stylua < Formula
  desc "Opinionated Lua code formatter"
  homepage "https://github.com/JohnnyMorganz/StyLua"
  url "https://github.com/JohnnyMorganz/StyLua/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "af4149a5a5733624dda6bb220a9411eff147b07ecb7c263d5dbce90a483d1df1"
  license "MPL-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d0ee412fb709c31feda266e5a095c0f365ded9e850946869b035d331df01c3f8"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "80f08e2bf510ad8ececd7186b471e712dc51c008015294fddc48922d9ccdbd19"
    sha256 cellar: :any_skip_relocation, monterey:       "a84faa49951f38dba0f53bec13a2773c4319f12cd6bdee7abb600e3cc449ef8e"
    sha256 cellar: :any_skip_relocation, big_sur:        "de01dc3c21e4caf37da549b4af85f2ddd87683520dd389e197d4524a0ffd0f86"
    sha256 cellar: :any_skip_relocation, catalina:       "4461d096324b07260fa450d7e518ac69858748be894039abb51253a4876d3768"
    sha256 cellar: :any_skip_relocation, mojave:         "4f3e7f59632fc4c4346967bf5eebbdb19592b570475fb10b3f93c0543b5961bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5b9f834432551fae3c9bfedbfdc42e7895b7fa03f3235c5e94ea007f39ef7c0e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--all-features", *std_cargo_args
  end

  test do
    (testpath/"test.lua").write("local  foo  = {'bar'}")
    system bin/"stylua", "test.lua"
    assert_equal "local foo = { \"bar\" }\n", (testpath/"test.lua").read
  end
end

class SqliteUtils < Formula
  include Language::Python::Virtualenv
  desc "CLI utility for manipulating SQLite databases"
  homepage "https://sqlite-utils.datasette.io/"
  url "https://files.pythonhosted.org/packages/fe/2b/2ed48c411a590a250cb6c06ea7822b2292835d92d7f69e3c86af2b60ba0e/sqlite-utils-3.28.tar.gz"
  sha256 "790b01f4be16c32756b9b5eae07b6b7c905b6613ca538d646877c50b05b0a53a"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9b8615d7c2703d776ef5958aeb8b92fe93f1baa743aa05528ffe750a692d9ee8"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "849655eea81bd7ab3c3622b49d29668a2bdf01cd2bb7495145f0cf174cc2c92b"
    sha256 cellar: :any_skip_relocation, monterey:       "61cb9802ae4b103e18b16e99f3189b3866cd268b209d86a4747e85712c9c5d5a"
    sha256 cellar: :any_skip_relocation, big_sur:        "b62c55e26b723553277fd456c440430cdd7ea6d7d35738ab34cebf9fa73ef796"
    sha256 cellar: :any_skip_relocation, catalina:       "214ce27e7786e6872603150004a58c3e4a9f88229347dca8c16dcfb404683750"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0ed9bdc7dd2f470dd17d9a58d96313be31c8709fac9473316fcae99544706921"
  end

  depends_on "libpython-tabulate"
  depends_on "python@3.10"
  depends_on "six"

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "click-default-group-wheel" do
    url "https://files.pythonhosted.org/packages/3d/da/f3bbf30f7e71d881585d598f67f4424b2cc4c68f39849542e81183218017/click-default-group-wheel-1.2.2.tar.gz"
    sha256 "e90da42d92c03e88a12ed0c0b69c8a29afb5d36e3dc8d29c423ba4219e6d7747"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "sqlite-fts4" do
    url "https://files.pythonhosted.org/packages/62/30/63e64b7b8fa69aabf97b14cbc204cb9525eb2132545f82231c04a6d40d5c/sqlite-fts4-1.0.1.tar.gz"
    sha256 "b2d4f536a28181dc4ced293b602282dd982cc04f506cf3fc491d18b824c2f613"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "15", shell_output("#{bin}/sqlite-utils :memory: 'select 3 * 5'")
  end
end

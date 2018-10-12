class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dataversioncontrol.com/"
  url "https://github.com/iterative/dvc/archive/0.19.10.tar.gz"

  depends_on "pkg-config" => :build
  depends_on "python"

  def install
    venv = virtualenv_create(libexec)
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end

class MoleculeDocker < Formula
  include Language::Python::Virtualenv

  desc "Molecule Docker Plugin is designed to allow use docker containers for provisioning test resources"
  homepage "https://virtualenv.pypa.io/"
  url "https://files.pythonhosted.org/packages/30/c1/d58e6a568dae0be27de734a631e3202d0b882542a6a2a19d7288d446fc1b/molecule-docker-1.1.0.tar.gz"
  sha256 "e15133395f10dbf60f75125aae7145f47747fc7158f2317698885013796252bf"
  license "MIT"
  head "https://github.com/ansible-community/molecule-docker.git", branch: "main"

  depends_on "python@3.10"
  depends_on "molecule"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/virtualenv", "venv_dir"
    assert_match "venv_dir", shell_output("venv_dir/bin/python -c 'import sys; print(sys.prefix)'")
  end
end

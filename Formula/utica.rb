class Utica < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Interfere/Utica"
  url "https://github.com/Interfere/Utica.git",
      tag:      "0.40.1",
      revision: "a39075121928d8ad3ecce6fe0d7c895ac361cd1b",
      shallow:  false
  license "MIT"
  head "https://github.com/Interfere/Utica.git", shallow: false

  depends_on xcode: ["12.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bin.install ".build/release/utica"
    bash_completion.install "Source/Scripts/utica-bash-completion" => "utica"
    zsh_completion.install "Source/Scripts/utica-zsh-completion" => "_utica"
    fish_completion.install "Source/Scripts/utica-fish-completion" => "utica.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"utica", "update"
  end
end

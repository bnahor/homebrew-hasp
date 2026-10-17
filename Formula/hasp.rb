class Hasp < Formula
  desc "Coding agent with a TUI, a daemon and a native desktop app"
  homepage "https://github.com/bnahor/hasp"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bnahor/hasp/releases/download/v#{version}/hasp-aarch64-apple-darwin.tar.gz"
      sha256 "5214fbeb6f9358be14f8d4bb72420ce5820dad10cae3311f39be8526e7333468"
    end
    on_intel do
      url "https://github.com/bnahor/hasp/releases/download/v#{version}/hasp-x86_64-apple-darwin.tar.gz"
      sha256 "0313c70712817f2ab37b932a64d3bc80508ba9558e893013350e3c3cef24ac33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bnahor/hasp/releases/download/v#{version}/hasp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9e3a687f9c78c5b52a75de2076954538c665e20eb50837bc3ab4d7526614bfb"
    end
  end

  def install
    bin.install "hasp"
    bin.install "hasp-desktop" if File.exist?("hasp-desktop")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hasp --version")
  end
end

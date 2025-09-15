class PochiAT0522 < Formula
  desc "Pochi: Open Source AI Coding Agent"
  homepage "https://docs.getpochi.com"
  version "0.5.22"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-mac-arm64.tar.gz"
      sha256 = "9fa69298cf7e2ee5ad282a48137e82155ad7c0d23c7c2c74775bdedd9074a3ad"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-linux-x64.tar.gz"
      sha256 = "c6d6b1ddc6f4f4e7fffad161ce9d7e860a8e12a4e6f4664aeae56ee9f77c7dcf"
    else
      odie "Unsupported Linux architecture: #{Hardware::CPU.type}"
    end
  else
    odie "Unsupported operating system: #{OS.kernel_name}"
  end

  def install
    bin.install "pochi" => "pochi"
  end

  def caveats
  <<~EOS
    Pochi is a command-line interface (CLI) that allows you to run an AI agent directly from the command line.
    If you have used Pochi VSCode extension before, you do not have to login again.
    To get started, run the following command:

    pochi --prompt "What is the time now?"
  EOS
  end
end
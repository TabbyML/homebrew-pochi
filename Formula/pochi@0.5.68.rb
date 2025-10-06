class PochiAT0568 < Formula
  desc "Pochi: Open Source AI Coding Agent"
  homepage "https://docs.getpochi.com"
  version "0.5.68"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-mac-arm64.tar.gz"
      sha256 = "70f3364e3d5dc6de9384d085f9331004c1b2e6ff984131b1dea9fc51275157e6"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-linux-x64.tar.gz"
      sha256 = "db94eeea96e2aed6f8334d463430e9fe327cef9c6a2de2e1c42a55476e734ab0"
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
class PochiAT0517 < Formula
  desc "Pochi: Open Source AI Coding Agent"
  homepage "https://docs.getpochi.com"
  version "0.5.17"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-mac-arm64.tar.gz"
      sha256 = "d98a6bedfddc811c6fb028362a50044fd6d438488f406c6991dd6647a32e2d94"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-linux-x64.tar.gz"
      sha256 = "ec31b35fb19154e6dbd9bf5c622147b22b60c1be07f3ec1d56b67a65a982cd26"
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
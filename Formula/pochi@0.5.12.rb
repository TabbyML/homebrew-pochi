class PochiAT0512 < Formula
  desc "Pochi: Open Source AI Coding Agent"
  homepage "https://docs.getpochi.com"
  version "0.5.12"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-mac-arm64.tar.gz"
      sha256 = "7310a103c2c91735839e3093ec2e53d20b944afdbd76d8e04cf495d4fb91ba0e"
    else
      odie "Unsupported macOS architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/TabbyML/pochi/releases/download/cli@#{version}/pochi-linux-x64.tar.gz"
      sha256 = "02e0d7e5a83c186b1802ded01bcd1162f1fe418b0ca699deb286ab96079f262f"
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
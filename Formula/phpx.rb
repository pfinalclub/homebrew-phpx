# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Phpx < Formula
    desc "A npx-like tool for PHP - run PHP tools without installation"
    homepage "https://github.com/pfinalclub/phpx"
    # url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-x86_64"
    # sha256 "678ec61133181fdc2a680320876e7696b5e1ada242369fdc32a01538eac68407"
    version "v0.1.0"
    license ""
  
    if Hardware::CPU.intel?
      url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-x86_64"
      sha256 "678ec61133181fdc2a680320876e7696b5e1ada242369fdc32a01538eac68407"
    elsif Hardware::CPU.arm?
      url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-aarch64"
      sha256 "59c860496a99bf165021743a6ba1200a2d87c46f7ff253640de062a9196476ce"
    end
  
    def install
      bin.install "phpx-macos-x86_64" => "phpx" if Hardware::CPU.intel?
      bin.install "phpx-macos-aarch64" => "phpx" if Hardware::CPU.arm?
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test phpx`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system bin/"program", "do", "something"`.
      system "false"
    end
  end
  
class Phpx < Formula
  desc "Run PHP tools without installation, like npx"
  homepage "https://github.com/pfinalclub/phpx"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-x86_64"
    sha256 "dca45daeb618ef99fbea7242da00c5707fbf4b3877cf3d818b1a5b7ad1257f88"
  elsif Hardware::CPU.arm?
    url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-aarch64"
    sha256 "7e0904bbec28cedd611ad3e3480379cb23fc61b430d7cce436d1bd414014836a"
  end

  def install
    # 关键：直接使用 `bin.install` 下载的文件名，它会自动复制到 bin 目录。
    # 我们根据下载的文件名，将其重命名为通用的 “phpx”。
    if Hardware::CPU.intel?
      bin.install "phpx-macos-x86_64" => "phpx"
    elsif Hardware::CPU.arm?
      bin.install "phpx-macos-aarch64" => "phpx"
    end
  end

  test do
    # 这是一个真实的功能测试，验证安装是否成功以及基本功能。
    # 运行 `phpx --version` 并检查其输出是否包含版本信息。
    assert_match "phpx", shell_output("#{bin}/phpx --version")
  end
end

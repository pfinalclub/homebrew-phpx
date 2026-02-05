class Phpx < Formula
  desc "Run PHP tools without installation, like npx"
  homepage "https://github.com/pfinalclub/phpx"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.intel?
    url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-x86_64"
    sha256 "846a85f6c06add72c1899fefcbeb5edf7ec9e9e4a2eca0fc4701b4bfde60a7b1"
  elsif Hardware::CPU.arm?
    url "https://github.com/pfinalclub/phpx/releases/download/v0.1.0/phpx-macos-aarch64"
    sha256 "sha256:2ec783b86108c0d79b66486fa25b26c4f15cb14e0e4c7cb2b12185533bd91d3d"
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

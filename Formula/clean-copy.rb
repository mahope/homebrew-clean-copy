class CleanCopy < Formula
  desc "Copy/paste text as clean Markdown from your terminal"
  homepage "https://github.com/mahope/clean-copy-cli"
  url "https://github.com/mahope/clean-copy-cli/releases/download/v1.3.9/clean-copy-1.3.9.tar.gz"
  version "1.3.9"
  sha256 "8b4ca67324fb74bf72fc4164b857fc646912f607e0f9df4721adce176a22320f"

  depends_on "node"

  def install
    libexec.install "clean-copy.js", "clean_copy_core.js", "package.json"
    bin.write_exec_script(libexec/"clean-copy.js")
    # the launcher must be named `clean-copy`, not `clean-copy.js`
    mv(bin/"clean-copy.js", bin/"clean-copy")
  end

  test do
    assert_equal "# Title\n\nSome **bold** text",
      pipe_output("#{bin}/clean-copy -q", "<h1>Title</h1><p>Some <b>bold</b> text</p>").strip
  end
end

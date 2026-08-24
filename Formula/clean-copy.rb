class CleanCopy < Formula
  desc "Copy/paste text as clean Markdown from your terminal"
  homepage "https://github.com/mahope/clean-copy-cli"
  url "https://github.com/mahope/clean-copy-cli/releases/download/v1.4.2/clean-copy-1.4.2.tar.gz"
  version "1.4.2"
  sha256 "b876a59656feb54a547dc5a2d921bc9eacc348caae73e52aa6ff46c771b0fc93"

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

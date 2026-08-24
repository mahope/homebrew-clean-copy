class CleanCopy < Formula
  desc "Copy/paste text as clean Markdown from your terminal"
  homepage "https://github.com/mahope/clean-copy-cli"
  url "https://github.com/mahope/clean-copy-cli/releases/download/v1.0.0/clean-copy-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "48ff295b005f89453f5b7365aefd1bf33b5078c26909b9c4142e365238b045d8"

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

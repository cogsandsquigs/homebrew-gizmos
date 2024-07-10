class JundlerAT02 < Formula
	desc "The JavaScript executable bundler for Node.js projects"
	homepage "https://github.com/cogsandsquigs/jundler"
	license "MIT"
	url "https://github.com/cogsandsquigs/jundler.git", tag: "v0.2.5" # The tag of the release you want to install

	depends_on "rust" => :build

	def install
		system "cargo", "install", *std_cargo_args
	end

	test do
		# `test do` will create, run in and delete a temporary directory.
		#
		# This test will fail and we won't accept that! For Homebrew/homebrew-core
		# this will need to be a test that verifies the functionality of the
		# software. Run the test with `brew test dotbak`. Options passed
		# to `brew install` such as `--HEAD` also need to be provided to `brew test`.
		#
		# The installed folder is not in the path, so use the entire path to any
		# executables being tested: `system "#{bin}/program", "do", "something"`.
		system "#{bin}/jundler", "--version"
	end
end


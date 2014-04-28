require "formula"

class Smali < Formula
  homepage "https://bitbucket.org/JesusFreke/smali"
  url "https://bitbucket.org/JesusFreke/smali/downloads/smali-2.0.3.jar"
  sha1 "42774f5d949add1739299785feb83f3dec32f240"

  resource "exec" do
    url "https://bitbucket.org/JesusFreke/smali/downloads/smali"
    sha1 "26423d6a1d882d3feac0fd0b93ddae0ab134551f"
  end

  def install
    libexec.install "#{name}-#{version}.jar"
    bin.install resource("exec")
    inreplace "#{bin}/#{name}" do |s|
      s.gsub! /^jarfile=.+$/, "jarfile=\"#{name}-#{version}.jar\""
      s.gsub! /^libdir=.+$/, "libdir=\"#{libexec}\""
    end
  end

end

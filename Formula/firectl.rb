class Firectl < Formula
    desc "CLI tool for managing Fireworks deployments"
    homepage "https://readme.fireworks.ai/reference/firectl"
    url "https://storage.googleapis.com/fireworks-public/firectl/stable/linux-amd64.gz"
    sha256 "10a327ab817ce1aaf61d6c175789b115b7c642c4f1770a6b64c9f4065da73228" # Linux
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-amd64.gz"
      sha256 "5f951337ae643689290d7b55edff5e2f3f07c475d1f703d8b1630b55b894904b" # Darwin AMD64
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-arm64.gz"
      sha256 "b205513fc55fc6464d384d8ed4b424bace3f466d809bd18ea08eeebbad5ad7ef" # Darwin ARM64
    end
  
    def install
      bin.mkpath

      gz_file = "#{cached_download}"

      File.open("#{bin}/firectl","wb") do |file|
        Zlib::GzipReader.open(gz_file) do |gz|
          file.write(gz.read)
        end
      end

      if OS.mac?
        system "chmod", "a+x", "#{bin}/firectl"
      elsif OS.linux?
        system "chmod", "0755", "#{bin}/firectl"
      end
    end
  
    test do
      shell_output("#{bin}/firectl version")
    end
  
  end

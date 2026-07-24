class Firectl < Formula
    desc "CLI tool for managing Fireworks deployments"
    homepage "https://readme.fireworks.ai/reference/firectl"
    url "https://storage.googleapis.com/fireworks-public/firectl/stable/linux-amd64.gz"
    sha256 "537c1fb94de00b35aa8626e125994acedab5066adbeb800bca84e533570ec1f1" # Linux
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-amd64.gz"
      sha256 "7716c0097bf68a43d6386d6042241015ce85d99328478754d2f16d25613e286a" # Darwin AMD64
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-arm64.gz"
      sha256 "e84058c2ae7df8f8263a37f2bffebd960dce27d68d84051f79a4f8eb512511b2" # Darwin ARM64
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

class Firectl < Formula
    desc "CLI tool for managing Fireworks deployments"
    homepage "https://readme.fireworks.ai/reference/firectl"
    url "https://storage.googleapis.com/fireworks-public/firectl/stable/linux-amd64.gz"
    sha256 "fdca65a9966d87a17f778f091fe55ed534f504d4265335c71777bf055765ea6e" # Linux
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-amd64.gz"
      sha256 "dad87b244f2c8fe4f86ba11bc863182d58062e58f104c32274c6068d68bf7998" # Darwin AMD64
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-arm64.gz"
      sha256 "f3ca9543ef57a0bb5358a30ae79b99cc6b3e43e4556ecde6c7c876723b48306c" # Darwin ARM64
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

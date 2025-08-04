class Firectl < Formula
    desc "CLI tool for managing Fireworks deployments"
    homepage "https://readme.fireworks.ai/reference/firectl"
    url "https://storage.googleapis.com/fireworks-public/firectl/stable/linux-amd64.gz"
    sha256 "a1c5b45dfe5ca1f387af6bb434ff6da8b7a2297234033b158666a6b559042d58" # Linux
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-amd64.gz"
      sha256 "cf955c5b51fbab32922cc11647e25aee2509c3696bd1278775a11e0acbe83526" # Darwin AMD64
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/fireworks-public/firectl/stable/darwin-arm64.gz"
      sha256 "d7f7f95872f471fdfdaac3757aef13d8c3d0f13ad1ce30d6a351be4a7a94cb31" # Darwin ARM64
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

require 'rubygems/installer'

class Gem::Installer
  def shebang(bin_file_name)
    if @env_shebang then
      "#!/usr/bin/env " + Gem::ConfigMap[:ruby_install_name]
    else
      path = File.join @gem_dir, @spec.bindir, bin_file_name

      ruby_bin_file = File.join(File.dirname(Gem.ruby), 'ruby')
      unless File.symlink?(ruby_bin_file)
        ruby_bin_file = Gem.ruby
      end

      File.open(path, "rb") do |file|
        first_line = file.gets
        if first_line =~ /^#!/ then
          # Preserve extra words on shebang line, like "-w".  Thanks RPA.
          shebang = first_line.sub(/\A\#!.*?ruby\S*/, "#!#{ruby_bin_file}")
        else
          # Create a plain shebang line.
          shebang = "#!#{ruby_bin_file}"
        end

        shebang.strip # Avoid nasty ^M issues.
      end
    end
  end
end
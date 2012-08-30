maintainer       "Daniel Spangenberg"
maintainer_email "danielsp@amazon.com"
license          "WTFPL"
description      "Installs git"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

%w{ debian ubuntu mac_os_x }.each do |os|
  supports os
end

recipe "git", "Installs git"

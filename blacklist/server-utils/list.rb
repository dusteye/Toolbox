list = []
hosts = ['twitter.com', 'facebook.com', 'youtube.com', 'encrypted.google.com']

hosts.each do |host|
  20.times do
    ip = `/bin/sh lookup.sh #{host}`
    ip.chomp!
    list << ip unless ip.empty? || ip.lines.count > 1 # Exclude true results
    $stderr.print "#{host}\t#{ip}\n"
    sleep 0.1 # Give the upstream server a breath
  end
end

puts list.uniq!
$stderr.print "\nTotally #{list.count} IP Addresses collected.\n"
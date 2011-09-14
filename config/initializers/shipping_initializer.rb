Dir['lib/shipping/**/*.rb'].each{ |file| require file.match(/lib\/(shipping\/.*)\.rb/)[1] }

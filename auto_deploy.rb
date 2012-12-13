`rm -rf upload_files`
`mkdir upload_files`
`rake db:drop`
`rake db:migrate`
`rake generate:users_for_sast`.each_line do |line|
  p line.delete("\"").chomp
end

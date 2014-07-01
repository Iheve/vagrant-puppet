include lamp

file { '/tmp/test':
  ensure  => 'file',
  content => "I am a test file",
  group   => '1000',
  mode    => '664',
  owner   => '1000',
}

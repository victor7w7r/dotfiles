return {
  ssh_domains = {
    {
      name = 'wsl.ssh',
      remote_address = 'localhost',
      multiplexing = 'None',
      default_prog = { 'fish', '-l' },
      assume_shell = 'Posix'
    }
  },

  unix_domains = {},
}

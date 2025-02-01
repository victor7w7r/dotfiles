$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
$env.config.show_banner = false
$env.nupm = $nu.data-dir | path join "nupm" | path join "modules"
$env.HOMEBREW_PREFIX = '/usr/local'
$env.HOMEBREW_CELLAR = '/usr/local/Cellar'
$env.HOMEBREW_REPOSITORY = '/usr/local/Homebrew'

$env.path ++= [
	"/usr/local/bin",
	"/usr/local/sbin",
	"/usr/local/Homebrew/bin",
	"~/Library/Application Support/carapace/bin",
	"/Applications/VMware Fusion.app/Contents/Public",
	"~/.local/state/fnm_multishells/29556_1738257659720/bin",
	"~/.cargo/bin"
]

mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

export-env {
  $env.config = ($env.config | upsert hooks {
      env_change: {
          PWD: ($env.config.hooks.env_change.PWD ++
            [{
              condition: {|before, after| [.nvmrc .node-version] | path exists | any { |it| $it }}
	      code: {|before, after|
                if ('FNM_DIR' in $env) {
	          fnm use # Personally I prefer to use fnm --log-level=quiet use 
		}
	      }
	  }]
        )
      }
  })
}

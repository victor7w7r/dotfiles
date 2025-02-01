if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  let path = if 'Path' in $env { $env.Path } else { $env.PATH }
  let node_path = if (sys host).name == 'Windows' {
    $"($env.FNM_MULTISHELL_PATH)"
  } else {
    $"($env.FNM_MULTISHELL_PATH)/bin"
  }
  $env.PATH = ($path | prepend [ $node_path ])
}

use ($nu.data-dir | path join "nupm" | path join "modules" | path join "nupm")

source ~/.cache/carapace/init.nu

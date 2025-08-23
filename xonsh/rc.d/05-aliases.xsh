aliases['ssh'] = 'TERM=xterm-256color command ssh'
aliases['_'] = 'sudo'
aliases['o'] = 'open .'
aliases['t'] = 'btop'
aliases['ff'] = 'find . -type f -name'
aliases['fd'] = 'find . -type d -name'
aliases['chmox'] = 'chmod +x'
aliases['mv'] = 'mv -iv'
aliases['rm'] = 'rm -rvif'
aliases['cls'] = 'clear && printf "\\e[3J"'
aliases['cp'] = 'cp -rvi'
aliases['cdy'] = 'pwd | xclip -i'
#aliases['cow'] = 'customfortunes | cowsay --bold $(random-opts) --random --super'
aliases['mkdir'] = 'mkdir -pv'
aliases['tarls'] = 'tar -tvf'
aliases['shot'] = 'flameshot gui'
aliases['untar'] = 'tar -xf'
aliases['biggest'] = "du -s ./* | sort -nr | awk '{print $2}' | xargs du -sh"
aliases['dux'] = 'du -x --max-depth=1 | sort -n'
aliases['dud'] = 'du -d 1 -h'
aliases['duf'] = 'du -sh *'
#aliases['grep'] = 'grep -H --color=auto --exclude-dir={.git,.vscode}'
aliases['rscp'] = 'rsync -avhE --progress --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable'
aliases['rsmv'] = 'rsync -avhE --no-compress --progress --remove-source-files --partial --info=stats2 --inplace --no-i-r --numeric-ids --human-readable'
aliases['py'] = 'python3'
aliases['g'] = 'git'
aliases['lg'] = 'lazygit'
aliases['lzd'] = 'lazydocker'
aliases['vifish'] = lambda: $[nvim @($HOME + '/.config/fish/config.fish')] and source-bash('source ' + $HOME + '/.config/fish/config.fish')
aliases['killn'] = 'killall -q'

def reload_xonsh():
    source @($XONSH_CONFIG_DIR + '/xonshrc.xsh')
    print(f"Sourced {$XONSH_CONFIG_DIR}/xonshrc.xsh")

aliases['reload'] = reload_xonsh

def colormap():
    for i in range(256):
        print(f'\x1b[48;5;{i}m  \x1b[0m\x1b[38;5;{i}m{i:03d}\x1b[0m ', end='')
        if (i + 1) % 6 == 0:
            print()

aliases['colormap'] = colormap
aliases['beep'] = 'echo -e "\\a"; sleep 0.1; echo -e "\\a"'

aliases['zupdate'] = 'zinit update --parallel 40'
aliases['zselfupdate'] = 'zinit self-update'

def zreset():
    import shutil
    import os
    zshexecdir = os.environ.get('ZSHEXECDIR', '')
    home = os.environ.get('HOME', '')
    try:
        shutil.rmtree(f"{zshexecdir}/zinit", ignore_errors=True)
        shutil.rmtree(f"{home}/.local/share/zinit", ignore_errors=True)
    except:
        pass

aliases['zreset'] = zreset

aliases['timestamp'] = 'date "+%Y-%m-%d %H:%M:%S"'
aliases['datestamp'] = 'date "+%Y-%m-%d"'
aliases['isodate'] = 'date +%Y-%m-%dT%H:%M:%S%z'
aliases['utc'] = 'date -u +%Y-%m-%dT%H:%M:%SZ'
aliases['unixepoch'] = 'date +%s'

aliases['meminfo'] = 'free -m -l -t'
aliases['memhog'] = 'ps -eo pid,ppid,cmd,%mem --sort=-%mem | head'
aliases['cpuhog'] = 'ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head'
aliases['cpuinfo'] = 'lscpu'
aliases['distro'] = 'cat /etc/*-release'
aliases['ports'] = 'netstat -tulanp'

def print_fpath():
    fpath = $FPATH.split(':') if 'FPATH' in ${...} else []
    for fp in fpath:
        print(fp)

aliases['print-fpath'] = print_fpath

def print_path():
    for path in $PATH:
        print(path)

aliases['print-path'] = print_path

def print_functions():
    # This would need to be adapted based on what functions are available in xonsh
    # For now, just list aliases
    for name in sorted(aliases.keys()):
        if not name.startswith('_'):
            print(name)

aliases['print-functions'] = print_functions

aliases['myip'] = 'curl icanhazip.com'
aliases['weather'] = 'curl wttr.in'
aliases['weather-short'] = 'curl "wttr.in?format=3"'
aliases['cheat'] = 'curl cheat.sh/'
#aliases['tinyurl'] = 'curl -s "http://tinyurl.com/api-create.php?url='
aliases['joke'] = 'curl https://icanhazdadjoke.com'
aliases['hackernews'] = 'curl hkkr.in'
aliases['worldinternet'] = 'curl https://status.plaintext.sh/t'

def path():
    for i, p in enumerate($PATH, 1):
        print(f"{i:2d}  {p}")

aliases['path'] = path
# Path to your oh-my-zsh installation.
source ~/.exports
source ~/.aliases
. /opt/homebrew/etc/profile.d/z.sh
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
export ZSH="$HOME/.oh-my-zsh"

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }

keyframe_deltas() {
  if [[ -z "$1" ]]; then
    echo "Usage: keyframe_deltas <media-file>"
    return 1
  fi

  ffprobe -select_streams v:0 -show_frames -print_format json "$1" | python3 -c "
import sys, json;
data = json.load(sys.stdin)['frames'];
previous_pts = None
previous_dts = None

gop=0
pts_time_sum=0

for frame in data:
    pts = frame.get('pts')
    pts_time = frame.get('pts_time')
    dts = frame.get('pkt_dts')
    duration = frame.get('duration')
    pict_type = frame.get('pict_type')
    if pict_type == 'I':
        gop = 0
        pts_time_sum = 0
    else:
        gop += 1
        pts_time_sum += float(pts_delta) if pts_delta != 'null' else 0

    if previous_pts is not None and pts is not None:
        pts_delta = float(pts) - previous_pts
    else:
        pts_delta = 'null'
    if previous_dts is not None and dts is not None:
        dts_delta = float(dts) - previous_dts
    else:
        dts_delta = 'null'
    print(f'pict_type={pict_type} pts={pts} pts_time={pts_time} pts_sum={pts_time_sum} dts={dts} duration={duration} pts_delta={pts_delta} dts_delta={dts_delta} gop={gop}')
    previous_pts = float(pts) if pts is not None else None
    previous_dts = float(dts) if dts is not None else None

keyframes = [float(f['pts_time']) for f in data if f.get('key_frame') == 1 or f.get('pict_type') == 'I'];
deltas = [keyframes[i] - keyframes[i - 1] for i in range(1, len(keyframes))];
print('\n'.join([f'Delta between keyframe {i} and {i-1}: {d:.6f} seconds' for i, d in enumerate(deltas, 1)]))
"
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode disabled  # disable automatic updates

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
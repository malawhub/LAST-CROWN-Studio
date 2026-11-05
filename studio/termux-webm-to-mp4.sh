#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "FFmpeg is not installed. Run: pkg update && pkg install ffmpeg"; exit 1
fi
if [ "$#" -ge 1 ]; then input="$1"; else
  d="$HOME/storage/downloads"
  [ -d "$d" ] || { echo "Run termux-setup-storage and allow permission first."; exit 1; }
  input="$(find "$d" -maxdepth 1 -type f -iname '*.webm' -printf '%T@ %p\n' 2>/dev/null | sort -nr | head -n1 | cut -d' ' -f2-)"
fi
[ -n "${input:-}" ] && [ -f "$input" ] || { echo "No WebM found. Pass the input file path."; exit 1; }
output="${2:-${input%.*}.mp4}"
if [ -e "$output" ]; then printf 'Overwrite %s? [y/N] ' "$output"; read -r answer; case "$answer" in y|Y|yes|YES) ;; *) echo Cancelled; exit 0;; esac; fi
if ffmpeg -hide_banner -encoders 2>/dev/null | grep -q 'libx264'; then vcodec=libx264; vopts=(-preset veryfast -crf 23); else echo "H.264 unavailable; using MPEG-4 Part 2 fallback."; vcodec=mpeg4; vopts=(-q:v 4); fi
ffmpeg -hide_banner -y -i "$input" -map 0:v:0 -map '0:a?' -c:v "$vcodec" "${vopts[@]}" -pix_fmt yuv420p -c:a aac -b:a 192k -movflags +faststart "$output"
[ -s "$output" ] || { echo "Conversion failed."; exit 1; }
echo "MP4 created: $output"; ls -lh "$output"; echo "Original WebM retained."

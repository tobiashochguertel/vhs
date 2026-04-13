# Keystroke Captions and Overlays

This feature adds a caption system that burns keystroke overlays into video output using ASS subtitles via FFmpeg. Captions display typed keys in real-time, making tutorials and demonstrations more understandable.

> **Note:** This feature requires FFmpeg to be compiled with `libass` support. On macOS, use `brew install ffmpeg-full`.

## Table of Contents

- [Keystroke Captions and Overlays](#keystroke-captions-and-overlays)
  - [Table of Contents](#table-of-contents)
  - [Quick Start](#quick-start)
  - [Commands](#commands)
  - [Caption Settings](#caption-settings)
    - [CaptionFont](#captionfont)
    - [CaptionFontSize](#captionfontsize)
    - [CaptionFontColor](#captionfontcolor)
    - [CaptionHighlightColor](#captionhighlightcolor)
    - [CaptionKeyStyle](#captionkeystyle)
    - [CaptionMaxKeys](#captionmaxkeys)
    - [CaptionInactivityTimer](#captioninactivitytimer)
  - [Box Settings](#box-settings)
    - [CaptionBoxColor](#captionboxcolor)
    - [CaptionBoxOpacity](#captionboxopacity)
    - [CaptionBoxPadding](#captionboxpadding)
  - [Alignment](#alignment)
  - [Margin](#margin)
  - [Overlay Settings](#overlay-settings)
    - [Overlay with Multiline](#overlay-with-multiline)
    - [Overlay Title Tucked into Corner](#overlay-title-tucked-into-corner)
  - [Toggle Captions](#toggle-captions)
  - [Complete Example](#complete-example)
  - [Requirements](#requirements)
    - [FFmpeg with libass](#ffmpeg-with-libass)
    - [Regenerating the Example GIFs](#regenerating-the-example-gifs)
  - [Source](#source)

## Quick Start

```tape
Set CaptionFont "JetBrains Mono"
Set CaptionFontSize 26
Set CaptionKeyStyle "icon"
CaptionOn

Type "Hello, World!"
Enter
```

## Commands

| Command      | Description                |
| ------------ | -------------------------- |
| `CaptionOn`  | Enable keystroke captions  |
| `CaptionOff` | Disable keystroke captions |

## Caption Settings

### CaptionFont

Choose from any monospace font installed on your system.

```tape
Set CaptionFont "JetBrains Mono"
CaptionOn
```

![set-caption-font-jetbrains](./examples/set-caption-font-jetbrains.gif)

```tape
Set CaptionFont "IBM Plex Mono"
CaptionOn
```

![set-caption-font-ibmplex](./examples/set-caption-font-ibmplex.gif)

### CaptionFontSize

```tape
Set CaptionFontSize 18
CaptionOn
```

![set-caption-font-size-18](./examples/set-caption-font-size-18.gif)

```tape
Set CaptionFontSize 26
CaptionOn
```

![set-caption-font-size-26](./examples/set-caption-font-size-26.gif)

### CaptionFontColor

Set the font color using hex notation.

```tape
Set CaptionFontColor "#FF893E"
CaptionOn
```

![set-caption-font-color](./examples/set-caption-font-color.gif)

### CaptionHighlightColor

Set the highlight color for modifier keys.

```tape
Set CaptionHighlightColor "#77FFEF"
CaptionOn
```

![set-caption-highlight-color](./examples/set-caption-highlight-color.gif)

### CaptionKeyStyle

Choose between `vim` or `icon` key rendering styles.

```tape
Set CaptionKeyStyle "icon"
CaptionOn
```

![set-caption](./examples/set-caption.gif)

```tape
Set CaptionKeyStyle "vim"
CaptionOn
```

![set-caption-key-style](./examples/set-caption-key-style.gif)

### CaptionMaxKeys

Control the maximum number of keys displayed simultaneously.

```tape
Set CaptionMaxKeys 5
CaptionOn
```

![set-caption-max-keys-5](./examples/set-caption-max-keys-5.gif)

```tape
Set CaptionMaxKeys 15
CaptionOn
```

![set-caption-max-keys-15](./examples/set-caption-max-keys-15.gif)

### CaptionInactivityTimer

Set a timeout in milliseconds. Keys fade out after inactivity.

```tape
Set CaptionInactivityTimer 900ms
CaptionOn
```

![set-caption-inactivity-timer-900](./examples/set-caption-inactivity-timer-900.gif)

```tape
Set CaptionInactivityTimer 1200ms
CaptionOn
```

![set-caption-inactivity-timer-1200](./examples/set-caption-inactivity-timer-1200.gif)

## Box Settings

### CaptionBoxColor

Set the background color of the caption box.

```tape
Set CaptionBoxColor "#777777"
CaptionOn
```

![set-caption-box-color](./examples/set-caption-box-color.gif)

### CaptionBoxOpacity

Control the opacity of the caption box (0.0 to 1.0).

```tape
Set CaptionBoxOpacity 0
CaptionOn
```

![set-caption-box-opacity-0](./examples/set-caption-box-opacity-0.gif)

```tape
Set CaptionBoxOpacity 0.25
CaptionOn
```

![set-caption-box-opacity-25](./examples/set-caption-box-opacity-25.gif)

```tape
Set CaptionBoxOpacity 0.75
CaptionOn
```

![set-caption-box-opacity-75](./examples/set-caption-box-opacity-75.gif)

### CaptionBoxPadding

Set the padding inside the caption box.

```tape
Set CaptionBoxPadding 3
CaptionOn
```

![set-caption-box-padding-3](./examples/set-caption-box-padding-3.gif)

```tape
Set CaptionBoxPadding 15
CaptionOn
```

![set-caption-box-padding-15](./examples/set-caption-box-padding-15.gif)

## Alignment

Position captions in 9 positions: top/middle/bottom × left/center/right.

```tape
Set CaptionAlignment "top-left"
CaptionOn
```

![set-caption-alignment-top-left](./examples/set-caption-alignment-top-left.gif)

```tape
Set CaptionAlignment "top-center"
CaptionOn
```

![set-caption-alignment-top-center](./examples/set-caption-alignment-top-center.gif)

```tape
Set CaptionAlignment "top-right"
CaptionOn
```

![set-caption-alignment-top-right](./examples/set-caption-alignment-top-right.gif)

```tape
Set CaptionAlignment "middle-left"
CaptionOn
```

![set-caption-alignment-middle-left](./examples/set-caption-alignment-middle-left.gif)

```tape
Set CaptionAlignment "middle-center"
CaptionOn
```

![set-caption-alignment-middle-center](./examples/set-caption-alignment-middle-center.gif)

```tape
Set CaptionAlignment "middle-right"
CaptionOn
```

![set-caption-alignment-middle-right](./examples/set-caption-alignment-middle-right.gif)

```tape
Set CaptionAlignment "bottom-left"
CaptionOn
```

![set-caption-alignment-bottom-left](./examples/set-caption-alignment-bottom-left.gif)

```tape
Set CaptionAlignment "bottom-center"
CaptionOn
```

![set-caption-alignment-bottom-center](./examples/set-caption-alignment-bottom-center.gif)

```tape
Set CaptionAlignment "bottom-right"
CaptionOn
```

![set-caption-alignment-bottom-right](./examples/set-caption-alignment-bottom-right.gif)

## Margin

Adjust the distance of the caption box from the edges.

```tape
Set CaptionAlignment "bottom-right"
Set CaptionPadding 10
Set CaptionMarginVertical 10
Set CaptionMarginRight 10
CaptionOn
```

![set-caption-margin](./examples/set-caption-margin.gif)

## Overlay Settings

Add text overlays at specific timestamps. Overlays use the same styling options as captions.

```tape
Set OverlayAlignment "top-right"
CaptionOn

# ... your typing here ...

Overlay@10s "Demo of Command Line Editing"
```

### Overlay with Multiline

```tape
Overlay@10s "Let's now edit\Nthe prior command\Nto show the world!"
```

![set-caption-with-overlay-multiline](./examples/set-caption-with-overlay-multiline.gif)

### Overlay Title Tucked into Corner

```tape
Set OverlayAlignment "top-right"
Set OverlayBoxColor "#ffffff"
Set OverlayBoxOpacity 1
Set OverlayFontColor "#000000"
Set OverlayMarginRight 10
Set OverlayMarginVertical 10
CaptionOn
```

![set-caption-with-overlay-title](./examples/set-caption-with-overlay-title.gif)

## Toggle Captions

Enable and disable captions selectively during a recording.

```tape
Set OverlayAlignment "top-right"
Set OverlayBoxColor "#ffffff"
Set OverlayBoxOpacity 1
Set OverlayFontColor "#000000"
Set OverlayMarginRight 10
Set OverlayMarginVertical 10

Overlay@100s "Selective Captioning"

CaptionOn
Type "echo captions are enabled"
Enter
Sleep 2s

CaptionOff
Type "echo captions are disabled"
Enter
Sleep 2s

CaptionOn
Type "echo captions are re-enabled"
Sleep 2s
```

![set-caption-toggle-captions](./examples/set-caption-toggle-captions.gif)

## Complete Example

```tape
# Output settings
Output ./examples/set-caption.gif
Set FontSize 32
Set Width 1200
Set Height 600
Set CaptionFont "JetBrains Mono"
Set CaptionFontSize 26
Set CaptionKeyStyle "icon"
Set CaptionAlignment "bottom-right"

# Enable captions
CaptionOn

# Demo typing
Type "vhs is awesome"
Enter
Sleep 1s
Type "capture keystrokes"
Sleep 1s
Ctrl+u
Type "edit mistakes easily"
Enter
```

## Requirements

### FFmpeg with libass

The caption feature requires FFmpeg to be compiled with `libass` support. The standard `ffmpeg` from Homebrew does **not** include libass.

**macOS:**

```bash
brew install ffmpeg-full
```

This installs a keg-only version at `/opt/homebrew/opt/ffmpeg-full/bin/ffmpeg`. Add it to your PATH:

```bash
echo 'export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**Linux:** Install `libass` development packages and rebuild FFmpeg from source with `--enable-libass`.

**Verify libass is available:**

```bash
ffmpeg -version 2>&1 | grep libass
# Should show: --enable-libass
```

### Regenerating the Example GIFs

The example GIFs can be regenerated using the included script:

```bash
cd keystroke-captions-and-overlays
./regenerate-gifs.sh
```

This script:

1. Locates the `vhs` binary (or uses `VHS_BIN` env var)
2. Ensures `ffmpeg-full` is in PATH if installed
3. Runs each `.tape` file to generate the corresponding `.gif`

## Source

This feature was added via [PR #719](https://github.com/charmbracelet/vhs/pull/719) by [@pkazmier](https://github.com/pkazmier).

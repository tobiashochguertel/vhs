# Output Formats

VHS supports multiple output formats beyond GIFs, including text-based formats ideal for integration testing and CI/CD pipelines.

## Table of Contents

- [Output Formats](#output-formats)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Video Formats](#video-formats)
    - [GIF](#gif)
    - [MP4](#mp4)
    - [WebM](#webm)
  - [Text-Based Formats](#text-based-formats)
    - [ASCII](#ascii)
    - [TXT](#txt)
    - [TEST](#test)
  - [Frame Export](#frame-export)
    - [PNG Frames](#png-frames)
  - [Multiple Outputs](#multiple-outputs)
  - [Use Cases](#use-cases)
    - [Integration Testing](#integration-testing)
    - [Accessibility](#accessibility)
  - [Regenerating Examples](#regenerating-examples)
  - [Source](#source)

## Overview

VHS can output to various formats by specifying the file extension in the `Output` command:

| Format  | Extension | Description                          |
| ------- | --------- | ------------------------------------ |
| GIF     | `.gif`    | Animated GIF (default)               |
| MP4     | `.mp4`    | MP4 video                            |
| WebM    | `.webm`   | WebM video                          |
| ASCII   | `.ascii`  | Terminal rendered as ASCII art       |
| TXT     | `.txt`    | Plain text terminal output           |
| TEST    | `.test`   | Test format for CI golden files      |
| PNG     | `.png`    | Frame sequence (via `Screenshot`)     |

> **Note:** SVG is **not** a supported output format.

## Video Formats

### GIF

The default format. Best for demos and documentation.

```tape
Output example.gif
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-gif](./examples/output-gif.gif)

### MP4

Use for higher quality video with smaller file sizes.

```tape
Output example.mp4
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-mp4](./examples/output-mp4.gif)

### WebM

Use for web-native video with VP9 codec support.

```tape
Output example.webm
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-webm](./examples/output-webm.gif)

## Text-Based Formats

Text-based formats are particularly useful for:
- **Integration testing**: Capture terminal output for diff-based assertions
- **Accessibility**: Screen readers can parse text output
- **Debugging**: Inspect exact terminal content without visual rendering

### ASCII

Renders the terminal as ASCII art. Great for contexts that don't support images.

```tape
Output example.ascii
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-ascii](./examples/output-ascii.gif)

### TXT

Plain text output of the terminal. Best for parsing and testing.

```tape
Output output-txt.txt
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-txt](./examples/output-txt.gif)

### TEST

Test format generates deterministic output for golden file testing in CI.

```tape
Output output-test.test
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

![output-test](./examples/output-test.gif)

## Frame Export

### PNG Frames

Export individual frames as PNG files by specifying a directory path. VHS will generate a sequence of PNG files for each frame in the recording.

```tape
Output frames/
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

The frames will be saved in the `frames/` directory as `frame-cursor-00001.png`, `frame-cursor-00002.png`, etc.

## Multiple Outputs

You can specify multiple outputs in a single tape file to generate different formats simultaneously:

```tape
Output example.gif
Output example.mp4
Output example.ascii
Output example.txt
Set Width 800
Set Height 400
Type "echo 'Hello, World!'"
Enter
Sleep 1s
```

This generates all four output files from a single recording session.

## Use Cases

### Integration Testing

Text-based outputs (`.txt`, `.ascii`, `.test`) are ideal for integration testing. You can:

1. Record your terminal session
2. Generate golden files with expected output
3. Compare actual output against golden files in CI

```tape
Output expected.test
Set Width 800
Set Height 400
# ... your commands here ...
```

Store `expected.test` in your repository. In CI, compare runs:

```bash
vhs integration.tape
diff expected.test actual.test
```

### Accessibility

Text-based formats allow screen readers and text-based browsers to access your terminal recordings.

## Regenerating Examples

The example outputs can be regenerated using the included script:

```bash
cd output-formats
./regenerate-outputs.sh
```

This script:

1. Locates the `vhs` binary (or uses `VHS_BIN` env var)
2. Ensures `ffmpeg-full` is in PATH if installed (macOS)
3. Runs each `.tape` file to generate all outputs

```bash
# Custom vhs binary
VHS_BIN=/path/to/vhs ./regenerate-outputs.sh
```

## Source

VHS is developed by [Charm](https://charm.sh). The source code is available on [GitHub](https://github.com/charmbracelet/vhs).

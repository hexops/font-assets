# font-assets: a few fonts packaged for Zig

This repository contains a few fonts packaged via the Zig package manager. They are primarily what is needed to test mach-freetype, as well as what is used in Mach examples.

## Getting started

### Adding dependency

Create a `build.zig.zon` file in your project (replace `$LATEST_COMMIT` with the latest commit hash):

```
.{
    .name = "mypkg",
    .version = "0.1.0",
    .dependencies = .{
        .mach_ggml = .{
            .url = "https://github.com/hexops/font-assets/archive/$LATEST_COMMIT.tar.gz",
        },
    },
}
```

Run `zig build` in your project, and the compiler instruct you to add a `.hash = "..."` field next to `.url`.

Then use the dependency in your `build.zig`:

```zig
...
pub fn build(b: *Build) void {
    ...
    exe.addModule("font-assets", b.dependency("font_assets", .{
        .target = target,
        .optimize = optimize,
    }).module("font-assets"));
}
```

You may then `const font_assets = @import("font-assets");` and refer to the embedded files exposed in `main.zig`.

### Usage

```zig
const font_assets = @import("font-assets");

// access the embedded file byte arrays, e.g.
// font_assets.fira_sans_regular_ttf
```

## Join the community

Join the Mach community [on Discord](https://discord.gg/XNG3NZgCqp) to discuss this project, ask questions, get help, etc.

## Issues

Issues are tracked in the [main Mach repository](https://github.com/hexops/mach/issues?q=is%3Aissue+is%3Aopen+label%3Afont-assets).

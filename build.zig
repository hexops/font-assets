const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("font_assets", .{
        .source_file = .{ .path = "font_assets.zig" },
    });
}

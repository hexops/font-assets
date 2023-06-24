const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("font-assets", .{
        .source_file = .{ .path = "main.zig" },
    });
}

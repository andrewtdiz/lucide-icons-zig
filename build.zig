const std = @import("std");
const Mode = std.builtin.Mode;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const icons_mod = b.addModule("icons", .{
        .root_source_file = b.path("src/icons.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addLibrary(.{
        .name = "icons",
        .linkage = .static,
        .root_module = icons_mod,
    });

    b.installArtifact(lib);
}

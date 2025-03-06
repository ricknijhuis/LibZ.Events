const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const events_mod = b.createModule(.{
        .root_source_file = b.path("src/events/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    _ = b.addModule("LibZ.Events", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const events_unit_tests = b.addTest(.{
        .root_module = events_mod,
    });

    const run_events_unit_tests = b.addRunArtifact(events_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_events_unit_tests.step);
}

const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const exe_tests = b.addTest(b.pathJoin(&.{ this_dir, "test/test.zig" }));
    exe_tests.setBuildMode(mode);
    link(exe_tests);
    exe_tests.addIncludePath(b.pathJoin(&.{ this_dir, "test" }));
    exe_tests.addCSourceFile(b.pathJoin(&.{ this_dir, "test/test.cpp" }), &.{"-std=c++11"});
    exe_tests.linkLibCpp();
    exe_tests.addCSourceFile(b.pathJoin(&.{ this_dir, "test/test.c" }), &.{"-std=c99"});
    exe_tests.linkLibC();

    const test_filter = b.option([]const u8, "test-filter", "Skip tests that do not match filter");
    if (test_filter) |filter| exe_tests.filter = filter;

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&exe_tests.step);
}

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.addIncludePath(this_dir ++ "/src");
    exe.addPackagePath("mallocz", this_dir ++ "/src/main.zig");
}

const this_dir = struct {
    fn d() []const u8 {
        return comptime (std.fs.path.dirname(@src().file) orelse ".");
    }
}.d();

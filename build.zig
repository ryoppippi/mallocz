const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);
    link(main_tests);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}

pub fn link(exe: *std.build.LibExeObjStep) void {
    exe.linkSystemLibraryName("c");
    const lib = exe.builder.addStaticLibrary("mallocz", "src/main.zig");
    lib.setBuildMode(exe.build_mode);
}

const thisDir = struct {
    fn d() []const u8 {
        return comptime std.fs.path.dirname(@src().file) orelse ".";
    }
}.d();

const std = @import("std");
const ma = @import("mallocz");

const test_c = @cImport({
    @cInclude("mallocz.h");
    @cInclude("test.h");
});

const test_cpp = @cImport({
    @cInclude("mallocz.h");
    @cInclude("test.hpp");
});

test "test zig" {
    ma.init(.{ .allocator = std.testing.allocator });
    defer ma.deinit();
}

test "test c success" {
    ma.init(.{ .allocator = std.testing.allocator });
    defer ma.deinit();

    test_c.test_malloc_free_success();
}

test "test cpp success" {
    ma.init(.{ .allocator = std.testing.allocator });
    defer ma.deinit();

    test_cpp.test_new_delete_success();
}

test "test c & cpp failed" {
    ma.init(.{ .allocator = std.testing.allocator });
    defer ma.deinit();

    test_cpp.test_new_forget_delete();
    test_c.test_forget_free();
}

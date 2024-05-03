const std = @import("std");

pub fn main() !void {
    // this allow us to access command arguments
    const args = try std.process.argsAlloc(std.heap.page_allocator);

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    if (args.len < 2) {
        try stdout.print("Hello, World!\n", .{});
    } else {
        try stdout.print("Hello, {s}!\n", .{args[1]});
    }

    try bw.flush(); // don't forget to flush!
    std.process.argsFree(std.heap.page_allocator, args);
}

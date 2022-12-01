const std = @import("std");
const os = std.os;
const log = std.log;
const expect = std.testing.expect;

// Thanks: https://xyquadrat.ch/2021/12/01/reading-files-in-zig/
const data = @embedFile("input.txt");

pub fn main() !void {
    var lines = std.mem.tokenize(u8, data, "\n");

    while(lines.next()) |line| {
        log.info("{s}\n", .{line});
    }
}

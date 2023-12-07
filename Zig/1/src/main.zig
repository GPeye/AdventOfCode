const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    //std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    //const stdout_file = std.io.getStdOut().writer();
    //var bw = std.io.bufferedWriter(stdout_file);
    //const stdout = bw.writer();

    //try stdout.print("Run `zig build test` to run the tests.\n", .{});
    //stdout

    //try bw.flush(); // don't forget to flush!

    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;
    var sum: usize = 0;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        if (line.len < 2) break;
        var first: ?u8 = null;
        var last: ?u8 = null;
        for (line) |c| {
            if (std.ascii.isDigit(c)) {
                if (first == null) {
                    first = c - '0';
                } else {
                    last = c - '0';
                }
            }
        }

        if (last == null) {
            last = first.?;
        }

        const val = first.? * 10 + last.?;
        sum += val;
    }
    std.debug.print("{d}\n", .{sum});
}

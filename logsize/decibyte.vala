using GLib;

/**
 * Calculate the decibyte of files in arguments
 */
class Decibyte : GLib.Object {
  public static double decibyte(int64 bytes) {
    var log10bytes = Math.log10(bytes);
    return log10bytes * 10;
  }

	public static int main(string[] args) {
    int64 total = 0;

    if (args.length == 1) {
      stderr.printf("Usage: %s <file> [file ...]", args[0]);
    }

    for (int i = 1; i < args.length; i++) {
      var file = File.new_for_path (args[i]);
      if (!file.query_exists ()) {
        stderr.printf("File not found: %s\n", file.get_path());
        return 1;
      }
      try {
        var file_info = file.query_info("*", FileQueryInfoFlags.NONE);
        total += file_info.get_size();
        stdout.printf("%9.2fdBy %s\n", decibyte(file_info.get_size()), args[i]);
      } catch (Error e) {
        stderr.printf("%s", e.message);
        return 2;
      }
    }

    if (args.length > 2) {
      stdout.printf("%9.2fdBy === TOTAL ===\n", decibyte(total));
    }

    return 0;
	}
}

#define _POSIX_C_SOURCE 200809L

#include <errno.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <sys/stat.h>

double deciword(long bytes) {
  const int wordbyte = __WORDSIZE / CHAR_BIT;
  return log10(bytes / wordbyte) * 10;
}

int main(int argc, char** argv) {
  struct stat buffer;
  int stat_status, c;
  long total = 0;

  if (argc < 2) {
    printf("Usage: deciword <file>\n");
    return EPERM;
  }

  for (c = 1; c < argc; c++) {
    char* file = argv[c];
    stat_status = stat(file, &buffer);
    if (stat_status) {
      printf("File not found: %s\n", file);
      return ENOENT;
    }
    total += buffer.st_size;
    double deciwords = deciword(buffer.st_size);
    printf("%.2fdW %s\n", deciwords, file);
  }

  if (argc > 2) {
    printf("= %.2fdW TOTAL\n", deciword(total));
  }

  return 0;
}

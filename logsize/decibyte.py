import os, sys, math

def filesize(f):
    filesize = os.stat(f).st_size
    return (f, filesize)

def decibyte(bytelen):
    return math.log10(bytelen)*10

def main():
    total = 0.0
    files = map(filesize, sys.argv[1:])
    try:
        for f in files:
            total += f[1]
            print("{:9.2f}dBy {}".format(decibyte(f[1]), f[0]))
    except FileNotFoundError as e:
        print("{}".format(e))
        sys.exit(2)
    print("{:9.2f}dBy === TOTAL ===".format(decibyte(total)))

if __name__ == '__main__':
    main()

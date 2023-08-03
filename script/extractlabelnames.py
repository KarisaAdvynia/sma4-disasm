"""Extract label names from each code file."""

from _iterate_recursive import iterate_recursive

def extractlabelnames(path):
    print("Processing:", path)
    labels = []
    labelname = None
    for line in open(path, "r", newline=""):
        # remove comment and trailing whitespace if any
        stripline = line.split(";")[0].rstrip()

        if stripline.endswith(":") and not stripline.startswith("@@"):
            labelname = stripline[:-1]

        if labelname is not None:
            pos = line.find("; 08")
            if pos >= 1:
                addrstr = line[pos+2:pos+10]
                try:
                    int(addrstr, 16)  # is this a valid pointer
                    if addrstr not in labelname:
                        labels.append((addrstr, labelname))
                    labelname = None
                except ValueError:
                    pass

    return labels

if __name__ == "__main__":
    labels = []
    iterate_recursive(extractlabelnames, "../asm/", ext=".asm",
                      returnfunc=labels.extend)
    with open("../../sma4-disasm-labels.txt", "w", encoding="UTF-8",
              newline="\n") as f:
        for addrstr, labelname in sorted(labels):
            f.write(addrstr + " " + labelname + "\n")

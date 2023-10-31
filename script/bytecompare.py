import os

def bytecompare(source, dest, searchregions=None):
    mismatchregions = []
    if searchregions is None:
        searchregions = [(0, min(os.path.getsize(source), os.path.getsize(dest)))]

    with open(source, "rb") as f0, open(dest, "rb") as f1:
        for start, end in searchregions:
            f0.seek(start)
            f1.seek(start)

            for i in range(start, end):
                nextbyte0 = f0.read(1)
                nextbyte1 = f1.read(1)
                if nextbyte0 != nextbyte1:
                    if mismatchregions and mismatchregions[-1][1] > i - 8:
                        mismatchregions[-1][1] = i
                    else:
                        mismatchregions.append([i, i])

        if mismatchregions:
            for start, end in mismatchregions:
                length = end - start + 1
                f0.seek(start)
                f1.seek(start)

                text = ["Mismatch at ", hex(start)]
                if length > 1:
                    text += [" to ", hex(end)]
                if length > 8:
                    text += [" (", hex(length), " bytes)"]
                text += [": source ",
                    " ".join(format(i, "02X") for i in f0.read(min(length, 8)))]
                if length > 8: text.append("...")
                text += [", dest ",
                    " ".join(format(i, "02X") for i in f1.read(min(length, 8)))]
                if length > 8: text.append("...")
                print("".join(text))
        else:
            print("The byte regions",
                  ", ".join(hex(start) + "-" + hex(end)
                            for start, end in searchregions),
                  "are identical.")

if __name__ == "__main__":
    bytecompare(
        "../../sma4.gba",
        "../sma4-disasm.gba",
        searchregions=[
            (0, 0x400000),
            ])
    input()  # wait for Enter, if run on a shell that closes at end of program

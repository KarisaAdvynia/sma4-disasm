from pathlib import Path

def importbinptrs(binptrpath):
    ptrmap = []
    fillnext = False
    for line in open(binptrpath, "r", encoding="UTF-8"):
        rawdata = line.split()
        startptr = int(rawdata[0], 16)
        if fillnext:  # use startptr as previous line's end ptr
            length = startptr - ptrmap[-1][0]
            if length <= 0:
                raise ValueError("Error parsing line:\n" + line +
                    "Length {length:X} is not a positive value.")
            ptrmap[-1][1] = length

        if len(rawdata) == 3:
            length = int(rawdata[1], 16) - startptr
            if length <= 0:
                raise ValueError("Error parsing line:\n" + line +
                    "Length {length:X} is not a positive value.")
            ptrmap.append([startptr, length, rawdata[2]])
            fillnext = False
        elif len(rawdata) == 2:
            ptrmap.append([startptr, None, rawdata[1]])
            fillnext = True
        else:
            raise ValueError("Error parsing line:\n" + line +
                "\nLine must contain either 1 or 2 hex pointers followed by a file path.")

    return ptrmap

def exportbin(sourcepath, outputdir, binptrpath):
    ptrmap = importbinptrs(binptrpath)
    maxptr = sourcepath.stat().st_size + 0x08000000

    filecount = 0
    with sourcepath.open("rb") as f:
        outputdir = Path(outputdir)
        for startptr, length, pathstr in ptrmap:
            f.seek(startptr - 0x08000000)
            data = f.read(length)

            exportpath = outputdir / pathstr

            # create directory if necessary
            nextdir = exportpath.parent
            if not nextdir.exists():
                print(f"Creating directory: {nextdir}")
                nextdir.mkdir(parents=True)

            # create file
            exportpath.open("wb").write(data)
            filecount += 1

    print(f"Extracted {filecount} files.")

if __name__ == "__main__":
    # search for the source ROM outside the disassembly directory
    try:
        gbafiles = [path for path in Path("../..").iterdir() if path.suffix.lower() == ".gba"]
        if len(gbafiles) == 1:
            # if only one GBA file is found, use that
            sourcepath = gbafiles[0]
        elif Path("../../sma4.gba").exists():
            # if "sma2.gba" exists, use that
            sourcepath = Path("../../sma4.gba")
        elif len(gbafiles) == 0:
            raise Exception("No .gba files were found in " +
                  str(Path("../..").resolve()))
        else:
            raise Exception(
                f"{len(gbafiles)} total .gba files were found in " +
                str(Path("../..").resolve()))
    except Exception as err:
        errstr = str(err)
        if type(err) is not Exception:
            errstr = type(err).__name__ + ": " + errstr
        print(errstr)
        print("This script needs a source ROM to extract data. "
              "Either include a file named 'sma4.gba' in the directory, or include exactly one .gba file.")
        input()
        import sys
        sys.exit()

    print("Extracting from: " + str(sourcepath.resolve()))
    exportbin(sourcepath,
              "../data/",
              "../binptrs.txt")

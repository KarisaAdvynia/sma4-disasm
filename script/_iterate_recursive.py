"""A function used by several other scripts, to recursively iterate over files
and subdirectories in a specified directory, optionally restricted to files
with a specific extension."""

import os

def iterate_recursive(func, directory: str, *args,
                      ext: str = "", returnfunc=None, **kwargs):
    contents = sorted(os.listdir(directory), key=str.casefold)
    for name in contents:
        path = os.path.join(directory, name)
        if os.path.isdir(path):
            # recursively iterate through subdirectories
            iterate_recursive(func, path, *args,
                              ext=ext, returnfunc=returnfunc, **kwargs)
        elif path.endswith(ext):
            returnvalue = func(path, *args, **kwargs)
            if returnfunc is not None:
                # the caller can optionally do something with each return value
                # e.g. append it to a list
                returnfunc(returnvalue)

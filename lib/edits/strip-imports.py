# Drop imports of Carrier, Property, Ordinal and Memory_Allocator_Protocol from every module file.
import sys, os, re
d = sys.argv[1]
for f in os.listdir(d):
    if not f.endswith(".swift"): continue
    p = os.path.join(d, f); s = open(p).read()
    s = re.sub(r"^(?:public |package )?import (Carrier|Property|Ordinal|Memory_Allocator_Protocol)\n", "", s, flags=re.M)
    open(p, "w").write(s)

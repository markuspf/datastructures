/*
 * Datastructures: GAP package providing common datastructures.
 * Licensed under the GPL 2 or later.
 *
 * Implementation of a pairing heap.
 */

#include "src/compiled.h"
#include "binaryheap.h"

#define DS_PAIRINGHEAP_NODE_DATA(node) ELM_PLIST(node, 1)
#define DS_PAIRINGHEAP_NODE_SUBNODES(node) ELM_PLIST(node, 2)
#define DS_PAIRINGHEAP_NODE_HEAPS(node) ELM_PLIST(node, 3)

static inline Obj DS_PairingHeap_Meld(Obj isLess, Obj x, Obj y)
{
    Obj xd, yd, xsh, ysh, nsubheap;
    const Int useLt = (isLess == LtOper);

    xd = DS_PAIRINGHEAP_NODE_DATA(x);
    yd = DS_PAIRINGHEAP_NODE_DATA(y);

    xsh = DS_PAIRINGHEAP_NODE_SUBNODES(x);
    ysh = DS_PAIRINGHEAP_NODE_SUBNODES(y);
    nsubheap = SUM(xsh, ysh);

    if(CALL_2ARGS(isLess, yd, xd)) {
        AddPlist(DS_PAIRINGHEAP_NODE_HEAPS(x), y);
        //  TODO: Make this not use magic constant
        AssPlist(x, 2, nsubheap);
        return x;
    } else {
        AddPlist(DS_PAIRINGHEAP_NODE_HEAPS(y), x);
        AssPlist(y, 2, nsubheap);
        return y;
    }
}

static Obj DS_PairingHeap_MergePairs(Obj self, Obj isLess, Obj heaps)
{
    const Int useLt = (isLess == LtOper);
    Int nheaps, k, s, old_s, r, i;
    Obj x, y, z;

    nheaps = LEN_PLIST(heaps);
    fprintf(stderr, "nheaps: %d\n", nheaps);
    if(nheaps == 0) {
      x = NEW_PLIST(T_PLIST_DENSE, 3);
      AssPlist(x, 1, INTOBJ_INT(0));
      AssPlist(x, 2, INTOBJ_INT(0));
      AssPlist(x, 3, INTOBJ_INT(0));
      return x;
    } else if(nheaps == 1) {
        return ELM_PLIST(heaps, 1);
    } else {
        k = nheaps;
        s = 1;

        fprintf(stderr, "new: \n");
        while(k > 1) {
            r = k % 2;
            k >>= 1;
            old_s = s;
            s <<= 1;

            for(i = s; i <= k * s; i += s) {
                x = ELM_PLIST(heaps, i - old_s);
                y = ELM_PLIST(heaps, i);
                z = DS_PairingHeap_Meld(isLess, x, y);
                AssPlist(heaps, i, z);
                fprintf(stderr, "Assinged to:  %d\n", i);
            }
            // I has been incremented
            i -= s;
            if(r==1) {
                i += s;
                x = ELM_PLIST(heaps, i - old_s);
                AssPlist(heaps, i, x);
                fprintf(stderr, "Assinged to:  %d\n", i);
                k++;
            }
        }
        fprintf(stderr, "Returning:  %d\n", i);
        return ELM_LIST(heaps, i);
    }
}

static StructGVarFunc GVarFuncs[] = {
    GVARFUNC(DS_PairingHeap_MergePairs, 2, "isLess, heaps"),
    { 0 }
};

static Int InitKernel(void)
{
    InitHdlrFuncsFromTable(GVarFuncs);
    return 0;
}

static Int InitLibrary(void)
{
    InitGVarFuncsFromTable(GVarFuncs);
    return 0;
}

struct DatastructuresModule PairingHeapModule = {
    .initKernel = InitKernel, .initLibrary = InitLibrary,
};


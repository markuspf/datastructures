#############################################################################
##
#W    read.g                 The GAPData package              Markus Pfeiffer
##

#############################################################################
##
#R  Read the install files.
##

DeclareInfoClass( "InfoDataStructures" );
SetInfoLevel( InfoDataStructures, 1 );


ReadPackage("datastructures", "gap/lqueue.gi");

ReadPackage("datastructures", "gap/heap.gi");
ReadPackage("datastructures", "gap/dllist.gi");

ReadPackage("datastructures", "gap/binaryheap.gi");
ReadPackage("datastructures", "gap/pairingheap.gi");

#############################################################################
##
##                          datastructures package
##  hashtable.gd                                             Markus Pfeiffer
##
##  Copyright 2016 by the authors.
##  This file is free software, see license information at the end.
##
#############################################################################
##
## Interface declaration for HashTables
##

## Associative array
DeclareCategory("IsHashTable", IsObject);
BindGlobal("HashTableFamily", NewFamily("HashTableFamily"));

DeclareConstructor("NewHashTable", [IsHashTable, IsObject, IsObject]);

DeclareOperation("Add", [IsHashTable, IsObject, IsObject]);
DeclareOperation("Update", [IsHashTable, IsObject, IsObject]);
DeclareOperation("Lookup", [IsHashTable, IsObject]);
DeclareOperation("LookupWithDefault", [IsHashTable, IsObject, IsHashTable]);

DeclareAttribute("Count", IsHashTable)
DeclareAttribute("Capacity", IsHashTable);



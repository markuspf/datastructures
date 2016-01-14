#############################################################################
##
##                          datastructures package
##  deque.gd
##                                                           Markus Pfeiffer
##
##  Copyright 2016 by the authors.
##  This file is free software, see license information at the end.
##
#############################################################################
##
## Interface declaration for deques
##

DeclareCategory("IsDeque", IsCollection);
BindGlobal( "DequeFamily", NewFamily("DequeFamily"));

DeclareConstructor("NewDeque", [IsDeque]);

DeclareOperation("PushFront", [IsDeque, IsObject]);
DeclareOperation("PushBack", [IsDeque, IsObject]);

DeclareOperation("PopFront", [IsDeque, IsObject]);
DeclareOperation("PopBack", [IsDeque, IsObject]);

# Size is an attribute in GAP, and if we want to use it in
# AttributeStoringRep representations

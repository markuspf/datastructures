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

DeclareConstructor("NewDeque", [IsDeque, IsObject, IsObject]);

DeclareOperation("PushFront", [IsDeque, IsObject]);
DeclareOperation("PushBack", [IsDeque, IsObject]);

DeclareOperation("PopFront", [IsDeque]);
DeclareOperation("PopBack", [IsDeque]);

DeclareProperty("IsEmpty", IsDeque);
DeclareAttribute("Length", IsDeque);
DeclareAttribute("Capacity", IsDeque);




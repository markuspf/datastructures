#############################################################################
##
##                          datastructures package
##  queue.gd
##                                                           Markus Pfeiffer
##
##  Copyright 2016 by the authors.
##  This file is free software, see license information at the end.
##
#############################################################################
##
## Interface declaration for queues
##

DeclareCategory("IsQueue", IsCollection);
BindGlobal( "Queue", NewFamily("QueueFamily"));

DeclareConstructor("NewQueue", [IsQueue, IsObject, IsObject]);

DeclareOperation("PushFront", [IsQueue, IsObject]);
DeclareOperation("PopBack", [IsQueue]);

DeclareProperty("IsEmpty", IsQueue);
DeclareAttribute("Length", IsQueue);
DeclareAttribute("Capacity", IsQueue);




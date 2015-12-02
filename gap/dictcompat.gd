#############################################################################
##
#W  dictcompat.gd               datastructures               Markus Pfeiffer
##      
##
## Backwards compatibility for GAP Library Dictionaries
## 
## * First just introduce an alternative implementation of dictionaries based
##   on datastructures' hashtables
## * Test, making this implementation the default.
## * Move all declarations from the library into datastructures
## * Remove library version
##

BindGlobal(IsDictionaryDatastructuresRep,
        NewRepresentation("IsDictionaryDatastructuresRep",
                IsDictionary and IsComponentObjectRep, [] ));


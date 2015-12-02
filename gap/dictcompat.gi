#############################################################################
##
#W  dictcompat.gi               datastructures               Markus Pfeiffer
##
## Backwards compatibility for GAP Library Dictionaries
##

if IsBound(NewDictionary) then
    BindGlobal("DATASTRUCTURES_LibraryNewDictionary", NewDictionary);
    MakeReadWriteGVar("NewDictionary");
    UnbindGlobal("NewDictionary");
    BindGlobal("NewDictionary",
        function(args)

        end);
else
        
fi;
    
InstallMethod(AddDictionary,
    "for datastructures dictionaries",
    true,
    [IsDictionaryDatastructuresRep and IsMutable, IsObject, IsObject],
    0,
    function(d, key, val)
       return HTAdd(d!.ht, key, val);
    end);

InstallMethod(LookupDictionary,
    "for datastructures dictionaries",
    true,
    [IsDictionaryDatastructuresRep, IsObject],
    0,
    function(d, key)
       return HTValue(d!.ht, key);
    end);

InstallMethod(RemoveDictionary,
    "for datastructures dictionaries",
    true,
    [IsDictionaryDatastructuresRep, IsObject],
    0,
    function(d, key)
       return HTDelete(d!.ht, key);
    end);

# Third task

## Files

* Solutions can be found [here](src)
* Task formulation can be found [here](text/task.md)

## Requirements

You need to have [FOMA](https://fomafst.github.io/) on your PC. Place it in each task folder.

## Testing

* Launch `foma`
* Load script
* Go down
* Start testing

It will probably look like this

```
king$ ./foma
Foma, version 0.9.18alpha (svn r241)
Copyright © 2008-2015 Mans Hulden
This is free software; see the source code for copying conditions.
There is ABSOLUTELY NO WARRANTY; for details, type "help license"

Type "help" to list all commands available.
Type "help <topic>" or help "<operator>" for further help.

foma[0]: source script.foma 
Opening file 'script.foma'.
defined Lexicon: 587 bytes. 8 states, 9 arcs, 4 paths.
defined EInsert: 560 bytes. 4 states, 13 arcs, Cyclic.
defined Cleanup: 332 bytes. 1 state, 2 arcs, Cyclic.
defined Transform: 732 bytes. 9 states, 11 arcs, 4 paths.
732 bytes. 9 states, 11 arcs, 4 paths.
foma[1]: down
apply down> bus[Pl]
buses
apply down> 
```

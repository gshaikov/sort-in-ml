# sort-in-ml
Collection of sorting algorithms written in Standard ML.

Implemented in SML/NJ, get it [here](https://www.smlnj.org/).

Currently available:
- mergesort
- quicksort

### Example usage

```
CM.make "path/to/library/import_sort.cm";
val result = Quicksort.sort [1,3,5,4,2]  (* val result = [1,2,3,4,5] : int list *)
```

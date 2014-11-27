
SML/NJ stacktrace demo
================================

A sample program using backtrace feature of SML/NJ.


--------------------------------

For detailed backtraces,

1. use the BackTrace module.

```sml
fun main (name, args) =
  BackTrace.monitor(fn () => main'(name, args))
```


2. add reference to BackTrace module ($smlnj-tdp/plugins.cm) to your CM file

```
group is
  ..
  $smlnj-tdp/plugins.cm
  ..
```


3. build your project with some special arguments

```sh
$ ml-build -Ctdp.instrument=true \$smlnj-tdp/back-trace.cm stacktrace.cm StackTrace.main stacktrace
```

In general form,

```sh
$ ml-build -Ctdp.instrument=true \$smlnj-tdp/back-trace.cm \
    </path/to/project.cm> \
	<full qualified main function> \
	<heapfile name>
```


4. execute your program using heapfile

```sh
sml @SMLload=<heapfile> [any options...]
```


--------------------------------

For more details, see [smlnj mailinglist](http://sourceforge.net/p/smlnj/mailman/message/1408396/ "SML/NJ project sourceforge mainling list").


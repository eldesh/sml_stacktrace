
# SML/NJ stack trace Demo

A sample program using backtrace feature of SML/NJ.


## Running Demo

For running demo project, just call test.sh .

```sh
$ ./test.sh
```

You would get back trace log like below:

    ..(snip)..
    [TEST] run sample program...
    ..(snip)..
    
    *** BACK-TRACE ***
    GOTO   stacktrace.sml:7.7-7.42: StackTrace.error[2]
              (from: stacktrace.sml:8.18-8.26: StackTrace.wrap1[2])
    GOTO   stacktrace.sml:8.7-8.26: StackTrace.wrap1[2]
              (from: stacktrace.sml:9.18-9.26: StackTrace.wrap2[2])
    GOTO   stacktrace.sml:9.7-9.26: StackTrace.wrap2[2]
              (from: stacktrace.sml:10.18-10.26: StackTrace.wrap3[2])
    ..(snip)..
    [TEST] done.


## Step to backtracing your project

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
$ ml-build -Ctdp.instrument=true \$smlnj-tdp/back-trace.cm
    </path/to/project.cm>
	<full qualified main function>
	<heapfile name>
```


4. execute your program using generated heapfile

```sh
$ sml @SMLload=<heapfile> [any options...]
```


--------------------------------

For more details, see [whither stack traces?](http://sourceforge.net/p/smlnj/mailman/message/1408396/ "mainling list archive of SML/NJ project").


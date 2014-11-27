#!/bin/sh

SMLNJ=sml

mainfunction=StackTrace.main
source_cm=stacktrace.cm
target_heap=stacktrace

echo -e "\n\n[TEST] build sample module..."
ml-build \
	-Ctdp.instrument=true \$smlnj-tdp/back-trace.cm \
	$source_cm $mainfunction $target_heap


echo -e "\n\n[TEST] run sample program..."
${SMLNJ} @SMLload=$target_heap


echo "[TEST] done."


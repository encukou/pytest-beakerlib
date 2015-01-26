#! /bin/bash

# Run the demo to ensure

set PYTHON=${PYTHON:-python}

. /usr/share/beakerlib/beakerlib.sh
rlJournalStart
PYTHONPATH=. $PYTHON -m pytest --with-beakerlib test_demo.py || :
rlJournalEnd
rlJournalPrintText | grep 'PASS .* RESULT: test_demo-test_success'
rlJournalPrintText | grep 'PASS .* RESULT: test_demo-test_skip'
rlJournalPrintText | grep 'FAIL .* RESULT: test_demo-test_fail'
rm -rvf BEAKERLIB_DIR
unset BEAKERLIB_DIR

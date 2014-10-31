"""Run these tests with the plugin to see what happens


Quick 'n dirty local invocation:

    . /usr/share/beakerlib/beakerlib.sh
    rlJournalStart
    PYTHONPATH=. py.test -p pytest_beakerlib --with-beakerlib test_demo.py
    rlJournalEnd

"""

import pytest


def test_success():
    pass


def test_skip():
    raise pytest.skip("Don't feel like doing this test now")


def test_fail():
    assert 1 + 2 == -8

From: suratiamol at gmail.com (Amol Surati)
Date: Fri, 5 Jul 2019 13:41:41 +0530
Subject: [Linux-kernel-mentees] Testing stable-rc v5.1.17-rc1-g57f5b343c
Message-ID: <20190705081141.GA17898@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi,

Given that 5.1.17-rc1 is marked on the stable-rc repo, I attempted to
carry out the required 'stable release contribution' task, ahead, in
anticipation of receiving the stable-review email.

Running kselftest (as root) showed the errors displayed below.

Are these an indication of problems, in my environment, which I must
fix? Or are some of the failures meant to be ignored?

The 'lkmp stable release contribution' wiki isn't quite clear on what
needs to be done with kselftest result if there are failures in it.

Upon checking one of the logs of a test result from linaro - 
https://lkft.validation.linaro.org/scheduler/job/806628 - it is found
that certain tests, that fail on my side, either succeed or are marked
as skipped, on their side.


Thank you,
Amol


The errors:

---------------------------
pid 25923's current affinity mask: f
pid 25923's new affinity mask: 1
not ok 1..1 selftests: cpufreq: main.sh [FAIL]

---------------------------
modprobe: FATAL: Module test_firmware not found in directory /lib/modules/5.1.17-rc1-g57f5b343c
You must have the following enabled in your kernel:
cat: ./config: No such file or directory
not ok 1..1 selftests: firmware: fw_run_tests.sh [FAIL]

---------------------------
[40] Kprobe event auto/manual naming    [FAIL]
[51] event trigger - test inter-event histogram trigger expected fail actions   [XFAIL]

---------------------------
Bail out! failed to set write decoder
Pass 180 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..180
not ok 1..1 selftests: ir: ir_loopback.sh [FAIL]

---------------------------
Error: Exclusivity flag on, cannot modify.
not ok 1..1 selftests: timestamping: txtimestamp.sh [FAIL]

---------------------------
Checking pstore console is registered ... FAIL
Checking /dev/pmsg0 exists ... FAIL
Writing unique string to /dev/pmsg0 ... FAIL
not ok 1..1 selftests: pstore: pstore_tests [FAIL]

---------------------------
bin/sh: line 6:  3408 Segmentation fault      (core dumped) ./$BASENAME_TEST
not ok 1..1 selftests: size: get_size [FAIL]

---------------------------
ModuleNotFoundError: No module named 'tpm2_tests'
. . .
FAILED (errors=1)
not ok 1..1 selftests: tpm2: test_smoke.sh [FAIL]

---------------------------
  File "/home/user0/mnt/stable/linux-5.1.y/tools/testing/selftests/tpm2/tpm2_tests.py", line 68
    except ProtocolError, e:
                        ^
SyntaxError: invalid syntax
not ok 1..2 selftests: tpm2: test_space.sh [FAIL]

---------------------------
userfaultfd syscall not available in this kernel
nr_pages: 32768, nr_pages_per_cpu: 8192
bounces: 31, mode: rnd racing ver poll, register failure
[FAIL]

---------------------------
Failed to make present page unevictable
[FAIL]

---------------------------
mmap(ADDR_SWITCH_HINT, 2 * PAGE_SIZE, MAP_FIXED): 0xffffffffffffffff - FAILED
mmap(HIGH_ADDR, MAP_FIXED): 0xffffffffffffffff - FAILED
mmap(ADDR_SWITCH_HINT, 2 * PAGE_SIZE, MAP_FIXED): 0xffffffffffffffff - FAILED

---------------------------
selftests: x86: single_step_syscall_64: Warning: file single_step_syscall_64 is not executable, correct this.
not ok 1..1 selftests: x86: single_step_syscall_64 [FAIL]
---------------------------

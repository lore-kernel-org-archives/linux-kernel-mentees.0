From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Wed, 15 May 2019 01:04:50 +0530
Subject: [Linux-kernel-mentees] [Linux-Kernel-Mentees][RESEND] [1]Syzbot
	Analysis
Message-ID: <20190514193450.GA7059@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514193450.FzVa2fyfHdtfOG_YfU495BP29lr0rb1345VRIdt58Do@z>

Hi all,

This is a resend of my first syzbot report. I think I forgot to prefix
the subject with "[Linux-Kernel-Mentees]". I would love some feedback on
this. 

WARNING in __kthread_bind_mask

Link:
https://syzkaller.appspot.com/bug?id=65e90b4c394c4323478ea4a05c8572c1dc47de16

Important parts of the stack trace.

[   90.686019] RIP: 0010:__kthread_bind_mask+0x1e/0xa0
[   90.686026] Code: f8 e8 56 b1 50 00 48 8b 45 f8 eb d9 55 48 89 e5 41
56 41 55 41 54 49 89 f4 48 89 d6 53 48 89 fb e8 67 b4 02 00 48 85 c0 75
0b <0f> 0b 5b 41 5c 41 5d 41 5e 5d c3 4c 8d b3 c0 07 00 00 4c 89 f7 e8
[   90.686029] RSP: 0018:ffff8880890dfd30 EFLAGS: 00010246
[   90.686034] RAX: 0000000000000000 RBX: ffff88808679e5c0 RCX:
0000000000000000
[   90.686038] RDX: dffffc0000000000 RSI: 0000000000000001 RDI:
ffffffff89c55aa0
[   90.686041] RBP: ffff8880890dfd50 R08: ffffed1010cf3db1 R09:
0000000000000000
[   90.686045] R10: 0000000000000000 R11: 0000000000000000 R12:
ffffffff86e8c288
[   90.686048] R13: ffff88808679e5e0 R14: ffffffff86f53ae0 R15:
ffff8880a999c820
[   90.686078]  kthread_unpark+0xed/0x120
[   90.686084]  kthread_stop+0xb7/0x4d0
[   90.686093]  io_finish_async+0x9f/0x160
[   90.686099]  io_ring_ctx_wait_and_kill+0x78/0x3b0
[   90.686107]  io_uring_release+0x3d/0x50
[   90.686113]  __fput+0x252/0x800
[   90.686123]  ____fput+0x9/0x10
[   90.686128]  task_work_run+0x10e/0x190
[   90.686140]  exit_to_usermode_loop+0x1a9/0x200
[   90.686148]  do_syscall_64+0x40d/0x4e0
[   90.686157]  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Files touched upon in the analysis: (i) fs/io_uring.c
(ii) kernel/kthread.c

Tools used to trace the warning cause: (i) GDB to identify the part of
the code where the warning was triggered. 
commands used:
gdb vmlinux
list *__kthread_bind_mask+0x1e (The RIP value)

Reproducing the warning: This warning was hard to reproduce. I tried to
reproduce using the specific GCC version used by syzbot but still was
not able to reproduce. This warning was triggered because
wait_task_inactive returns 0. wait_task_inactive returns 0 if the
task_struct passed to it has a different state than the state param
passed to wait_task_inactive. This warning appears to be transient. This
warning is triggered from calling kthread_stop which is a function in
widespread use in the kernel. (This was before the fix was proposed, I
wrote the analysis and the patch was submitted to fix this before I
submitted the analysis).

Recently I tried to revert the fix commit but still am not able to
reproduce. 

Bisect: Bisection was done by syzbot. The bisection is right as kthread
functionalities was introduced in io_uring by the commit
6c271ce2f1d572f7fa225700a13cfe7ced492434 

Analysis: According to the dump_stack, this code was executed in user
context(as it enters through a system call). The sequence of events are
io_uring_release -> io_ring_ctx_wait_and_kill -> io_finish_async.
io_finish_async calls kthread_stop. kthread_stop stops the particular
task_struct by letting it finish its execution and decrementing the
reference counter for the task_struct(probably does not free the
task_struct, I think it is put back into the slab cache of task_struct).
kthread_stop calls kthread_unpark. kthread_unpark is specific to threads
binded to a particular CPU. If the thread is not bound to a CPU,
kthread_unpark just wakes the thread like any other process. But if the
thread is bound to a CPU, it first binds the thread to the CPU and then
wakes up the thread. kthread_unpark checks whether the
KTHREAD_IS_PER_CPU bit is set. Since kthread_create_per_cpu is used in
io_uring.c to create the kthread, KTHREAD_IS_PER_CPU is set in our case.
kthread_unpark then calls __kthread_bind which calls __kthread_bind_mask
which just uses the mask of the CPU to be bound to. In
__kthread_bind_mask we encounter wait_task_inactive, this function waits
for the thread to unschedule from the CPU. wait_task_inactive returns 0,
if the thread changes it state from the state passed into its param
which TASK_PARKED. Since wait_task_inactive returned 0, WARN_ON(1) is
generated which is the warning we see on the dmesg logs. I am not sure
why 

Fix: A fix to this warning was proposed by Jens Axboe. The fix
explicitly parked the kthread before stopping the kthread. This mostly
seems like a hack to get around kthread_unpark in kthread_stop.
commit:06058632464845abb1af91521122fd04dd3daaec
I grepped the kernel source for uses of kthread_stop and noticed that a
lot of them did not  explicitly park the thread before stopping it. That
is why I feel that the fix is a hack.

Thank you
Bharath

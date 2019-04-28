From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Sun, 28 Apr 2019 23:06:33 +0530
Subject: [Linux-kernel-mentees] [linux-kernel mentees][2]Syzbot report
Message-ID: <20190428173632.GA4349@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

kernel BUG at include/linux/mm.h:LINE! (5)

This bug was in the open section.

Breif stack trace:
[  172.788569]  skb_release_all+0x4a/0x60
[  172.789273]  __kfree_skb+0x15/0x20
[  172.789896]  tcp_write_queue_purge+0x24f/0x7c0
[  172.791100]  tcp_disconnect+0x406/0x1890
[  172.791999]  ? lock_sock_nested+0xe2/0x120
[  172.793116]  tcp_close+0xe28/0x10a0
[  172.794085]  ? _raw_spin_unlock_bh+0x30/0x40
[  172.795221]  tls_sk_proto_close+0x3de/0x7b0
[  172.796175]  ? mark_held_locks+0x130/0x130
[  172.797155]  ? tcp_check_oom+0x560/0x560
[  172.797939]  ? tls_push_sg+0x6b0/0x6b0
[  172.798628]  ? ip_mc_drop_socket+0x210/0x270
[  172.799381]  inet_release+0x104/0x1f0
[  172.800056]  inet6_release+0x50/0x70
[  172.800654]  __sock_release+0xd7/0x2b0
[  172.801283]  ? __sock_release+0x2b0/0x2b0
[  172.801957]  sock_close+0x19/0x20
[  172.802526]  __fput+0x2cf/0x8b0
[  172.803171]  ____fput+0x15/0x20
[  172.803747]  task_work_run+0x14d/0x1c0
[  172.804418]  do_exit+0xb9f/0x3200
[  172.804936]  ? __lock_acquire+0x5d6/0x4760
[  172.805567]  ? mm_update_next_owner+0x6f0/0x6f0
[  172.806275]  ? find_held_lock+0x36/0x1d0
[  172.806888]  ? get_signal+0x300/0x1cc0
[  172.807947]  ? _raw_spin_unlock_irq+0x27/0x80
[  172.808684]  ? get_signal+0x300/0x1cc0
[  172.809329]  ? _raw_spin_unlock_irq+0x27/0x80
[  172.810428]  do_group_exit+0x135/0x370
[  172.811384]  get_signal+0x356/0x1cc0
[  172.811985]  ? __might_fault+0x12b/0x1e0
[  172.812798]  ? lock_downgrade+0x7f0/0x7f0
[  172.813663]  do_signal+0x87/0x1930
[  172.814196]  ? kasan_check_read+0x11/0x20
[  172.814793]  ? _copy_to_user+0xc8/0x110
[  172.815714]  ? setup_sigcontext+0x7d0/0x7d0
[  172.816453]  ? __x64_sys_futex+0x40d/0x5b0
[  172.817168]  ? exit_to_usermode_loop+0x40/0x2c0
[  172.817951]  ? do_syscall_64+0x536/0x600
[  172.818700]  ? exit_to_usermode_loop+0x40/0x2c0
[  172.819618]  ? lockdep_hardirqs_on+0x421/0x5c0
[  172.820443]  ? trace_hardirqs_on+0x67/0x230
[  172.821257]  exit_to_usermode_loop+0x241/0x2c0
[  172.822058]  do_syscall_64+0x536/0x600
[  172.823116]  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Reproducer: A reproducer in C was present. I was able to reproduce the
bug easily. I had to link a few extra libraries like pthreads to compile
the reproducer. I had to enable tls(transport layer security) options in
my kernel config(5.1.0-rc6+) to be able to reproduce it. I figured this
out by observing the commit to which the crash was bisected.

Analysis: By the stack trace, I observed that the crash was triggered
somewhere in skb_release_data. The RIP register was pointing to
skb_release-data+0x5ae. skb_release is responsible for releasing data
from a socket buffer. Using GDB, I was able to figure out that
skb_release_data+0x5ae mapped to the function __skb_frag_unref. The
function takes as input a fragment of the data section of the socket
buffer and releases a reference to it. __skb_frag_unref calls put_page
to release a reference on the paged fragment. put_page in
/include/linux/mm.h:992 is triggered. put_page checks if the physical
page representing the fragment in physical memory has more than 0
references so as to release a reference using __put_page. In
put_page_testzero, if the page has 0 references on the entry of the
function, it triggers a crash(using VM_BUG_ON_PAGE). This means that one
of the data fragments of the socket buffer has zero references in memory
and is still a part of the socket buffer. 

Fix: A fix for this would be to ignore the fragment for releasing if its
reference count of its struct page is 0. But I feel that this would not
be a wise idea. The fact that a fragment of the socket buffer data has
no references should pass quietly.

From: bnvandana@gmail.com (Vandana BN)
Date: Sun, 12 May 2019 20:54:48 +0530
Subject: [Linux-kernel-mentees] Syzbot analysis, WARNING in ovl_rename (log)
Message-ID: <dde41b7e-5015-9888-b864-e716cb66b58e@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190512152448.O0ppm22Jd1bpmttO5keb5doHqwLN-JUxaTxo0ECbkxg@z>

Hello,

This is analysis of WARNING in ovl_rename (log)

https://syzkaller.appspot.com/bug?id=376c0834577763b440cb8abb61783d1031413f73

The WARN_ON is hit in ovl_rename(), when the old and new inode are same.

"1176???????? if (WARN_ON(olddentry->d_inode == newdentry->d_inode))"

The reproducer, mounts overlay fs with ramfs mount as upperdir and lowerdir as directory on root (ext4) which has a file(file0), the overlayfs mount now has the file0 from the lowerdir, the test then creates a hardlink (file1) to file0? and then tries to rename file0 to file1. since the hard link and the original file have same inode, the above WARN_ON is triggerd.

I was able to reproduce this, with changing c reproducer a bit to take correct mount parameters.

Below is analysis from the reproduction
mount output:
none on /ovl_test/syzkaller.t9H84E/upper type ramfs (rw,relatime)
none on /ovl_test/syzkaller.t9H84E/upper/file0 type overlay (rw,relatime,lowerdir=../file1,upperdir=./file0,workdir=./wd,index=off)

vfs view of lower dir

root at test:/ovl_test/syzkaller.t9H84E/file1# ls -ali
total 8
555971 d--------- 2 root root 4096 May 12 16:22 .
555969 drwxrwxrwx 4 root root 4096 May 12 16:22 ..
533455 ---------- 1 root root??? 0 May 12 16:22 file0 << original file

vfs view contents of upperdir/overlayfs mount

root at test:/ovl_test/syzkaller.t9H84E/upper/file0# ls -ali
total 0
239104 d--------- 1 root root 0 May 12 16:22 .
236464 drwxr-xr-x 4 root root 0 May 12 16:22 ..
533455 ---------- 2 root root 0 May 12 16:22 file0 << inode of lowerdir
236475 ---------- 2 root root 0 May 12 16:22 file1 << hard link inode created in upper dir

but in overlayfs both file0 and file1 point to? same inode

olddentry file0? 000000009a223589
newdentry file1? 000000009a223589


The syzbot has bisected it to
ovl: fix EIO from lookup of non-indexed upper
commit 6eaf011144af10cad34c0d46f82e50d382c8e926

According to man page of rename,the expected behavior of rename if old and new are existing hard links referring to the same file, is to do nothing and return success.

Even before the above syslog bisect commit,such rename would return EIO from lookup and now it returns error ESTALE from ovl rename, both of which is wrong behavior.

The vfs_rename() has below check
???? if (source == target)
??????????????? return 0;
rename doesn't exit here because vfs sees 2 different inodes for source and target, as seen above.

But overlay fs sees both as same hence the WARN_ON.

There can be 2 possible fixes

1.whenever hard link is created for a file in lower dir, copyup the original file to upperdir before creating the link, so that both original and link inode will be same w.r.t VFS, but this might create additional inodes. OR

2.Similar to vfs_rename check, ovl_rename() can check if old and new are same inodes and return success.

Please let me know your feedback.

Thanks,

Vandana.

From: bnvandana@gmail.com (Vandana B N)
Date: Tue, 14 May 2019 23:09:37 +0530
Subject: [Linux-kernel-mentees] Syzbot analysis,
	WARNING in ovl_rename (log)
In-Reply-To: <aa1c7aec-d34f-8ced-199a-7de48a54a310@linuxfoundation.org>
References: <dde41b7e-5015-9888-b864-e716cb66b58e@gmail.com>
	<aa1c7aec-d34f-8ced-199a-7de48a54a310@linuxfoundation.org>
Message-ID:
 <CAMSW_DLm42wtzFmS_-_ttX21A0rr5pKNQ-R723JhaK+A5Mh=hQ@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190514173937.2_Z78gWT0GrFD-ZiQUH1puh1kOpraG23e3ZiwEI_dgs@z>

On Tue 14 May, 2019, 10:28 PM Shuah Khan, <skhan at linuxfoundation.org> wrote:

> Hi Vandana,
>
> Soory for the delay in getting back to you.
>
> On 5/12/19 9:24 AM, Vandana BN wrote:
> > Hello,
> >
> > This is analysis of WARNING in ovl_rename (log)
> >
> >
> https://syzkaller.appspot.com/bug?id=376c0834577763b440cb8abb61783d1031413f73
> >
> > The WARN_ON is hit in ovl_rename(), when the old and new inode are same.
> >
> > "1176         if (WARN_ON(olddentry->d_inode == newdentry->d_inode))"
> >
> > The reproducer, mounts overlay fs with ramfs mount as upperdir and
> lowerdir as directory on root (ext4) which has a file(file0), the overlayfs
> mount now has the file0 from the lowerdir, the test then creates a hardlink
> (file1) to file0  and then tries to rename file0 to file1. since the hard
> link and the original file have same inode, the above WARN_ON is triggerd.
> >
> > I was able to reproduce this, with changing c reproducer a bit to take
> correct mount parameters.
> >
>
> Great. Which release were you able to reproduce this on?
>

I was able to see this on 5.1.1 release..

>
> > Below is analysis from the reproduction
> > mount output:
> > none on /ovl_test/syzkaller.t9H84E/upper type ramfs (rw,relatime)
> > none on /ovl_test/syzkaller.t9H84E/upper/file0 type overlay
> (rw,relatime,lowerdir=../file1,upperdir=./file0,workdir=./wd,index=off)
> >
> > vfs view of lower dir
> >
> > root at test:/ovl_test/syzkaller.t9H84E/file1# ls -ali
> > total 8
> > 555971 d--------- 2 root root 4096 May 12 16:22 .
> > 555969 drwxrwxrwx 4 root root 4096 May 12 16:22 ..
> > 533455 ---------- 1 root root    0 May 12 16:22 file0 << original file
> >
> > vfs view contents of upperdir/overlayfs mount
> >
> > root at test:/ovl_test/syzkaller.t9H84E/upper/file0# ls -ali
> > total 0
> > 239104 d--------- 1 root root 0 May 12 16:22 .
> > 236464 drwxr-xr-x 4 root root 0 May 12 16:22 ..
> > 533455 ---------- 2 root root 0 May 12 16:22 file0 << inode of lowerdir
> > 236475 ---------- 2 root root 0 May 12 16:22 file1 << hard link inode
> created in upper dir
> >
> > but in overlayfs both file0 and file1 point to  same inode
> >
> > olddentry file0  000000009a223589
> > newdentry file1  000000009a223589
> >
> >
> > The syzbot has bisected it to
> > ovl: fix EIO from lookup of non-indexed upper
> > commit 6eaf011144af10cad34c0d46f82e50d382c8e926
> >
>
> Right. Could it be because the WARN_ON was added in this
> commit. This commit added the following check:
>
> if (WARN_ON(upperdentry && indexed && !lowerdentry))
>                 return ERR_PTR(-EIO);
>
> > According to man page of rename,the expected behavior of rename if old
> and new are existing hard links referring to the same file, is to do
> nothing and return success.
> >
> > Even before the above syslog bisect commit,such rename would return EIO
> from lookup and now it returns error ESTALE from ovl rename, both of which
> is wrong behavior.
> >
>
> I didn't see the above commit adding ESTALE. Is that in another commit?
>
I meant that earlier it would return EIO.. the return value from lookup..

> > The vfs_rename() has below check
> >       if (source == target)
> >                  return 0;
> > rename doesn't exit here because vfs sees 2 different inodes for source
> and target, as seen above.
> >
> > But overlay fs sees both as same hence the WARN_ON.
> >
> > There can be 2 possible fixes
> >
> > 1.whenever hard link is created for a file in lower dir, copyup the
> original file to upperdir before creating the link, so that both original
> and link inode will be same w.r.t VFS, but this might create additional
> inodes. OR
> >
>
> Not sure about this one.
>
> > 2.Similar to vfs_rename check, ovl_rename() can check if old and new are
> same inodes and return success.
> >
>
> Sounds reasonable. However, the rules for renaming might be governed
> by ovelayfs - Documentation/filesystems/overlayfs.txt
>
> I think this WARN_ON is detecting a real condition, however WARN_ON
> might be a big hammer, and could print an error message and return.
> WARN_ONs are overused at times.
>
> Good analysis btw. Take a look at https://cregit.linuxsources.org/
> It let's you visualize change history of source files and is helpful
> in debugging. I updated the debugging section with the information
>
> https://wiki.linuxfoundation.org/lkmp/lkmp_required_contributions
>
> thanks,
> -- Shuah
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20190514/d8e80f0c/attachment.html>

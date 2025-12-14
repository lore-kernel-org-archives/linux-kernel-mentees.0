Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14421DF26B
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 14 Dec 2025 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734494; cv=none; b=cTuXoaPGY7orh7nsfalFsJd3qarN4xMA/ilG1cy+bdMoajBG+zVt/J9IVLxGPB44E1PnV6vwd7YwNhToGcAV/xhHmMVnHxH8+ZkBqb2dL2b6z4nx+iohjH1xKju3uo0ysp1BtzgqtckiL5Q5FLx46WyJmDbbSzLpD8yXMJdcbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734494; c=relaxed/simple;
	bh=IAnxoHBfhE3lPmVOK5a5yu4hg04cQvtnldIIl2NV1Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyLYd84/SkIt2Fk89Kciq1hJ2SQMEazqRpkNzk68kKHTKytM+EXZD/QQIW1bWY/Icw/4+xgMeUzWGKOdrKFOI7xLpal2XBfTNZaBbg2b+V+W/f84M81UeSdyXlAnJYmjuL4bOrabxQEuKKaIlXa+rGn1EG1r+ydcrElGnlZLdJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkMXFLRV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkMXFLRV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1718227b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 14 Dec 2025 09:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734491; x=1766339291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4ss2AtJdCAUQD/JNPRRe3kaQHMy0WP+FE6HoNfl2Yk=;
        b=WkMXFLRVdg+r19btbMdgvRzMpSoeuMP/mWx4VhQq29sCAEUI7rIlVfx+7DplUEwiay
         R3CUrmA9PbUN97Ww9MRNR9aAuUrP0JdOnG1OXy0kQzGV9DvTu1m6i8sO9Y6f7tPXZcAb
         BzJHUb28eDApr2lZyaYiZKrUbBv8UOV3YJ+KjZ2dckJBdFFZ5vhHMRPiE3vkiYF9Sgk2
         Sp6cqRFt6Jrs31Mydhl+xBG2vTdgobnZKhtIBRQZhiHOZc9Wl2P30YBp0roFXENz7eLX
         4uSXbdX28bUeDE6TbWQ6y86+h9VPRPZoTQIoR3WSgjOLZuKExA9rltfAgn/n14Imfw/v
         8SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734491; x=1766339291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4ss2AtJdCAUQD/JNPRRe3kaQHMy0WP+FE6HoNfl2Yk=;
        b=joet9RKsbRn5W8QPMXFEuI8dY3NIPa5hv4C+iC4+W0BRvcbTRVS4knJs1qrue3aONf
         VAHuC9J4u72d6VNWXGSXx1xopkZJq8brtRss87Io/BDtsxneHSR8El4QMPnJHu1qidaq
         cTMeuW/P4rf0f+w/Wac7pn/XDn0W47/ZjN4msa2TkvyOx8STCOUklMnEHk/f5qr/qYPd
         oXC+y5sgQq117PL89WTQwGf9ggbaXWKGn7wsXOzF7ShWL9NWS/q/EzN71QtY5DMsPgxe
         8rXuhHi7bkfAtSDXjPoZn2NrtNpP8/ZJXJVdaOQCwFL9CmknjM1eWamxYopcO+vTEmG6
         DGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2SYjaLzmNjThRboTLbyvferfZo2ukPX8t63bTCMcm0wY1ljJXicJhY6yjt7PRaBoaj9CuV9+OMVEPkbvoNkdBoaEqNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnn+8xNY5AdGsYazypbiOaUtdiix08sWAO/Z67ds8+9bcDS9Mi
	U/PuRhtSSaS5DrsMdr8vqYE1OS8KWx+EWpHtGZxdOic2At0Bgvqnjm5m
X-Gm-Gg: AY/fxX5f55Ezl0w8QB/wgcWz13LR3mZu5Kcqt6j3xeG4b3ouTVk6cfIinSX+hR4u+Km
	mZo5lv2lCrhGC8UXWxnFtVrCwWFMrcZIGEqyXfUFoi8rTSk6fx38WV5dqFx8rOAQJGZBHZo5sPI
	Tu29EDwfL8fq2Q2IR4BQ82InTmXRImugvD093cksWXy/7ZSpN1HiTb+q8P2HzOOMGCanraBJiR5
	h+iBTmXTshralP0YphkvCAKTeMq8cdft91LupyNZQB8xMvaK3HmTf5ly8YSnBP+XUsRwxWb3Jj0
	UAb8vEC/LOLhvUWTokrGFqCI5FaCojoUvWmtiyYxtM3gc1uDhw8ara5nofLUDMej/pQxt1/CFvw
	dZUEtxAvs91lgYlwrMS/2Sqf9u5xunou5O5H7pkiHxszI4QAz1Som2iETS1IGh3X9vSBVQCiwSk
	tC14+7RVV9htPw
X-Google-Smtp-Source: AGHT+IGelca07+SB0Yo5G7TbsfmpjunGJDbHE07MiR1UXbJ0i0kzB+um8NPc6/0wQXaC6t832yrztg==
X-Received: by 2002:a05:6a21:3395:b0:34e:865e:8a65 with SMTP id adf61e73a8af0-369af528581mr6951027637.52.1765734491114;
        Sun, 14 Dec 2025 09:48:11 -0800 (PST)
Received: from prithvi-HP ([111.125.240.40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ae4e3casm10585047a12.21.2025.12.14.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:48:10 -0800 (PST)
Date: Sun, 14 Dec 2025 23:18:02 +0530
From: Prithvi <activprithvi@gmail.com>
To: Heming Zhao <heming.zhao@suse.com>, joseph.qi@linux.alibaba.com
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] ocfs2: fix kernel BUG in ocfs2_write_block
Message-ID: <nwkfpkm2wlajswykywnpt4sc6gdkesakw2sw7etuw2u2w23hul@6oby33bscwdw>
References: <20251210193257.25500-1-activprithvi@gmail.com>
 <9bad11da-0655-4fb4-b424-8c124b127290@linux.alibaba.com>
 <neqzjkw3ylaqghldgkl7jzlcl4o3vofbm6aa3a2kojfaakzjhm@ele2brknwzwm>
 <htz6wcj3y3dhp7jyzgrachhrz6uzi7ytuby6fdtrugm57cik32@2vo56g6wmidb>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <htz6wcj3y3dhp7jyzgrachhrz6uzi7ytuby6fdtrugm57cik32@2vo56g6wmidb>

On Sun, Dec 14, 2025 at 11:14:46PM +0800, Heming Zhao wrote:
> On Sat, Dec 13, 2025 at 02:25:29PM +0530, Prithvi wrote:
> > On Thu, Dec 11, 2025 at 10:17:21AM +0800, Joseph Qi wrote:
> > > 
> > > 
> > > On 2025/12/11 03:32, Prithvi Tambewagh wrote:
> > > > When the filesystem is being mounted, the kernel panics while the data
> > > > regarding slot map allocation to the local node, is being written to the
> > > > disk. This occurs because the value of slot map buffer head block
> > > > number, which should have been greater than or equal to
> > > > `OCFS2_SUPER_BLOCK_BLKNO` (evaluating to 2) is less than it, indicative
> > > > of disk metadata corruption. This triggers
> > > > BUG_ON(bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) in ocfs2_write_block(),
> > > > causing the kernel to panic.
> > > > 
> > > > This is fixed by introducing an if condition block in
> > > > ocfs2_update_disk_slot(), right before calling ocfs2_write_block(), which
> > > > checks if `bh->b_blocknr` is lesser than `OCFS2_SUPER_BLOCK_BLKNO`; if
> > > > yes, then ocfs2_error is called, which prints the error log, for
> > > > debugging purposes, and the return value of ocfs2_error() is returned
> > > > back to caller of ocfs2_update_disk_slot() i.e. ocfs2_find_slot(). If
> > > > the return value is zero. then error code EIO is returned.
> > > > 
> > > > Reported-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
> > > > Closes: https://syzkaller.appspot.com/bug?extid=c818e5c4559444f88aa0
> > > > Tested-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> > > > ---
> > > > v1->v2:
> > > >  - Remove usage of le16_to_cpu() from ocfs2_error()
> > > >  - Cast bh->b_blocknr to unsigned long long
> > > >  - Remove type casting for OCFS2_SUPER_BLOCK_BLKNO
> > > >  - Fix Sparse warnings reported in v1 by kernel test robot
> > > >  - Update title from 'ocfs2: Fix kernel BUG in ocfs2_write_block' to
> > > >    'ocfs2: fix kernel BUG in ocfs2_write_block'
> > > > 
> > > > v1 link: https://lore.kernel.org/all/20251206154819.175479-1-activprithvi@gmail.com/T/
> > > > 
> > > >  fs/ocfs2/slot_map.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
> > > > index e544c704b583..e916a2e8f92d 100644
> > > > --- a/fs/ocfs2/slot_map.c
> > > > +++ b/fs/ocfs2/slot_map.c
> > > > @@ -193,6 +193,16 @@ static int ocfs2_update_disk_slot(struct ocfs2_super *osb,
> > > >  	else
> > > >  		ocfs2_update_disk_slot_old(si, slot_num, &bh);
> > > >  	spin_unlock(&osb->osb_lock);
> > > > +	if (bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) {
> > > > +		status = ocfs2_error(osb->sb,
> > > > +				     "Invalid Slot Map Buffer Head "
> > > > +				     "Block Number : %llu, Should be >= %d",
> > > > +				     (unsigned long long)bh->b_blocknr,
> > > > +				     OCFS2_SUPER_BLOCK_BLKNO);
> > > > +		if (!status)
> > > > +			return -EIO;
> > > > +		return status;
> > > > +	}
> > > >  
> > > >  	status = ocfs2_write_block(osb, bh, INODE_CACHE(si->si_inode));
> > > >  	if (status < 0)
> > > > 
> > > 
> > > Ummm... The 'bh' is from ocfs2_slot_info, which is load from crafted
> > > image during mount.
> > > So IIUC, the root cause is we read slot info without validating, see
> > > ocfs2_refresh_slot_info().
> > > So I'd prefer to implement a validate func and pass it into
> > > ocfs2_read_blocks() to do this job.
> > > 
> > > Thanks,
> > > Joseph
> > 
> > I checked using GDB and learnt that ocfs2_refresh_slot() is not called 
> > until the bug is triggered. Checking further, I obtained this backtrace 
> > just before the bug was triggered, with a breakpoint set at 
> > ocfs2_read_blocks():
> > 
> > #0  ocfs2_read_blocks (ci=0xffff88804b6e3cc0, block=0, nr=1, bhs=0xffffc9000f37efe0, 
> >     flags=1, validate=0x0) at fs/ocfs2/buffer_head_io.c:197
> > #1  0xffffffff83a1fb44 in ocfs2_map_slot_buffers (osb=0xffff888028d2c000, 
> >     si=0xffff888027329d00) at fs/ocfs2/slot_map.c:385
> > #2  ocfs2_init_slot_info (osb=0xffff888028d2c000) at fs/ocfs2/slot_map.c:424
> > #3  0xffffffff83a91b93 in ocfs2_initialize_super (sb=0xffff88802912a000, bh=<optimized out>, 
> >     sector_size=<optimized out>, stats=<optimized out>) at fs/ocfs2/super.c:2220
> > #4  ocfs2_fill_super (sb=0xffff88802912a000, fc=<optimized out>) at fs/ocfs2/super.c:993
> > #5  0xffffffff822db16e in get_tree_bdev_flags (fc=0xffff888029dac800, 
> >     fill_super=0xffffffff83a8d5c0 <ocfs2_fill_super>, flags=<optimized out>)
> >     at fs/super.c:1691
> > #6  0xffffffff822db3b2 in vfs_get_tree (fc=0xffff888029dac800) at fs/super.c:1751
> > #7  0xffffffff82366f32 in fc_mount (fc=0xffff888029dac800) at fs/namespace.c:1208
> > #8  do_new_mount_fc (fc=0xffff888029dac800, mountpoint=0xffffc9000f37fe60, mnt_flags=48)
> >     at fs/namespace.c:3651
> > #9  do_new_mount (path=0xffffc9000f37fe60, fstype=<optimized out>, sb_flags=<optimized out>, 
> >     mnt_flags=48, name=0xffff888024bf93a0 "/dev/loop0", data=0xffff888028b54000)
> >     at fs/namespace.c:3727
> > #10 0xffffffff823659c7 in path_mount (
> >     dev_name=0x1 <error: Cannot access memory at address 0x1>, path=0xffff888024bf93a0, 
> >     type_page=0xffff888028b54000 "user_xattr", flags=<optimized out>, 
> >     data_page=0x7fffc7d5cb00) at fs/namespace.c:4037
> > #11 0xffffffff82369253 in do_mount (dev_name=0xffff888024bf93a0 "/dev/loop0", 
> >     dir_name=0x200000000040 "./file1", type_page=<optimized out>, flags=2240, 
> > --Type <RET> for more, q to quit, c to continue without paging--
> >     data_page=0xffff888028b54000) at fs/namespace.c:4050
> > #12 __do_sys_mount (type=<optimized out>, dev_name=<optimized out>, dir_name=<optimized out>, flags=<optimized out>, 
> >     data=<optimized out>) at fs/namespace.c:4238
> > #13 __se_sys_mount (dev_name=<optimized out>, dir_name=35184372088896, type=<optimized out>, flags=2240, 
> >     data=140736546065152) at fs/namespace.c:4215
> > #14 0xffffffff82368f2c in __x64_sys_mount (regs=<optimized out>) at fs/namespace.c:4215
> > #15 0xffffffff81328ced in x64_sys_call (regs=0xffff88804b6e3cc0, nr=0) at arch/x86/entry/syscall_64.c:37
> > #16 0xffffffff8ac0015a in do_syscall_x64 (regs=0xffffc9000f37ff48, nr=165) at arch/x86/entry/syscall_64.c:63
> > #17 do_syscall_64 (regs=0xffffc9000f37ff48, nr=165) at arch/x86/entry/syscall_64.c:94
> > #18 0xffffffff81000130 in entry_SYSCALL_64 () at arch/x86/entry/entry_64.S:121
> > #19 0x0000000000000000 in ?? ()
> > 
> > Hence, I think the function to fix would be ocfs2_map_slot_buffers() i.e.
> > the call to ocfs2_read_blocks() in it. I came up with following changes:
> 
> Why does the syzbot test code never trigger ocfs2_refresh_slot_info()?
> According to the comment for LOCK_TYPE_REQUIRES_REFRESH, we know it requires DLM
> AST callback, but syzbot only mounts & operates the ocfs2 volume in local mode.
> 
> For this specific bug, adding validation function into ocfs2_map_slot_buffers()
> is correct. However, we should also add a validation action in
> ocfs2_refresh_slot_info(). This is another way to read slot map data.
> 
> > 
> > diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
> > index e544c704b583..299751617919 100644
> > --- a/fs/ocfs2/slot_map.c
> > +++ b/fs/ocfs2/slot_map.c
> > @@ -332,6 +332,26 @@ int ocfs2_clear_slot(struct ocfs2_super *osb, int slot_num)
> >         return ocfs2_update_disk_slot(osb, osb->slot_info, slot_num);
> >  }
> >  
> > +static int ocfs2_validate_slot_map_block(struct super_block *sb,
> > +                                     struct buffer_head *bh)
> > +{
> > +       int rc;
> > +
> > +       BUG_ON(!buffer_uptodate(bh));
> > +
> > +       if (bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) {
> > +               rc = ocfs2_error(osb->sb,
> > +                               "Invalid Slot Map Buffer Head "
> > +                               "Block Number : %llu, Should be >= %d",
> > +                               (unsigned long long)bh->b_blocknr,
> > +                               OCFS2_SUPER_BLOCK_BLKNO);
> > +               if (!rc)
> > +                       return -EIO;
> > +               return status;
> > +       }
> > +       return 0;
> > +}
> > +
> >  static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
> >                                   struct ocfs2_slot_info *si)
> >  {
> > @@ -383,7 +403,8 @@ static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
> >  
> >                 bh = NULL;  /* Acquire a fresh bh */
> >                 status = ocfs2_read_blocks(INODE_CACHE(si->si_inode), blkno,
> > -                                          1, &bh, OCFS2_BH_IGNORE_CACHE, NULL);
> > +                                          1, &bh, OCFS2_BH_IGNORE_CACHE,
> > +                                          ocfs2_validate_slot_map_block);
> >                 if (status < 0) {
> >                         mlog_errno(status);
> >                         goto bail;
> >   
> > What do you think? Is this the correct approach?
> > 
> > Thank You,
> > Prithvi
> 
> Based on my above comments, we should also add ocfs2_validate_slot_map_block()
> in ocfs2_refresh_slot_info().
Sure...I will use the new ocfs2_validate_slot_map_block() as here, in 
ocfs2_refresh_slot_info() as well and send the v3 patch.
> 
> Thanks,
> Heming

Thank You,
Prithvi

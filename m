Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19E14A60F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 16 Feb 2026 04:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771215430; cv=none; b=Q1y3dwzdSHyyrj9YXCc6HbKaEwhN3gTDi+4jCg5yQ4yPok2Ec7C9pIEmkkfio497fMrRX5X/M3LuGUVwy6cGDKaE1m1klVCHKcZVevc2KwISuhUoTfkKDr8Hez8FJkEcXyORlZiqI3a0fdh4B5C7E+ZjWuSnjvVVPo3jgQGMEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771215430; c=relaxed/simple;
	bh=MyTl4PFX3mRfdVM6cxgi5l2WTjlSXSbGDQbx09kyBSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGm/gqp4yK7tZmk+7sz7SDLQLa2g4n6tZx5UdY0qu5l1pk8S0ofbhpuhT4QnJBqffxXDMYTppi4BtzNTt9mPflm8x5aDa7T6lEveix+TxpwZ3QayZfIz7dJR1hf/QjL/FuSvpPT3Wy4I20NxNx6CSdKDDUEHvfC6zCL3XJFtr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngoReh0x; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngoReh0x"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7b47a5460so26034895ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Feb 2026 20:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771215427; x=1771820227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87a60IrPsZEkv8dm8fdH6Kik8z1oUurYwvGZt/o8UEs=;
        b=ngoReh0x7kSgOVvoxSff0A40zsayjtadb7ql0DEBMdtNSqBFYk2ArekVXJiCL1gN9s
         tfrBxmrguX5J8exeX48DRDvRZ+EzTvKOU+ZBriGmM46t+aOLLbE9HeDZEFWye+27MMTu
         luVsuQANwQGKRRP3MfnDFjTd0Ct/KBlYSa4SlyYeJmAx2UGNv96XwgAt/Fi/6b363ZZM
         0ukcNJ+GSqAjGw8EDFCJ3zD59aoN4e7WP8rmeENJjYlwsd3wW8IkkIjf6hfNrgvrRUtM
         sISsAXDvBTuyZRhz+IMSvndjgyWko6Rf4NBdaChtkPZ25r3S/paimgoMJfWOA2w4rZKr
         A5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771215427; x=1771820227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87a60IrPsZEkv8dm8fdH6Kik8z1oUurYwvGZt/o8UEs=;
        b=bEgr8e4Wwch8gdjDGEHECs0gdnMw4yzQDfXaXvVLMa3WTOyaWyc+x+1dvskJWbhmh/
         1//brOOPx1eEWJ6xqvuGtaX28L3lkxzmNJn89uCKFJY6b60EZXrg9FQ4le8iFe7tH9x0
         AtnMcyLKaPOrRbSY1oOuke7i27oBbXprNojIe8CKkG1fZXo1btIi5NaN957+6RF1EzmT
         IzpXjquhGRL6VPvXOVM51wsOWq1VPVri3RnkPjY+o+w+39RhKYKcKu7TIjM5aT13PeMt
         z280PKY9Cxxfu/a8pbI1z8PrazCU+mvF+qp/VSD+RM3AgzJjOA13/TmJ7QjBUg+qDLUU
         A04g==
X-Forwarded-Encrypted: i=1; AJvYcCUe67hO/Fg8L0j0uk4aDpDmVt0dndOZt0Kif8UwU2YFPjzxmOt9Y+LACtOtmvVjnvZybkiGQKlyAURQCuL9/2zkLyO5UA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPJFVSZMpieVD89YMNQ4bW7d6z8y8j1+FlMedIkMpqwf21jjPt
	rD+xfoCbVzbxTuOqcdwotWb561ZWMt7fCBsvRWG/8Ql7BtEXRrY2f+eL
X-Gm-Gg: AZuq6aLAsBhol7DPDTQtIFDCxFujhfFgyvfxXI7lDhVU4BYkb4VC/JD1DxiP4KzjAAP
	CBEcmGI0ywxlTHp2lJHHIEHb600VRKMs7zosWEDpNWbACe8WuDrRpIDWkPagdLnlyQ+/DiFzgxP
	7CrcS40UQj2sANPDZelU5ny75m5sMH06+c9fEr7Bn8UNRG3BA68QGB3a8uvNfvikTOzZ4xz0Lgk
	HpTUvY1bXhPJWOUly0st2y0FF2PFq43leErMK5ZCp0bngWXiHi0zb7fuTHlLA5zH1Id3TRvLvST
	BzfMLoU7LTYwPR1h0hwztGFOzNDKSltYjfHHdECJkwsf47BIyviHGEKNQPq7c4q7dt5VSgLcbrg
	rCLjiHqZN4hTNgMK8T+oAfclrFDc5SV3EIhS8FC2cHPgDhHGO6C0BlTbhMyq2Yq4Iw0oUJcuhIf
	JOHjY2x1PZmtQyUo/Qlv/qFzZLmEcC6ks=
X-Received: by 2002:a17:902:ef44:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2ac93edf6b2mr83476105ad.0.1771215427466;
        Sun, 15 Feb 2026 20:17:07 -0800 (PST)
Received: from inspiron ([114.79.136.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6f9df1sm50515445ad.10.2026.02.15.20.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 20:17:07 -0800 (PST)
Date: Mon, 16 Feb 2026 09:46:59 +0530
From: Prithvi <activprithvi@gmail.com>
To: willy@infradead.org, joseph.qi@linux.alibaba.com
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] ocfs2: Fix circular locking dependency in
 ocfs2_del_inode_from_orphan()
Message-ID: <20260216041659.plgrj5tiseeqwbkl@inspiron>
References: <20260106125100.327980-1-activprithvi@gmail.com>
 <94b4189d-dfb6-4443-a336-abbae89d36ad@linux.alibaba.com>
 <20260108183652.ro4xueuj6itfaph3@inspiron>
 <20260115031809.w7ksrj2ostwyxa54@inspiron>
 <aWhxfLwUvHDswsIY@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWhxfLwUvHDswsIY@casper.infradead.org>

On Thu, Jan 15, 2026 at 04:47:56AM +0000, Matthew Wilcox wrote:
> On Thu, Jan 15, 2026 at 08:48:09AM +0530, Prithvi wrote:
> > On Fri, Jan 09, 2026 at 12:07:00AM +0530, Prithvi wrote:
> > > IIUC that would be the case when ocfs2_dio_end_io_write() operates on normal
> > > files. However, according to the report of the bug, ocfs2_dio_end_io_write()
> > > is holding &ocfs2_quota_ip_alloc_sem_key so I think due to random fuzzing by 
> > > syzkaller, the function is curently operating on a quota file.
> 
> So the right fix is probably to disallow DIO to a quota file, wouldn't
> you say?

Hello all,

Firstly I apologize for the delay...I was trying to understand the bug in
detail and few strange things I noticed. I have now confirmed the bug is
due to uninitialized locks during slab reuse. Here are the deatils:

According to earlier observations, we knew that a file with a quota lock
was trying to enter DIO path which is not permitted. I observed that
that in spite of adding checks like IS_NOQUOTA(inode) since I observed:

else if (fe->i_flags & cpu_to_le32(OCFS2_QUOTA_FL)) {
        inode->i_flags |= S_NOQUOTA;
}

in ocfs2_populate_inode(). However with this change also the issue didn't
seem to get resolved.

I found that it was some inode numbered 16979 which was entering DIO.
However, upon investigation I noticed that inode 16979 passed through
ocfs2_populate_inode() only when create_ino = 1. Upon adding a few printk
statements in __ocfs2_mknod_locked() I found that the inode 16979 strangely
held ocfs2_quota_ip_allc_sem lock at the mknod stage. I suspected it to be
a lock cleanup issue in the slab object when inodes are returned to the slab.

I found that in one mount session, an inode was mounted as a quota file,
with a very small number (mostly <50) then later on in another mount session
that same slab object is reused for the inode with number 16979 which
immediately causes the lockdep warning to occur since it still holds the
quota_ip_alloc_sem lock.

IIUC, I did not find any way the semaphore is cleaned when an inode is
evicted. Hence I think to add init_rwsem() to the ocfs2_clear_inode() to
stop the warning, since now that inode held ip_alloc_sem lock only, thus
no quota lock acquired during DIO and the issue never occurs, even if same
slab object is used which retains the lock identity. In addition, a check
can be added to block DIO on quota files.

Thus, I think the following change should work:

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 76c86f1c2b1c..372c198afa25 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -2420,7 +2420,13 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
        struct inode *inode = file->f_mapping->host;
        struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
        get_block_t *get_block;
-
+
+       if(IS_NOQUOTA(inode)) {
+               mlog(ML_ERROR, "Direct IO is not allowed for Quota inode %lu\n",
+                    inode->i_ino);
+               return -ENOTSUP;
+       }
+
        /*
         * Fallback to buffered I/O if we see an inode without
         * extents.
diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index b5fcc2725a29..3e36da2ca5d0 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1268,7 +1268,8 @@ static void ocfs2_clear_inode(struct inode *inode)
                        "Clear inode of %llu, alloc_sem is locked\n",
                        (unsigned long long)oi->ip_blkno);
        up_write(&oi->ip_alloc_sem);
-
+       init_rwsem(&oi->ip_alloc_sem);
+
        mlog_bug_on_msg(oi->ip_open_count,
                        "Clear inode of %llu has open count %d\n",
                        (unsigned long long)oi->ip_blkno, oi->ip_open_count);

What do you think?

Thank you and best regards,
Prithvi

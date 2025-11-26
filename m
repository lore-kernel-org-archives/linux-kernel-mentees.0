Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6BB31DD97
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764164917; cv=none; b=LeOZTEbi+0wyA9HLiXs1triobobMXQ7ZBSm9AJLhxhmZehv97CtB3vF8PEv4ZGyhTnJO959I9GhGq6h/onJJdI8sD62gdufuRaTipM5c2WZjjAAECGMJvSWrK5at+oF+gkvWOPtTRWTIK/zfCsBXVcL/wqWa3BNaoCwqbTdlmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764164917; c=relaxed/simple;
	bh=C46JPX9ZcAUZYj6SYYUQshAqyaNIL+SjXtfnjDmoayg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3NKxXj5RtELDRYyqlzJRYIUM/V8M2d12xdtbGkjqo8iqjZ0QjqyRlExFtY8AtrS22OH/k3d9k+3L0rJ6FpiO1+yNqnPl89Hzb2UHRCNBSDMH0kH40PbFbyvhghuIjbwIRUQmqNGZAS11tKPc2zeDfNwQDAOQyvgSrJXA6qlqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qw1BNnjT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qw1BNnjT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC07783C69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 13:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJsBykpvGeV9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 13:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA11683C50
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA11683C50
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qw1BNnjT
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AA11683C50
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 13:48:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAF10601A6;
	Wed, 26 Nov 2025 13:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DD3C113D0;
	Wed, 26 Nov 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764164912;
	bh=C46JPX9ZcAUZYj6SYYUQshAqyaNIL+SjXtfnjDmoayg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qw1BNnjTcoYUy8lGXF2ZVgQ7YMvO88sVDBNbiwT48jYhDqyq6UgWKJRAK6Zr9SpHM
	 vTvl1qGg/wTZMY6ZLuEQ8DpY2VrXO2K1Dgg8jxR2FYOe3Pc+a1GbCpcAb4R6I8msCd
	 tiEcQP1I2vCwLaX+QJPsU1+WTt3qMfjs8lekhJWIDWO+AK4k829hRT1ErG3/IyPHcm
	 En6AOy2UvRuczxA7SnqzLpO8luBVS46ZL2tyf49lDOWCFh4lqfvzxiWZMMvue7TVym
	 YSOJ59sgFkh6mI+IWqrFzRIu+4e7FoFHL6DQx6aECtClUeg2IBo+vye70pIDMf4PZe
	 JD/S+uDzueJQA==
Date: Wed, 26 Nov 2025 14:48:26 +0100
From: Christian Brauner <brauner@kernel.org>
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, 
	"frank.li@vivo.com" <frank.li@vivo.com>, "slava@dubeyko.com" <slava@dubeyko.com>, 
	"mehdi.benhadjkhelifa@gmail.com" <mehdi.benhadjkhelifa@gmail.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"jack@suse.cz" <jack@suse.cz>, "khalid@kernel.org" <khalid@kernel.org>, 
	"linux-kernel-mentees@lists.linuxfoundation.org" <linux-kernel-mentees@lists.linuxfoundation.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"david.hunter.linux@gmail.com" <david.hunter.linux@gmail.com>, 
	"syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com" <syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super()
 failure
Message-ID: <20251126-gebaggert-anpacken-d0d9fb10b9bc@brauner>
References: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
 <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3s7phbv2fzuqvuhx"
Content-Disposition: inline
In-Reply-To: <c19c6ebedf52f0362648a32c0eabdc823746438f.camel@ibm.com>


--3s7phbv2fzuqvuhx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 19, 2025 at 07:58:21PM +0000, Viacheslav Dubeyko wrote:
> On Wed, 2025-11-19 at 08:38 +0100, Mehdi Ben Hadj Khelifa wrote:
> > The regression introduced by commit aca740cecbe5 ("fs: open block device
> > after superblock creation") allows setup_bdev_super() to fail after a new
> > superblock has been allocated by sget_fc(), but before hfs_fill_super()
> > takes ownership of the filesystem-specific s_fs_info data.
> > 
> > In that case, hfs_put_super() and the failure paths of hfs_fill_super()
> > are never reached, leaving the HFS mdb structures attached to s->s_fs_info
> > unreleased.The default kill_block_super() teardown also does not free 
> > HFS-specific resources, resulting in a memory leak on early mount failure.
> > 
> > Fix this by moving all HFS-specific teardown (hfs_mdb_put()) from
> > hfs_put_super() and the hfs_fill_super() failure path into a dedicated
> > hfs_kill_sb() implementation. This ensures that both normal unmount and
> > early teardown paths (including setup_bdev_super() failure) correctly
> > release HFS metadata.
> > 
> > This also preserves the intended layering: generic_shutdown_super()
> > handles VFS-side cleanup, while HFS filesystem state is fully destroyed
> > afterwards.
> > 
> > Fixes: aca740cecbe5 ("fs: open block device after superblock creation")
> > Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6  
> > Tested-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> > Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> > ---
> > ChangeLog:
> > 
> > Changes from v1:
> > 
> > -Changed the patch direction to focus on hfs changes specifically as 
> > suggested by al viro
> > 
> > Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/  
> > 
> > Note:This patch might need some more testing as I only did run selftests 
> > with no regression, check dmesg output for no regression, run reproducer 
> > with no bug and test it with syzbot as well.
> 
> Have you run xfstests for the patch? Unfortunately, we have multiple xfstests
> failures for HFS now. And you can check the list of known issues here [1]. The
> main point of such run of xfstests is to check that maybe some issue(s) could be
> fixed by the patch. And, more important that you don't introduce new issues. ;)
> 
> > 
> >  fs/hfs/super.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/hfs/super.c b/fs/hfs/super.c
> > index 47f50fa555a4..06e1c25e47dc 100644
> > --- a/fs/hfs/super.c
> > +++ b/fs/hfs/super.c
> > @@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
> >  {
> >  	cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
> >  	hfs_mdb_close(sb);
> > -	/* release the MDB's resources */
> > -	hfs_mdb_put(sb);
> >  }
> >  
> >  static void flush_mdb(struct work_struct *work)
> > @@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
> >  bail_no_root:
> >  	pr_err("get root inode failed\n");
> >  bail:
> > -	hfs_mdb_put(sb);
> >  	return res;
> >  }
> >  
> > @@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct fs_context *fc)
> >  	return 0;
> >  }
> >  
> > +static void hfs_kill_sb(struct super_block *sb)
> > +{
> > +	generic_shutdown_super(sb);
> > +	hfs_mdb_put(sb);
> > +	if (sb->s_bdev) {
> > +		sync_blockdev(sb->s_bdev);
> > +		bdev_fput(sb->s_bdev_file);
> > +	}
> > +
> > +}
> > +
> >  static struct file_system_type hfs_fs_type = {
> >  	.owner		= THIS_MODULE,
> >  	.name		= "hfs",
> > -	.kill_sb	= kill_block_super,
> 
> It looks like we have the same issue for the case of HFS+ [2]. Could you please
> double check that HFS+ should be fixed too?

There's no need to open-code this unless I'm missing something. All you
need is the following two patches - untested. Both issues were
introduced by the conversion to the new mount api.

--3s7phbv2fzuqvuhx
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-hfs-ensure-sb-s_fs_info-is-always-cleaned-up.patch"

From 058747cefb26196f3c192c76c631051581b29b27 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 19 Nov 2025 14:30:51 +0100
Subject: [PATCH 1/2] hfs: ensure sb->s_fs_info is always cleaned up

When hfs was converted to the new mount api a bug was introduced by
changing the allocation pattern of sb->s_fs_info. If setup_bdev_super()
fails after a new superblock has been allocated by sget_fc(), but before
hfs_fill_super() takes ownership of the filesystem-specific s_fs_info
data it was leaked.

Fix this by freeing sb->s_fs_info in hfs_kill_super().

Fixes: ffcd06b6d13b ("hfs: convert hfs to use the new mount api")
Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/hfs/mdb.c   | 35 ++++++++++++++---------------------
 fs/hfs/super.c | 10 +++++++++-
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/fs/hfs/mdb.c b/fs/hfs/mdb.c
index 53f3fae60217..f28cd24dee84 100644
--- a/fs/hfs/mdb.c
+++ b/fs/hfs/mdb.c
@@ -92,7 +92,7 @@ int hfs_mdb_get(struct super_block *sb)
 		/* See if this is an HFS filesystem */
 		bh = sb_bread512(sb, part_start + HFS_MDB_BLK, mdb);
 		if (!bh)
-			goto out;
+			return -EIO;
 
 		if (mdb->drSigWord == cpu_to_be16(HFS_SUPER_MAGIC))
 			break;
@@ -102,13 +102,14 @@ int hfs_mdb_get(struct super_block *sb)
 		 * (should do this only for cdrom/loop though)
 		 */
 		if (hfs_part_find(sb, &part_start, &part_size))
-			goto out;
+			return -EIO;
 	}
 
 	HFS_SB(sb)->alloc_blksz = size = be32_to_cpu(mdb->drAlBlkSiz);
 	if (!size || (size & (HFS_SECTOR_SIZE - 1))) {
 		pr_err("bad allocation block size %d\n", size);
-		goto out_bh;
+		brelse(bh);
+		return -EIO;
 	}
 
 	size = min(HFS_SB(sb)->alloc_blksz, (u32)PAGE_SIZE);
@@ -125,14 +126,16 @@ int hfs_mdb_get(struct super_block *sb)
 	brelse(bh);
 	if (!sb_set_blocksize(sb, size)) {
 		pr_err("unable to set blocksize to %u\n", size);
-		goto out;
+		return -EIO;
 	}
 
 	bh = sb_bread512(sb, part_start + HFS_MDB_BLK, mdb);
 	if (!bh)
-		goto out;
-	if (mdb->drSigWord != cpu_to_be16(HFS_SUPER_MAGIC))
-		goto out_bh;
+		return -EIO;
+	if (mdb->drSigWord != cpu_to_be16(HFS_SUPER_MAGIC)) {
+		brelse(bh);
+		return -EIO;
+	}
 
 	HFS_SB(sb)->mdb_bh = bh;
 	HFS_SB(sb)->mdb = mdb;
@@ -174,7 +177,7 @@ int hfs_mdb_get(struct super_block *sb)
 
 	HFS_SB(sb)->bitmap = kzalloc(8192, GFP_KERNEL);
 	if (!HFS_SB(sb)->bitmap)
-		goto out;
+		return -EIO;
 
 	/* read in the bitmap */
 	block = be16_to_cpu(mdb->drVBMSt) + part_start;
@@ -185,7 +188,7 @@ int hfs_mdb_get(struct super_block *sb)
 		bh = sb_bread(sb, off >> sb->s_blocksize_bits);
 		if (!bh) {
 			pr_err("unable to read volume bitmap\n");
-			goto out;
+			return -EIO;
 		}
 		off2 = off & (sb->s_blocksize - 1);
 		len = min((int)sb->s_blocksize - off2, size);
@@ -199,12 +202,12 @@ int hfs_mdb_get(struct super_block *sb)
 	HFS_SB(sb)->ext_tree = hfs_btree_open(sb, HFS_EXT_CNID, hfs_ext_keycmp);
 	if (!HFS_SB(sb)->ext_tree) {
 		pr_err("unable to open extent tree\n");
-		goto out;
+		return -EIO;
 	}
 	HFS_SB(sb)->cat_tree = hfs_btree_open(sb, HFS_CAT_CNID, hfs_cat_keycmp);
 	if (!HFS_SB(sb)->cat_tree) {
 		pr_err("unable to open catalog tree\n");
-		goto out;
+		return -EIO;
 	}
 
 	attrib = mdb->drAtrb;
@@ -229,12 +232,6 @@ int hfs_mdb_get(struct super_block *sb)
 	}
 
 	return 0;
-
-out_bh:
-	brelse(bh);
-out:
-	hfs_mdb_put(sb);
-	return -EIO;
 }
 
 /*
@@ -359,8 +356,6 @@ void hfs_mdb_close(struct super_block *sb)
  * Release the resources associated with the in-core MDB.  */
 void hfs_mdb_put(struct super_block *sb)
 {
-	if (!HFS_SB(sb))
-		return;
 	/* free the B-trees */
 	hfs_btree_close(HFS_SB(sb)->ext_tree);
 	hfs_btree_close(HFS_SB(sb)->cat_tree);
@@ -373,6 +368,4 @@ void hfs_mdb_put(struct super_block *sb)
 	unload_nls(HFS_SB(sb)->nls_disk);
 
 	kfree(HFS_SB(sb)->bitmap);
-	kfree(HFS_SB(sb));
-	sb->s_fs_info = NULL;
 }
diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 47f50fa555a4..df289cbdd4e8 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -431,10 +431,18 @@ static int hfs_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void hfs_kill_super(struct super_block *sb)
+{
+	struct hfs_sb_info *hsb = HFS_SB(sb);
+
+	kill_block_super(sb);
+	kfree(hsb);
+}
+
 static struct file_system_type hfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "hfs",
-	.kill_sb	= kill_block_super,
+	.kill_sb	= hfs_kill_super,
 	.fs_flags	= FS_REQUIRES_DEV,
 	.init_fs_context = hfs_init_fs_context,
 };
-- 
2.47.3


--3s7phbv2fzuqvuhx
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0002-hfsplus-ensure-sb-s_fs_info-is-always-cleaned-up.patch"

From 54b8d07c3e1a22dc07ecb03415edd96524d14642 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 26 Nov 2025 14:43:24 +0100
Subject: [PATCH 2/2] hfsplus: ensure sb->s_fs_info is always cleaned up

When hfsplus was converted to the new mount api a bug was introduced by
changing the allocation pattern of sb->s_fs_info. If setup_bdev_super()
fails after a new superblock has been allocated by sget_fc(), but before
hfsplus_fill_super() takes ownership of the filesystem-specific s_fs_info
data it was leaked.

Fix this by freeing sb->s_fs_info in hfsplus_kill_super().

commit 432f7c78cb00 ("hfsplus: convert hfsplus to use the new mount api")
Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/hfsplus/super.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 16bc4abc67e0..8734520f6419 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -328,8 +328,6 @@ static void hfsplus_put_super(struct super_block *sb)
 	hfs_btree_close(sbi->ext_tree);
 	kfree(sbi->s_vhdr_buf);
 	kfree(sbi->s_backup_vhdr_buf);
-	call_rcu(&sbi->rcu, delayed_free);
-
 	hfs_dbg("finished\n");
 }
 
@@ -629,7 +627,6 @@ static int hfsplus_fill_super(struct super_block *sb, struct fs_context *fc)
 out_unload_nls:
 	unload_nls(sbi->nls);
 	unload_nls(nls);
-	kfree(sbi);
 	return err;
 }
 
@@ -688,10 +685,18 @@ static int hfsplus_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void hfsplus_kill_super(struct super_block *sb)
+{
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+
+	kill_block_super(sb);
+	call_rcu(&sbi->rcu, delayed_free);
+}
+
 static struct file_system_type hfsplus_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "hfsplus",
-	.kill_sb	= kill_block_super,
+	.kill_sb	= hfsplus_kill_super,
 	.fs_flags	= FS_REQUIRES_DEV,
 	.init_fs_context = hfsplus_init_fs_context,
 };
-- 
2.47.3


--3s7phbv2fzuqvuhx--

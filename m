Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798453A1D14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483725; cv=none; b=aVD+G/Fzc34mt/Nqww0ldRzmh+14k/AN34bf/LJv/X+sYhDE2qVW8xsvnncMzxWM4Fo3qBlLox7YXDcSc2XjpNTrVLl3XCP9tlyvzSBdo7fnQdaXeF8TZcpHrsXYZIn0L48J+FX42Z1YoFsUCgOrQsMvR3xtuJ99LpjTFE5RI8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483725; c=relaxed/simple;
	bh=O7TfZZlaiztHzB6VOh7voLO1scv7ss5HnqRVDeHGqZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByFdkHkj1F9X78pFWSYvmIy0f++WoEnM4S+wNDhi2/UHqLFrH/5qx/h++7mx9NalrvlkkcBdbiebBCDSlqarPzzmOQeS2Pj5t4M2mm6Ir4YDcWZXC0WyvOQP258565ZX/rDE6DdLmxOwvZZKnqTCq/43cI3Nb/jNMv74qqmK4sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=TGMImKE5; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TGMImKE5"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1902606CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.998
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFxI46enS37K for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 16:35:20 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89B3E606C8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B3E606C8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=TGMImKE5
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 89B3E606C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M+OTAbPlPqvILm2ZXSnYoxwucFFz/9t0BlIZfknkHpY=; b=TGMImKE5UlSDhCLoxndQr4t/Wt
	guDkMdCRj97uLkq1xW+CnSFn7WJRj94h3RGd29fak3TlFgufUk0KhNZ1Lv1ylfmE8ifpJDfJjk4hC
	dt9owm371a/q8DoEXqAJi2YvNMozHA0tNALmqI3Uae/S1UANJuWOP3Oxawrn5/yk0BSoW9LMlES1e
	vt8J7XljmhD+N4zhs4tEUkNnazrvST2Ts58MdxdShwYrn6YnXT4zS1OUEcoVHhVhEsHUDHEqYyytD
	ge8CJCqN/Z3vNSjTCpva8V9P/QzkWF8tpBTFdD4Q4PXpaU/6bUJ8rY2sY6zqpX1ht9r0G+qXYoda/
	HgbD407g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOfd-0000000AoV0-3B32;
	Tue, 18 Nov 2025 16:35:09 +0000
Date: Tue, 18 Nov 2025 16:35:09 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: brauner@kernel.org, jack@suse.cz,
	syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com,
	frank.li@vivo.com, glaubitz@physik.fu-berlin.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	slava@dubeyko.com, syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] fs/super: fix memory leak of s_fs_info on
 setup_bdev_super failure
Message-ID: <20251118163509.GE2441659@ZenIV>
References: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
 <20251118145957.GD2441659@ZenIV>
 <6c482108-78b8-4e09-814a-67820a5c021e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c482108-78b8-4e09-814a-67820a5c021e@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Nov 18, 2025 at 05:21:59PM +0100, Mehdi Ben Hadj Khelifa wrote:

> > Almost certainly bogus; quite a few fill_super() callbacks seriously count
> > upon "->kill_sb() will take care care of cleanup if we return an error".
> 
> So should I then free the allocated s_fs_info in the kill_block_super
> instead and check for the null pointer in put_fs_context to not execute
> kfree in subsequent call to hfs_free_fc()?

Huh?  How the hell would kill_block_super() know what to do with ->s_fs_info
for that particular fs type?  kill_block_super() is a convenience helper,
no more than that...

> Because the error generated in setup_bdev_super() when returned to
> do_new_mount() (after a lot of error propagation) it doesn't get handled:	
> 	if (!err)
> 		err = do_new_mount_fc(fc, path, mnt_flags);
> 	put_fs_context(fc);
> 	return err;

Would be hard to handle something that is already gone, wouldn't it?
deactivate_locked_super() after the fill_super() failure is where
the superblock is destroyed - nothing past that point could possibly
be of any use.

I would still like the details on the problem you are seeing.

Normal operation (for filesystems that preallocate ->s_fs_info and hang
it off fc) goes like this:

	* fc->s_fs_info is allocated in ->init_fs_context()
	* it is modified (possibly) in ->parse_param()
	* eventually ->get_tree() is called and at some point it
asks for superblock by calling sget_fc().  It may fail (in which
case fc->s_fs_info stays where it is), if may return a preexisting
superblock (ditto) *OR* it may create and return a new superblock.
In that case fc->s_fs_info is no more - it's been moved over to
sb->s_fs_info.  NULL is left behind.  From that point on the
responsibility for that sucker is with the filesystem; nothing in
VFS has any idea where to find it.

Again, there is no such thing as transferring it back to fc - once
fill_super() has been called, there might be any number of additional
things that need to be undone.

For HFS I would expect that hfs_fill_super() would call hfs_mdb_put(sb)
on all failures and have it called from subsequent ->put_super() if
we succeed and later unmount the filesystem.  That seems to be where
->s_fs_info is taken out of superblock and freed.

What do you observe getting leaked and in which case does that happen?


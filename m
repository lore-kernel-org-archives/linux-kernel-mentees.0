Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030F2C1587
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156509; cv=none; b=S6aWcXhnykLSUA7hTODpqUlzUaX3ZiLaICOsk38hD5KcC8mK92hkyrQrtmYOgF2GVtxEVxd72Iouv/Pqd4IVgESHETHL49ySUNEhJMOX+9+9iwbeMENTlEM6pxYghQf/jqmjvFglDOVYGsnpPg3SLeXgw6oBGddquziFWuuD3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156509; c=relaxed/simple;
	bh=UqDUQ6OyyJRLzVQX1Z9hQqRiS2RYJgv3h4EjNJTt7us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQA1d4v2G/YeMcqJ76mnPrRRa7sxljACEp5T4NLxmn0GjBn1mWrKUxl5micXXT32Hj39P15U+XC209xd7bdrjkq/REzi2vgPFMlnEtGHoXAD8pky63aQpoQYGKcWzeVgy2wwmTE5C+mMSJRtdwuLVix46VYtcMVCLllMaSwbnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJkzWC3c; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJkzWC3c"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF3F40105
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 07:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDLrSWGPq8K2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Nov 2025 07:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E36A1400C7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E36A1400C7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJkzWC3c
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E36A1400C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  3 Nov 2025 07:55:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429bccca1e8so1637566f8f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 02 Nov 2025 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762156504; x=1762761304; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=;
        b=aJkzWC3c8RBE+jleLoK5MIQtNNcS1wSO4A9Zu3Lrlnv/kQ+vkpseKOI3HDPTUf3gBd
         QIYgpnbStz6DLUxaoiLHaxeS75v2gEu5m4WHvGSg5adWfVbuKCMF2VNVjY51WcHXu7zi
         y8szncgFC6FkFZ1ZkwOJwkbbD76gzGaPrL+iH7GLbukau+OOhG1vjfBKX/ha1YG3U+Yb
         2As5YQnGphrUvqtzi9NOA01UReOjzZrmyRmlJTjPWLSueBp7llHuA9S4SIEUfqfxqVDt
         7vfKLokXGRNpA+n/yvN3chkPwhCAuK8LVK76S2mCYo0S9H8WBFw53RTjsy3LTxfJqN8V
         OjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156504; x=1762761304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QX9EpicK1kmDyEDBsOzwExi+YjHk71IsQgHccPkCOpk=;
        b=vNLQGchl7nOU7JhS284xvbIHhGcEhJno0WGvOaKgtI7NShm2eAeBTue/AQBNxnYDxZ
         Wz08zc1op51a36/JE6/G8a68o+JVNyIxShnyO3iur0dU/Mq/ZKaTOTyWo64DMUh7ChMZ
         BNhTS75oGZMWaZK2Bdla9HbGZqFd44dcLhVFkQ0O9ZOg6rHoXcrbtxfFvvqCP7dgj9AM
         SzCjyRft9iL8bowpE5KMjCIDh2i3N3DgQiieuCl7EwCmjAPHnEdzvZ4UPDXJjRiDqEKx
         wmxLuL0E93RMhN+O2N4s33cSs3tTlXgLdt9HnpNoCTIqK0wKxt43N3ZeK5xaJisw9+J/
         c2jg==
X-Forwarded-Encrypted: i=1; AJvYcCW5A+d8OVVPLciA5nLaYJFC8ztTijs/+ZkugvVY7lz9BcFUJuc+J2dtdxuTX33v/upL0qACEX1D2IxKmmi11yPOeRLkdA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzpA2zUFiG585GpgzLk9WiEpfxfLZK3nJk4Bf7m08MTaewYTk82
	/ccJjiMbG2xn6NTbvnjUdhfSu5DhUNkuA3Zve2vElqBXjA4Ni/zvJUx7
X-Gm-Gg: ASbGncuD49C+F13ZyP037CC/IX4lc11B391MuDIVv5kP9Vq4vwHmHFJzTWmie6xBzk3
	mBkCgQoKCVD6GfNv5ge3RMkHgHYTwjjrgeMtD6R7jGMvUremILvVXy34AQzKB6C/ZZeYrrZ6lYq
	Piozz3L6w/qqSPzLd42+zzNoDh3Q+NNob5WBJyVU/mikGuKboJL4KFEIRM7QtljA+3wRxMBLvmU
	poQJt7xn7ycYU+gmzNN1z1VHHLuY16lcR91mdnM6SZD91QGsH2YlCi/eNWFLKXNPVLbo3qY5RSe
	MOP4PovpBovWc3zlSLgaY+S+X2TWyyYkalNFzCZlMH7UM+AxMmp3MP4lS4iAmUwJkmds5ag6l4w
	7o8oKnjOtOOURHGg/LFqUTNxFgWZljbRbxkjZVpQ6SOdceJb69RFbK5tE7zB2WuFINGOawdWGLB
	6h0C7BVVnv2lkP6VPAUjQF9w==
X-Google-Smtp-Source: AGHT+IFyHdL5vinzqBP7jHakygrAZQoPQph4ogdXR370JssBAjuF23hFYbiA6u4HtF1rj6X+jdGEDA==
X-Received: by 2002:a5d:5d02:0:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429bd6a8f88mr9630526f8f.47.1762156503565;
        Sun, 02 Nov 2025 23:55:03 -0800 (PST)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1405fffsm18688238f8f.45.2025.11.02.23.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:55:03 -0800 (PST)
Date: Mon, 3 Nov 2025 09:55:01 +0200
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org, 
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH v2 2/2] f2fs: Add sanity checks before unlinking and
 loading inodes
Message-ID: <pcxf66ac2yjkqyvhb6xgbk6jiihcejuncgbblkewz6rs7i5uzt@m6yjin7t67is>
References: <cover.1761993022.git.zlatistiv@gmail.com>
 <55522ef8f3424e563ff18a720c709dcb065091af.1761993022.git.zlatistiv@gmail.com>
 <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea38e464-a28a-4b06-8046-5b62f7172875@kernel.org>

On Mon, Nov 03, 2025 at 10:35:17AM +0800, Chao Yu wrote:
> On 11/1/25 20:56, Nikola Z. Ivanov wrote:
> > Add check for inode->i_nlink == 1 for directories during unlink,
> > as their value is decremented twice, which can trigger a warning in
> > drop_nlink. In such case mark the filesystem as corrupted and return
> > from the function call with the relevant failure return value.
> > 
> > Additionally add the 2 checks for i_nlink == 0 and i_nlink == 1 in
> > sanity_check_inode in order to detect on-disk corruption early.
> > 
> > Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> > Tested-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> > Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > ---
> >  fs/f2fs/inode.c | 10 ++++++++++
> >  fs/f2fs/namei.c | 15 +++++++++++----
> >  2 files changed, 21 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 8c4eafe9ffac..089cbf3646f0 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -294,6 +294,16 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
> >  		return false;
> >  	}
> >  
> > +	if (unlikely(inode->i_nlink == 0)) {
> 
> This is a possible case, as an orphan inode may exist in filesystem after sudden
> power-cut.
> 
> Thanks,
> 

Hi Chao,

Do you suggest that it should not be wrapped in unlikely()?

I also now realise that I intended to wrap the "else if" case
as well but I've missed it in the final patch.

Should I resend the patch with both cases wrapped in "unlikely()"
or would you suggest otherwise?


> > +		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> > +			  __func__, inode->i_ino);
> > +		return false;
> > +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		return false;
> > +	}
> > +
> >  	if (f2fs_has_extra_attr(inode)) {
> >  		if (!f2fs_sb_has_extra_attr(sbi)) {
> >  			f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
> > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > index 40cf80fd9d9a..d13077bad482 100644
> > --- a/fs/f2fs/namei.c
> > +++ b/fs/f2fs/namei.c
> > @@ -572,10 +572,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >  	if (unlikely(inode->i_nlink == 0)) {
> >  		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >  			  __func__, inode->i_ino);
> > -		err = -EFSCORRUPTED;
> > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > -		f2fs_folio_put(folio, false);
> > -		goto out;
> > +		goto corrupted;
> > +	} else if (S_ISDIR(inode->i_mode) && inode->i_nlink == 1) {
> > +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> > +			  __func__, inode->i_ino);
> > +		goto corrupted;
> >  	}
> >  
> >  	f2fs_balance_fs(sbi, true);
> > @@ -601,6 +602,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >  
> >  	if (IS_DIRSYNC(dir))
> >  		f2fs_sync_fs(sbi->sb, 1);
> > +
> > +	goto out;
> > +corrupted:
> > +	err = -EFSCORRUPTED;
> > +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> > +	f2fs_folio_put(folio, false);
> >  out:
> >  	trace_f2fs_unlink_exit(inode, err);
> >  	return err;
> 

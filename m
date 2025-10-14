Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37165313295
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444232; cv=none; b=TDPVpZycwhDcRP/H7n/bXu8DJpqjfUkgBpyggbi5BiNGMe80f+vJNzVwn3nm61fiyxuBIRsOrhb3viXw13+8d9boXrxXAr3GcKQuu1SHgUQeKRE86O9FBy7KNNuoj0tyxyeq+m2zzD0hgcJgifLK4QR0uL7SohIgkRTgOOSPW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444232; c=relaxed/simple;
	bh=BY6kYeuxEDPJ3ppq84ztaniIfEKi29/fuURVA/vSOH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYICjhwMUITIFv+lBSF0pMQEkWg8cjaYR674JEWPfkGRPYYjOFVxQZq8hpGwaXAonDkmxFkv9i74HhAMHTklauGj6Z53IpALvdpEPTrHBlvvV3HumZ8KHI3ZglLca+dFZQwfgk1I375Dd9o6+0EjC99ITNh7ComGPLmbjuhB5k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1nHWA3n; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1nHWA3n"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC3640FF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 12:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rUWZAghyEKx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Oct 2025 12:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F6D440FE3
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F6D440FE3
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A1nHWA3n
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7F6D440FE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 12:17:09 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3e44f22f15so757569766b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760444227; x=1761049027; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=;
        b=A1nHWA3n7rigiK5hA80+PW2z17GlprrAfY4m9DePuggEk+jr/DthdyRC+VWk0drzd/
         xSkHE7gh4YwI2lCNw95pBlR87UakP/jHCsanM91Fm+f6KcI7WK2179v3m9hTydKZJ6R4
         nYbIOIRpqAAlO8TVHJkjMPy5JTEUWyGutUWmaT4wMWlrC8nQoakVBBhTpLmm7TuPWq6B
         qmjOBEDhsvP9J6q7F38L8mN7bKxqTKsSqcOCnoojvHcO433E0uHO50X0Oymdp4CC++zw
         hj3hwffKpgI8TJJi+mQuDlVpetBRqHgXLhBV7KAYUJv169aWuuAORMu9NoAka2Baf42t
         FnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760444227; x=1761049027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m82o4ruRC1Nh+bc2kFllbJdMYTanRIhkJao7LX8GaG0=;
        b=hXd13Ceavr8pymZtEnfvE8kaBvQfuMnQBacCJRNUcTHM5sizRS1Fmb6oLtR00NZ84e
         XeCbc4d2eAKAsxpXqmQrd2FHH3UbOAfSDzAJkEbNl/YZOTwmMKLma03Ttb0enO2spnUN
         NSDlnxp9X/1GdXoMTlwpIQZGQB2huqR0YwGzruL/pxmXHZLel5b5PM7XRrMEEqzM7AD+
         AJ8J0yoqRyPsPzi0kW+ntPj73Gs6Hyfa75xRWGDDx/IUlDkKi3JAC3a4tVe3cCOD2FhG
         8R4ROZL3dM+toVsmq0BZLUY7SIjSXOjAOTeQfKdREbIeUuazMxD86aZO/OtOP9XSNADD
         gWpw==
X-Forwarded-Encrypted: i=1; AJvYcCVOEadLQuQUeoaWRzOOjA2fo8dj16oV73L7KicroYZtvaEyyzeqgNHUFUYPT10me7DVETZ3Yb52anz0J+uh9Qw3Bz5zBw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YweZofGc6hYs18VMSMa4ntKC01wijnkdE8dXKJDgPVsVxqeCHE4
	9BglBicHxQevs2FZ6HpRyUp91nfpz3n3WRx3TVeBs3K/VijbraJETyno
X-Gm-Gg: ASbGncvxNYvyKN59QRv5TJhqmOtfk6Os4wT9l6Lq0mMOtNgDhscoAv06gj+MMGWktir
	7xUPxr+dpReKKckymEkxlDZCR0H/2YRaIEXULOtNUYI0lSm2PYGt+Pdc4DND4GXb7ePHuGd7YiT
	DW/psS3G9GK8nrT3vyY7D9cglyDBEjqEGPEfjiuwVHfyPmtIFXdBgd6J2bVP/Tgb9gV7sRNpGTt
	EMh4DfQdTDg05ThhResXYmFsquzyaRoiGW3jfAeSqSVbUgqzQGmbYpfaVB6+NmlMNKRztNkPlfO
	ktrE1vzBwQPxk+gH0aslElKrq/Uc2WA5mCJsFDfOiumo3FKg05ZQhZW0jv1I377jLfc/spoVWLn
	aiG1XwYXOlYUeY6rLJSk4FvD9Sru1mmf5gAkjraLFmNyD3pPmaz1iCASwtEKG3feoI7GwQHLVZP
	PZ4OjB0857
X-Google-Smtp-Source: AGHT+IGq27w45QLYd+XODJVVnusgATVtS0zDzQLIBAdrmNxLtWSM1Llh13WXNkkw6lvcW1Z8zM/+Pg==
X-Received: by 2002:a17:907:3e22:b0:b3e:b226:5bad with SMTP id a640c23a62f3a-b50a9a6d8a3mr2542115566b.8.1760444227255;
        Tue, 14 Oct 2025 05:17:07 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c129fasm1159133366b.43.2025.10.14.05.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:17:06 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:17:04 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org, 
	syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: Perform sanity check before unlinking directory
 inode
Message-ID: <zomib7dzvmnggqqy6aqlwij3zihbvzkzrnfvzhk7tcp2mdgh34@tjjugevo4q4a>
References: <20251003134731.470392-1-zlatistiv@gmail.com>
 <839306c1-5f7a-4e89-b2cf-7534d279a03c@kernel.org>
 <gupgic53ouhmdwrglwdviw2mzeaqfjsvyr47u3ebu2ztayswy4@4oxvnu252rdb>
 <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d0fef9d-4093-4a80-af3f-6dc45ffe886c@kernel.org>

On Mon, Oct 13, 2025 at 08:53:04PM +0800, Chao Yu wrote:
> On 10/13/25 05:19, Nikola Z. Ivanov wrote:
> > On Thu, Oct 09, 2025 at 10:54:40AM +0800, Chao Yu wrote:
> >> On 10/3/2025 9:47 PM, Nikola Z. Ivanov wrote:
> >>> Current i_nlink corruption check does not take into account
> >>> directory inodes which have one additional i_nlink for their "." entry.
> >>>
> >>> Add additional check and a common corruption path.
> >>>
> >>> Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com
> >>> Closes: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
> >>> Fixes: 81edb983b3f5 ("f2fs: add check for deleted inode")
> >>> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> >>> ---
> >>>   fs/f2fs/namei.c | 28 ++++++++++++++++++++--------
> >>>   1 file changed, 20 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> >>> index b882771e4699..68b33e8089b0 100644
> >>> --- a/fs/f2fs/namei.c
> >>> +++ b/fs/f2fs/namei.c
> >>> @@ -502,12 +502,14 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>   		goto out;
> >>>   	}
> >>> -	if (inode->i_nlink == 0) {
> >>> +	if (unlikely(inode->i_nlink == 0)) {
> >>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>   			  __func__, inode->i_ino);
> >>> -		err = -EFSCORRUPTED;
> >>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> -		goto out_iput;
> >>> +		goto corrupted;
> >>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>> +			  __func__, inode->i_ino);
> >>> +		goto corrupted;
> >>
> >> Can we detect such corruption in sanity_check_inode() as well? So that if
> >> f2fs internal flow calls f2fs_iget() on corrupted inode, we can set SBI_NEED_FSCK
> >> flag and then triggering fsck repairment later.
> >>
> >> Thanks,
> >>
> >>>   	}
> >>>   	if (IS_ENCRYPTED(dir) &&
> >>> @@ -533,6 +535,9 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
> >>>   	trace_f2fs_lookup_end(dir, !IS_ERR_OR_NULL(new) ? new : dentry,
> >>>   				ino, IS_ERR(new) ? PTR_ERR(new) : err);
> >>>   	return new;
> >>> +corrupted:
> >>> +	err = -EFSCORRUPTED;
> >>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>>   out_iput:
> >>>   	iput(inode);
> >>>   out:
> >>> @@ -572,10 +577,11 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>   	if (unlikely(inode->i_nlink == 0)) {
> >>>   		f2fs_warn(F2FS_I_SB(inode), "%s: inode (ino=%lx) has zero i_nlink",
> >>>   			  __func__, inode->i_ino);
> >>> -		err = -EFSCORRUPTED;
> >>> -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> -		f2fs_folio_put(folio, false);
> >>> -		goto fail;
> >>> +		goto corrupted;
> >>> +	} else if (unlikely(S_ISDIR(inode->i_mode) && inode->i_nlink == 1)) {
> >>> +		f2fs_warn(F2FS_I_SB(inode), "%s: directory inode (ino=%lx) has a single i_nlink",
> >>> +			  __func__, inode->i_ino);
> >>> +		goto corrupted;
> >>>   	}
> >>>   	f2fs_balance_fs(sbi, true);
> >>> @@ -601,6 +607,12 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
> >>>   	if (IS_DIRSYNC(dir))
> >>>   		f2fs_sync_fs(sbi->sb, 1);
> >>> +
> >>> +	goto fail;
> >>> +corrupted:
> >>> +	err = -EFSCORRUPTED;
> >>> +	set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
> >>> +	f2fs_folio_put(folio, false);
> >>>   fail:
> >>>   	trace_f2fs_unlink_exit(inode, err);
> >>>   	return err;
> >>
> > 
> > Hi Chao,
> > 
> > Thank you for the suggestion.
> > I will add this to sanity_check_inode and remove it
> > from f2fs_lookup as it becomes redundant since f2fs_lookup
> > obtains the inode through f2fs_iget. For f2fs_unlink I will
> > move the i_nlink == 1 check to f2fs_rmdir.
> 
> Hi Nikola,
> 
> I meant we can move the i_nlink == 1 check from both f2fs_lookup() and
> f2fs_unlink() to sanity_check_inode(), because before we create in-memory
> inode, we will always call sanity_check_inode().
> 
> Let me know if you have other concerns.
> 
> Thanks,
> 

The issue here is that sanity_check_inode will be called only when 
we initially read the inode off disk, not when it's already in the cache

The syzkaller repro does something like this:
Creates a directory structure /dir1/dir2 where dir1 has
i_nlink == 2, which is one less than it should. It then does
rmdir(/dir1/dir2) followed by rmdir(/dir1) which leads to the warning.

In such case what would you say should happen, should the second rmdir
fail and report the corruption, or do we close our eyes and just drop
i_nlink to 0 and possibly log a message that something isn't quite right?

Thank you,

> > 
> > I will send v2 as soon as I do some more testing.
> 

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DC34AAE6
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Dec 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074084; cv=none; b=DShvPXiKy8YOFU6mMk0LtBcvSL9UNVjuLWQhZvrz7oiiT5us0mAN5q76MVw1qHBe38yKqgoV+Px4oTFxrdYGmam7Gst5rgCqBQekCiQ0prMZAvkkNOTFjZ5KPLHrR/x2oAfTlkNz+8OQ9kYrBLRPBDWEE2Ubd5PsaVvrCUqmWvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074084; c=relaxed/simple;
	bh=9fY3A5b4zET37FjxItWEHTv8ADHy/IGZ3gVaaXcN4G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtO483OBjBKa4Sfizx+GPoowGnruSIlIjjTGwizdLx5MMfldc2Ix71g8e7NOLvKZXcrV5GJrcSBRnOPzWk6Wx21iUTGfJlDAUyy8kfpwS4cq5QJ/A9Qw2H0uFwANGjdATVwjGFfKS2Iiu7RX2QfA5bsz4FqFbupvsGpZikcBoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JwxxfNOA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JwxxfNOA"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f38c7d4eso46482f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Dec 2025 08:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766074080; x=1766678880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll5fg56zYYiWFQstkxfa8620KqOD1ctc79MVD69plr0=;
        b=JwxxfNOAgAT+1mJkqzeDRqzEjZCmtNbjc4VMVXomYna9KDk7xJbJGlYFzXJG9AFazf
         ts8leoYvye+ijin7Y8k4sCrxpGQyne9CVWHfl2tdZ78nOUVsvqivKYaaxnqc6gk/5fbe
         IAC0ZVQdGVViWmsvfx0M6B/+nFrYj+Ur0k5WMEXGAm4noPNdAOLEzDXFbdX6pFqYXrDq
         4EINkl2K5t4RbER+DK7p9xOLrS/aZXOJLjFVs3BOQDJlYznaEBD04Rpp2nm2lE0LMCKO
         EBnMBAQhAnXbB0zJhGH4n+ziS3cpeS9unTIQXrwyeVAadBTrM/T38uFI5cnZRfenyj2W
         dRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074080; x=1766678880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll5fg56zYYiWFQstkxfa8620KqOD1ctc79MVD69plr0=;
        b=T9yLlY755IO1As5cqnFubgKtpknWlUvM5G0NehHTTGWUrCLIHUnVEkE6S4EVqY7FnZ
         XgmLHcDQmRud9YY8+5bfdpVd6PI6KCVPt6jrcZ/hARaKNw3tQFTqB6K9AbtaCOhWTOOf
         jjSu6Dq2txcWim/dWqeol35ktvs+mEMaOGgm+GfA11VetXT2dOCMcABDsXOWyJ+a988P
         sD5HRCk8DRAo/16rpVKHZK1Tqcvv8PRAAVETKV2ghiefRmGZU5YocmMflDns1EzvUEC6
         r2wShir1C/71wCKf46/niSgGtP1Hj6GAwh+k7juxYkOiILwGDzQgpHfzDduoYRmdVTQO
         o0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw1QH01oAEK0vjOk74LZPEmflrjxssQ/d2WOR4uKMkSvz+G0I+gx6jolXvW8Bo4bDslrB8j4yHZ0Zp4DcYz2huGKyiqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwypK4ky0+WrvAdL223weMAxIQuYiWr36jDC0PVAcObflEmDrwr
	SUOSYMwUCqILQWXzxsbGcN43ukyCGXk0EhUXIQ4wpwtC+mt6e+87rRjuN66FLWola04=
X-Gm-Gg: AY/fxX4rk0GlrbT+m20PK3G6EizD6GzHHG2yv9vYgaOJsbln2Q4wkZBjvEMfR7bE8pI
	A27BpIgeZ+7XhyLtWnIakuEJkEEVNSjykdAZWZUJVYT9ds4DDhKmYI8MF7hboTgKU5QmHlOLG30
	/whwIf1yBrqf2b3wwIcTFboBMDOLRLJXres9r1NhdvGmTIMY2cwQoicXKFBLZnOSOarBuaGPyS0
	s9jXO+ipVmInFGgYLPi66jPrvFMsNFOJaNImhtijYqcK3qtAavpNL2M4OHChwEtUCJIpMzyusHx
	e89mGSGkyXaIzGSFAKLXUGYQNIkcarkCZu8TtTJ+iY7/z0vYVdikpyjgmRSflRTbMO9blg64SJK
	22LyYVfneP+myDRpCTjoFlEk8r9BEQ5Q2MuUWw851Diuja/Tl2L0jrsQD7s0F+cGZGl8NchcYYj
	kotI3v2MbXNg==
X-Google-Smtp-Source: AGHT+IFfChPcdXBQmW4OnfiET0IribR1F0Ir/X6rOlOywgz8dsCin5NgK+sVVKYU+DaOhPJ/6fhXmg==
X-Received: by 2002:a05:600c:4ed2:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-47be3cffd6amr17869585e9.7.1766074080318;
        Thu, 18 Dec 2025 08:08:00 -0800 (PST)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d2fa20a22sm2673669a12.20.2025.12.18.08.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:07:59 -0800 (PST)
Date: Fri, 19 Dec 2025 00:07:56 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH] ocfs2: handle OCFS2_SUPER_BLOCK_FL flag in system dinode
Message-ID: <njikmwfpnsdzalxump7dj7wnlvkwfmvuqwxhpwzly45v7ioj5l@yckvd3veaifi>
References: <20251216200544.4114-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216200544.4114-1-activprithvi@gmail.com>

On Wed, Dec 17, 2025 at 01:35:44AM +0530, Prithvi Tambewagh wrote:
> When ocfs2_populate_inode() is called during mount process, if the flag
> OCFS2_SUPER_BLOCK_FL is set in on-disk system dinode, then BUG() is
> triggered, causing kernel to panic. This is indicative of metadata
> corruption.
> 
> This is fixed by calling ocfs2_error() to print the error log and the
> corresponding inode is marked as 'bad', so that it is not used further
> during the mount process. It is ensured that the fact of that inode being
> bad is propagated to caller ocfs2_populate_inode() i.e.
> ocfs2_read_locked_inode() using is_bad_inode() and further behind along
> the call trace as well.
> 
> Reported-by: syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=779d072a1067a8b1a917
> Tested-by: syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  fs/ocfs2/inode.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> index 12e5d1f73325..f439dc801845 100644
> --- a/fs/ocfs2/inode.c
> +++ b/fs/ocfs2/inode.c
> @@ -347,7 +347,12 @@ void ocfs2_populate_inode(struct inode *inode, struct ocfs2_dinode *fe,
>  	} else if (fe->i_flags & cpu_to_le32(OCFS2_SUPER_BLOCK_FL)) {
>  		/* we can't actually hit this as read_inode can't
>  		 * handle superblocks today ;-) */
> -		BUG();
> +		ocfs2_error(sb,
> +			    "System Inode %llu has "
> +			    "OCFS2_SUPER_BLOCK_FL set",
> +			    (unsigned long long)le64_to_cpu(fe->i_blkno));
> +		make_bad_inode(inode);
> +		return;
>  	}
>  
>  	switch (inode->i_mode & S_IFMT) {
> @@ -555,6 +560,11 @@ static int ocfs2_read_locked_inode(struct inode *inode,
>  
>  	ocfs2_populate_inode(inode, fe, 0);
>  
> +	if (is_bad_inode(inode)) {
> +		status = -EIO;
> +		goto bail;
> +	}
> +
>  	BUG_ON(args->fi_blkno != le64_to_cpu(fe->i_blkno));
>  
>  	if (buffer_dirty(bh) && !buffer_jbd(bh)) {
> @@ -576,7 +586,7 @@ static int ocfs2_read_locked_inode(struct inode *inode,
>  	if (can_lock)
>  		ocfs2_inode_unlock(inode, lock_level);
>  
> -	if (status < 0)
> +	if (status < 0 && !is_bad_inode(inode))
>  		make_bad_inode(inode);
>  
>  	brelse(bh);
> 
> base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
> -- 
> 2.43.0
> 
> 

ocfs2_populate_inode has two callers: __ocfs2_mknod_locked() and
ocfs2_read_locked_inode()

Your code only works for the ocfs2_read_locked_inode() path, but not for the
__ocfs2_mknod_locked() path.
In __ocfs2_mknod_locked(), there are two tasks after ocfs2_populate_inode:
"creating locks" and "updating the transaction". If you use a 'goto' to bypass
these two tasks, ocfs2 will crash in the near future. Conversely, if you choose
to execute the two jobs, the logic is flawed because we perform on a bad inode.

In my view, the existing code (using BUG()) is acceptable. We don't need to
worry about this syzbot report.

Thanks,
Heming

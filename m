Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F518DB2A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Dec 2025 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124992; cv=none; b=mjmClaL/SmSOPYAAqgqB8YbsYYEjPdUVHfkhY6WHNdsfZ9U3givUEFSljz2H3pKcTVql1cMGDPS4ni12Ay+YQUwX+cRYw5ttMdGIBVzdYqd9CcEPbTTIznn0EBPpFkM1ox+arV6i7F0ERWbEjxxrPbr7YDV+JbHZYfGM6ItebJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124992; c=relaxed/simple;
	bh=OnrIFQUB4ExlEwB1YTATumAbARUFTj28yPXWy8+zlWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbnP8JFt2FV6/s1EUnQBp6DyePil9by8mWdOwku5LtAiN4L7EsXT/odENXWT9vRFzn0CvKhKXNQkqCv4Gg+EP9fT5doISHS89BBq4G1lPgMUANeQgEJHgXvI+SePtrRobn5HTx9LPw4XL71VknA5H/gZjzJxrGTMrBJSPWLtIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vgzby01G; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vgzby01G"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7e2762ad850so1576353b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 18 Dec 2025 22:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766124989; x=1766729789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHzT4fbzJhXllsJLzXfqINlUIg8kKKYMhv+QaXph3dI=;
        b=Vgzby01GR0WRsv9gGGYKHu9ExAZSSSDihc0HNRe8uE706MJlPv0sC11aaVYqtNgWM/
         FSNISOzNDjTWkfh95Us4r3y5jkhwwnxwR1bZBH4HpOP8KTdJnNElDONRiCE1thSX1wSk
         NwCvVkfLNMH+2txYcO2N2vy/MzLudLLF03DmsllC+0y/hQLmPUOEtVv2nxN2waAJ7+/c
         iIlHxT5Hzm7jOSfs7YCiceGV7wQ7sP7ufaIm1aFaOCzrzEktZu99RpgMmmBJIYtUsPox
         HgKwX+DgYVhDoTAWEyt2qG5lERoBbC1fPIgamHni9dnCyWOSjzEmFPNwaJCGje2y/zHM
         1nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766124989; x=1766729789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHzT4fbzJhXllsJLzXfqINlUIg8kKKYMhv+QaXph3dI=;
        b=T9DB9+QXun2inQ3A5SSrusfysfYOWJwrg5wAa2LRo2nLTQYBihqP1Kd+YdW2bqiXk+
         bZ2R/TL+RnzKHQr+Hcr9/mtXoi5rLB960Nqi/LFv0auB0+jTsscAag+PAgVsUEg0DFE6
         6qGiZC3X8uZ3TZmvQA1hK66c4yOO/mSL2HWZ8gqKw/+fKi0HSIM68E0zucmyNWL7e4bP
         5MP225baoROLlDONpYkeKzjVKeuHBP4BOxDV3UYThiRUqKTeSOOqXtbQ3ZM1veerQLYy
         lDbO7EDVs5C9cicXfACOMzCybVPdPRnAZlQS8dPg2W0QteQhxEcyDtDWwfsC//W5J35M
         gUOw==
X-Forwarded-Encrypted: i=1; AJvYcCV32QxcDH/aqsitiq8bHdrY2FW0hLBGCfiU4p86vxMPDzleRP69EmkMI/iEmjSDrKAaPqPJpRXLcN/Dg2db4blPG/zrWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQAtV8m3x+G0jQxR0VpeRKkDtMyNcVRj4eNPiy2TF0bNNXRA61
	mgA6y0IZLks/0enA6Dcx+04ffWQIiqVFnhSQh2071W9IZHVsIpMmkDsv
X-Gm-Gg: AY/fxX7NHxkQyJwGD3NKo+WWh/jxuZR/HtZmCkV9Ie6AMj/yRRKWHwB/FH1ZY94jl9g
	p/MwwVsKDRVfEzDY6DxaOMzONNQA/njjrwgPCPk8MmDKdgdDXv5mcsAAjbi9MYPvHkppQpdhOL2
	I8hf/sWMqYlsTkRwpCpCK6bDlSnk69S0jvp2wA0mzMHoVNoDMZPq3mR0NQBuo+Ok3S3qbGgo0di
	NiOJZv73kohsFViPPWY6L+LGKLOelT1KPxZ2OJY7Zu7ArLWqseTMpkcCpx1Flwff2+OZfXGoA01
	/GTCEuhJaeqxFnX6oFYkHSNMCVBpK30RV5HSb36LNOnMh+o2f9TkOqsgpskN1xhFkysVKQvqR1E
	Jm3qmwakHbprv7HocfMfnV7c6Kn0RSAyav5XAfX6l6CVi6oe+wKSQwBHmx+oNZcPX+RIYtONyvq
	Qr5XcdmnwticWQ
X-Google-Smtp-Source: AGHT+IGm+pTFWYSXcQQMWOucEyKVmnCmUebgq+Il8Pibic3B3tOz9LPo6oilZYuoVTiA/YryeB412w==
X-Received: by 2002:a05:6a00:a90e:b0:7a5:396d:76be with SMTP id d2e1a72fcca58-7ff64ad9e96mr1731687b3a.27.1766124988927;
        Thu, 18 Dec 2025 22:16:28 -0800 (PST)
Received: from prithvi-HP ([103.47.105.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a84368dsm1229348b3a.2.2025.12.18.22.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:16:28 -0800 (PST)
Date: Fri, 19 Dec 2025 11:46:21 +0530
From: Prithvi <activprithvi@gmail.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH] ocfs2: handle OCFS2_SUPER_BLOCK_FL flag in system dinode
Message-ID: <l6ksp2hk72pzciidqnzjmaupocngobj6e44exuko565jtrepwn@f7f42tby5oov>
References: <20251216200544.4114-1-activprithvi@gmail.com>
 <njikmwfpnsdzalxump7dj7wnlvkwfmvuqwxhpwzly45v7ioj5l@yckvd3veaifi>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <njikmwfpnsdzalxump7dj7wnlvkwfmvuqwxhpwzly45v7ioj5l@yckvd3veaifi>

On Fri, Dec 19, 2025 at 12:07:56AM +0800, Heming Zhao wrote:
> On Wed, Dec 17, 2025 at 01:35:44AM +0530, Prithvi Tambewagh wrote:
> > When ocfs2_populate_inode() is called during mount process, if the flag
> > OCFS2_SUPER_BLOCK_FL is set in on-disk system dinode, then BUG() is
> > triggered, causing kernel to panic. This is indicative of metadata
> > corruption.
> > 
> > This is fixed by calling ocfs2_error() to print the error log and the
> > corresponding inode is marked as 'bad', so that it is not used further
> > during the mount process. It is ensured that the fact of that inode being
> > bad is propagated to caller ocfs2_populate_inode() i.e.
> > ocfs2_read_locked_inode() using is_bad_inode() and further behind along
> > the call trace as well.
> > 
> > Reported-by: syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=779d072a1067a8b1a917
> > Tested-by: syzbot+779d072a1067a8b1a917@syzkaller.appspotmail.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> > ---
> >  fs/ocfs2/inode.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> > index 12e5d1f73325..f439dc801845 100644
> > --- a/fs/ocfs2/inode.c
> > +++ b/fs/ocfs2/inode.c
> > @@ -347,7 +347,12 @@ void ocfs2_populate_inode(struct inode *inode, struct ocfs2_dinode *fe,
> >  	} else if (fe->i_flags & cpu_to_le32(OCFS2_SUPER_BLOCK_FL)) {
> >  		/* we can't actually hit this as read_inode can't
> >  		 * handle superblocks today ;-) */
> > -		BUG();
> > +		ocfs2_error(sb,
> > +			    "System Inode %llu has "
> > +			    "OCFS2_SUPER_BLOCK_FL set",
> > +			    (unsigned long long)le64_to_cpu(fe->i_blkno));
> > +		make_bad_inode(inode);
> > +		return;
> >  	}
> >  
> >  	switch (inode->i_mode & S_IFMT) {
> > @@ -555,6 +560,11 @@ static int ocfs2_read_locked_inode(struct inode *inode,
> >  
> >  	ocfs2_populate_inode(inode, fe, 0);
> >  
> > +	if (is_bad_inode(inode)) {
> > +		status = -EIO;
> > +		goto bail;
> > +	}
> > +
> >  	BUG_ON(args->fi_blkno != le64_to_cpu(fe->i_blkno));
> >  
> >  	if (buffer_dirty(bh) && !buffer_jbd(bh)) {
> > @@ -576,7 +586,7 @@ static int ocfs2_read_locked_inode(struct inode *inode,
> >  	if (can_lock)
> >  		ocfs2_inode_unlock(inode, lock_level);
> >  
> > -	if (status < 0)
> > +	if (status < 0 && !is_bad_inode(inode))
> >  		make_bad_inode(inode);
> >  
> >  	brelse(bh);
> > 
> > base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
> > -- 
> > 2.43.0
> > 
> > 
> 
> ocfs2_populate_inode has two callers: __ocfs2_mknod_locked() and
> ocfs2_read_locked_inode()
> 
> Your code only works for the ocfs2_read_locked_inode() path, but not for the
> __ocfs2_mknod_locked() path.
> In __ocfs2_mknod_locked(), there are two tasks after ocfs2_populate_inode:
> "creating locks" and "updating the transaction". If you use a 'goto' to bypass
> these two tasks, ocfs2 will crash in the near future. Conversely, if you choose
> to execute the two jobs, the logic is flawed because we perform on a bad inode.
> 
> In my view, the existing code (using BUG()) is acceptable. We don't need to
> worry about this syzbot report.
> 
> Thanks,
> Heming

Hello Heming,

Thanks for the detailed explanation . I now understand more clearly how
removing BUG() from ocfs2_populate_inode() for inode having 
OCFS2_SUPER_BLOCK_FL set would cause problems in OCFS2 for the path
including __ocfs2_mknod_locked(). Since OCFS2_SUPER_BLOCK_FL flag on a
system dinode is indicative of metadata corruption and considering our
discussion, keeping BUG() for the same is appropriate.

Thanks,
Prithvi

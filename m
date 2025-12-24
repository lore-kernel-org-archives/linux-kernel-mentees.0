Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F532A3DE
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Dec 2025 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558300; cv=none; b=DhGFZEb9eS5pQbZSN/sR5eOuGqrALiweo6iH6DD02mVIm/pg9gFXPWZayLg/jdE8TMBQ8CdT0AeiRX0TJCvJmsL89QXCfvKxsz6k+pHmYl6ku8gzicgnf1brXV4EQdCyFKU3jigl6HG8xpl5om1ZbLxiyXlQvUrRGNbxp1yKoRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558300; c=relaxed/simple;
	bh=gsrHNNbocSyGlKE7vERXRimkrvrozZZCJmIIb6a960o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSjbY/ajP6/X8z4dY0FkCtwHh/fK62yxjnhjpH0hu9OoRulL+qLMEL8sOSSCPllcmYmfubYzEQRQawB5f7EF9CfEGFhxk20znT1EJ1HIAhjjIAb7YiGc9TnnULD+7URUAGV8mIsV2j2Pdg61d9pRi/ePxZSJvSY7L9ppOF6GbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUxDNgXa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUxDNgXa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4499288b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Dec 2025 22:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558297; x=1767163097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1Anp1lY1We4/zAVuAi7e7U46WAxj4AfEwKzru4nCjs=;
        b=gUxDNgXa7BiQT+G02uGTotJe9DOM7IQlIi2B0u5dyXeet2tOh/lrI1IqPsOrcflp5P
         hayrqY0S4OK4plSgEIvi5X9oBZDu8KgtvvKt3VYiBUerVAqOQFmX3yyYp82p2RsFrKKH
         EiPwXpTPYwbgQoqDu2Gg5505k3kzdorp9VkQjtKSXaUa6GFvnW2yh0V56UZ05+ZAKAhG
         rP/B+aq341kFrEoR2bXu45OdnqDrr3BGBqBxZ0eAxmr5wxi5c+r0trqfUW7TqOil8D5r
         zHuZhex1FO61+Q2TXyzJ69XFgU/szkHGsz229ShFXKBNps7E0BgJpiQSgDxaBrAg5BD8
         ZvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558297; x=1767163097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1Anp1lY1We4/zAVuAi7e7U46WAxj4AfEwKzru4nCjs=;
        b=t7znGsB59urrj1pxnIfA2ONuo2A+La/uMk4inn799sXm4ceXWiYnBG3EplYl/WNRd2
         yg0u9kdWDHOGLNJWnSZaRNmfJQZNsHpoCIWP9sW6cGkwX/JPJEnzMjPJtMIHNNcz9hoG
         zb9uUP4xY800Du9fxDOsGF1ojcsuDtEOWmHqJ6Aumez8twVJsCUWImnRf+wc7qIVLL8e
         1onhHar4A6tLkGjDrKJSQSgA0YytvIODcxhqxyYPXXzjoVOVdNzUhfW9QQ5TJ4sUtUpg
         P24pp3zxVVO1puNVlbnb7jbf4U9uQlc1rc8AkXc8tlFiT4E7r7VRVqy8d0DOOpADLHlg
         MTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy8B23AzWW2ORyPuNaQrHesnTEPcTHVhELj783AM/tpp2N+Jf1XC3R5XS8PJij6OVrdWTcixixw8i31ZQiBsG6qn084A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3OM5VLP8FWUInpJhZfbDIlYInXixbwBNIZfHAZ6NZnQ6WJ6eu
	Iar2VWo6543VCqVHzzD4VYCpZFYLImhDqFTSdOvlHXoRFrTZl/rg3mwj
X-Gm-Gg: AY/fxX4bd4bmLaBmr+QKseTC1mfAXZZI6Fu4Yz5LBgW5qbUJvt7KyiniiWgD6ySYz5H
	RcclQQWifzvLCfZrxz0L1DOzzhqAw9jiLYC5q2MnMnnQJHxooJHQZjc6jrjnoVDgj4YAInT8XUy
	IwW7dVZlz5GHtWc3nmU4e+3i7zUNjBIYUS7SGhmepKRcaWz8vjickGILHhiWA1WAX+D6of9jBWw
	1ZxMV1ASIDA1dVtfz5hPAtpFm68/+E7mhihiNh6JQAjXEeM0iaeLIlzqjgOBzvFfK/LY2+2gIDe
	8rGOgr6af557iVlopMEKdaftDubLK+4px5hmA+YTkA6cEyuXTnOfv/W6fANs6DdzcWaQ0crMLkh
	UDTd3xXPiIkdL9hEmFeaYq0HMoEkqH+Z/zSSb4WiHaK1EUA3S383FRP9Zz5gVnL8WyKtmlYNRGU
	VSDDlaVVJldOs=
X-Google-Smtp-Source: AGHT+IGeF+1DNi4wBQ+citO8we8db5AW369vz0FLW8lrY82nDFCZVApz9JhjcAMfqp7ryzxlPiNF4Q==
X-Received: by 2002:a05:6a00:328f:b0:7e8:43f5:bd36 with SMTP id d2e1a72fcca58-7ff66d5f579mr15039520b3a.34.1766558297009;
        Tue, 23 Dec 2025 22:38:17 -0800 (PST)
Received: from inspiron ([111.125.235.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e589b0csm15892605b3a.56.2025.12.23.22.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:38:16 -0800 (PST)
Date: Wed, 24 Dec 2025 12:08:09 +0530
From: Prithvi <activprithvi@gmail.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] ocfs2: Add check for total number of chains in chain list
Message-ID: <20251224063809.b5zs7uiiupeexzwa@inspiron>
References: <20251220094928.134849-1-activprithvi@gmail.com>
 <dcbfbwivj2pgid24lp7xynsli5v44fw5lskyg6r6yodr223irp@alqswzjnxmmu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcbfbwivj2pgid24lp7xynsli5v44fw5lskyg6r6yodr223irp@alqswzjnxmmu>

On Mon, Dec 22, 2025 at 11:21:11PM +0800, Heming Zhao wrote:
> On Sat, Dec 20, 2025 at 03:19:28PM +0530, Prithvi Tambewagh wrote:
> > The functions ocfs2_reserve_suballoc_bits(), ocfs2_block_group_alloc(),
> > ocfs2_block_group_alloc_contig() and ocfs2_find_smallest_chain() trust
> > the on-disk values related to the allocation chain. However, KASAN bug
> > was triggered in these functions, and the kernel panicked when accessing
> > redzoned memory. This occurred due to the corrupted value of `cl_count`
> > field of `struct ocfs2_chain_list`. Upon analysis, the value of `cl_count`
> > was observed to be overwhemingly large, due to which the code accessed
> > redzoned memory.
> > 
> > The fix introduces an if statement which validates value of `cl_count`
> > (both lower and upper bounds). Lower bound check ensures the value of
> > `cl_count` is not zero and upper bound check ensures that the value of
> > `cl_count` is in the range such that it has a value less than the total
> > size of struct ocfs2_chain_list and maximum number of chains that can be
> > present, so as to fill one block.
> > 
> > Reported-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=af14efe17dfa46173239
> > Tested-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> > ---
> >  fs/ocfs2/suballoc.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
> > index f7b483f0de2a..7ea63e9cc4f8 100644
> > --- a/fs/ocfs2/suballoc.c
> > +++ b/fs/ocfs2/suballoc.c
> > @@ -671,6 +671,21 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
> >  	BUG_ON(ocfs2_is_cluster_bitmap(alloc_inode));
> >  
> >  	cl = &fe->id2.i_chain;
> > +	unsigned int block_size = osb->sb->s_blocksize;
> > +	unsigned int max_cl_count =
> > +	(block_size - offsetof(struct ocfs2_chain_list, cl_recs)) /
> > +	sizeof(struct ocfs2_chain_rec);
> > +
> > +	if (!le16_to_cpu(cl->cl_count) ||
> > +	    le16_to_cpu(cl->cl_count) > max_cl_count) {
> > +		ocfs2_error(osb->sb,
> > +			    "Invalid chain list: cl_count %u "
> > +			    "exceeds max %u",
> > +			    le16_to_cpu(cl->cl_count), max_cl_count);
> > +		status = -EIO;
> > +		goto bail;
> > +	}
> > +
> >  	status = ocfs2_reserve_clusters_with_limit(osb,
> >  						   le16_to_cpu(cl->cl_cpg),
> >  						   max_block, flags, &ac);
> > 
> > base-commit: 36c254515dc6592c44db77b84908358979dd6b50
> > -- 
> > 2.34.1
> > 
> 
> Since 'fe' is read by ocfs2_read_inode_block(), the validation function
> ocfs2_validate_inode_block() is the appropriate place to perform this sanity
> check.
> 
> Please follow the pattern in commit e1c70505ee81 ("ocfs2: add extra consistency
> checks for chain allocator dinodes") when adding your code.
> 
> btw, I am a little bit confused, it seems commit e1c70505ee81 is enough to fix
> this syzbot issue.
> 
> Thanks,
> Heming

Hello Heming,

Thanks or the clarification. I applied the commit e1c70505ee81 ("ocfs2: add 
extra consistency checks for chain allocator dinodes") above the commit on 
which syzbot reported the bug : 36c254515dc6 ("Merge tag 'powerpc-6.12-4' 
of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux") and 
verified that it fixes this KASAN bug. 

You are right that commit e1c70505ee81 is enough to fix this bug, and my 
patch is redundant in this case.

Thanks for the review and guidance!

Best Regards, 
Prithvi

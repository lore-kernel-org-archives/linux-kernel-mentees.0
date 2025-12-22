Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28EE324B0A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Dec 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416879; cv=none; b=gNKjHCvBA+g36Qep81kFZmzY8dtvOlEpk3WvVMMbgtk8UoCO6Vi2gdBMVRYb4wrPPAFfcwoJxJuqC2llInVBNPdbVsG4ePvUUbNJzRCDckWVQN0ZvmscQzYbp5m2OnSfQSGLP+FtO03IsBa/BfQuHcgnlswBTadqdLmxvl/Q5PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416879; c=relaxed/simple;
	bh=jilGuhvtiRhmxes00FcFwryTusKzzs0Qxj5IRewUsb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2LuTpxXsiUB2rx1b8MgdgFII40Bc5aMLpDaI/Ql0N+IPPa8rHgsjNZS+xNDhYEMa0SN63mE6g/EjN46BPi6qt1Hk27MFZDRhn1g6DhjKepMZJFke24+MV5Njk2YBK/5Sedspg/C+hYFK0i86tIHHNJLWIA3lGLGxjoTCx3PcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IBLEe9vs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IBLEe9vs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f3273b92so235970f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Dec 2025 07:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766416875; x=1767021675; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67683Yp4DfWYCEQ61cFljypiXMZpqTDwo/WPQ4r3APU=;
        b=IBLEe9vsolvFlLlKzqrRAbDtbmGCx7T8B2HrSUtiweVIxxD8IwUQGvjBo4A3Ugos7I
         /t9esqtJqyvstHD8HLDCBVzCwy7GFOZVFYig+6etX4WhxkHvrY8gPFpG9m6XnB6fTLDL
         ojIgGJmVxw43Y5CCf8KwWkgm8NAlEEKI8mOM2gATM3q8MrBkbdJINHQZOjJssJkGA18t
         iUxIOlCZwpJ5ALbxy8WSBq2ISsSapO97FzwcFNNxTgsGd8taTs6+aEWjA8Miqrqkp6PV
         9tHk4+7Z3+oP1nt/r0Ly3IBxfWLdMPjC8XXKJj6H5vNjYxi/LmAfYvTN1EeMzCHqM4+H
         +A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416875; x=1767021675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67683Yp4DfWYCEQ61cFljypiXMZpqTDwo/WPQ4r3APU=;
        b=cvlXAKE/jTUfF3TkvmulmiikLn/Bnu1IeD0Yw0pnTxGeZk+U3zf6PHDIkqm+rzBjLb
         Zgl67hlUjOFrq4PcTRkpBB5zqBM+X1lVG12zxWO6VkMYsEVroFvY9zI0bjZ8tkI7uc0T
         3QzH1HAf0LDP0/fAzxU4pHMUcQfU3lTSbuyexfZn7eSBge5uZB2nM2qKRHug7jjH2pIr
         zMhS4DZC09PWGrsBnF9UsIv2ZV0lVPFJY2JL2s2Yd90YbSxy3vUIhMnJz1AgQq0u38jW
         cqZx67au67UF9Zva31m+PzMiaa6GKMETdu3P2vRFVGUfClZHkZS+eB1Gh3YaVhqnE22i
         EGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq/BmZsaxoHIoJdc4ApYFSpnHFBEqgODy9CZrB6AuakZ0+ggXCVlAzaVaCD73Kci6eTX1FNj+p6GshgQQASOIyx0Ah8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxffed7c9596w82KlVDB543m+pnPYnakqVoik66mKCzQORCJS6J
	FmrD80mYw/olKr3h9mEG4kA/dbiWq62A/VN3OD7MSFG3jfhv9Nc+UTYy9OgLMGK8Lhk=
X-Gm-Gg: AY/fxX5R7iPkzitdHv9VX1fnJJqOv+nCIQrKRZE0e1FNcjWj0YpAAT1C/ZvPJ+Y5l2Z
	qopnbdhukJ1FJGEXU0RJeIUY7gBK4DvjyZwVp3qF1PX22zHNI0TlkZuU/itXMoUn/9DqFPOvOr/
	/s/+7i7i/2BFvOpcwbAZ/2ZHW8ufoyO/7Xu/+cguYJfmlP4cxgsDTYtmBH+Qj5MJnhWYJ4m4Y4v
	fZrbeNDCFTLShxBoZL6rGRlHVcMcWKCGNUA4kE7vftqYs+eTwOkTsEXP2Yvu2Gw1BvMMY32lHwr
	dg/GDBT51LKNovYig+WS+v8MzwqGd5L2Z5p3zamyQnxIFzawOIOppm85yOEjYnKrGyUtCTUJULw
	14Xq6m8qeTX5JEZAZ6Ipyd179W4Hhwa4RbxDz6ZIXdWNHUcgMnZetB39CzmNTjBwqRgP3OqR1Av
	k9ZkH3BfX6Mw==
X-Google-Smtp-Source: AGHT+IF1MMLXn8cF9gQ8Kub0saoElqwqDv43cL2DbrA9klBBpsVnAtBkl/8MYrLlslInXIb7mvfraA==
X-Received: by 2002:a05:600c:848c:b0:471:1387:377e with SMTP id 5b1f17b1804b1-47d195a0ccemr60957825e9.6.1766416875083;
        Mon, 22 Dec 2025 07:21:15 -0800 (PST)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d428sm100198035ad.73.2025.12.22.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:21:14 -0800 (PST)
Date: Mon, 22 Dec 2025 23:21:11 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH] ocfs2: Add check for total number of chains in chain list
Message-ID: <dcbfbwivj2pgid24lp7xynsli5v44fw5lskyg6r6yodr223irp@alqswzjnxmmu>
References: <20251220094928.134849-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220094928.134849-1-activprithvi@gmail.com>

On Sat, Dec 20, 2025 at 03:19:28PM +0530, Prithvi Tambewagh wrote:
> The functions ocfs2_reserve_suballoc_bits(), ocfs2_block_group_alloc(),
> ocfs2_block_group_alloc_contig() and ocfs2_find_smallest_chain() trust
> the on-disk values related to the allocation chain. However, KASAN bug
> was triggered in these functions, and the kernel panicked when accessing
> redzoned memory. This occurred due to the corrupted value of `cl_count`
> field of `struct ocfs2_chain_list`. Upon analysis, the value of `cl_count`
> was observed to be overwhemingly large, due to which the code accessed
> redzoned memory.
> 
> The fix introduces an if statement which validates value of `cl_count`
> (both lower and upper bounds). Lower bound check ensures the value of
> `cl_count` is not zero and upper bound check ensures that the value of
> `cl_count` is in the range such that it has a value less than the total
> size of struct ocfs2_chain_list and maximum number of chains that can be
> present, so as to fill one block.
> 
> Reported-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=af14efe17dfa46173239
> Tested-by: syzbot+af14efe17dfa46173239@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  fs/ocfs2/suballoc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
> index f7b483f0de2a..7ea63e9cc4f8 100644
> --- a/fs/ocfs2/suballoc.c
> +++ b/fs/ocfs2/suballoc.c
> @@ -671,6 +671,21 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
>  	BUG_ON(ocfs2_is_cluster_bitmap(alloc_inode));
>  
>  	cl = &fe->id2.i_chain;
> +	unsigned int block_size = osb->sb->s_blocksize;
> +	unsigned int max_cl_count =
> +	(block_size - offsetof(struct ocfs2_chain_list, cl_recs)) /
> +	sizeof(struct ocfs2_chain_rec);
> +
> +	if (!le16_to_cpu(cl->cl_count) ||
> +	    le16_to_cpu(cl->cl_count) > max_cl_count) {
> +		ocfs2_error(osb->sb,
> +			    "Invalid chain list: cl_count %u "
> +			    "exceeds max %u",
> +			    le16_to_cpu(cl->cl_count), max_cl_count);
> +		status = -EIO;
> +		goto bail;
> +	}
> +
>  	status = ocfs2_reserve_clusters_with_limit(osb,
>  						   le16_to_cpu(cl->cl_cpg),
>  						   max_block, flags, &ac);
> 
> base-commit: 36c254515dc6592c44db77b84908358979dd6b50
> -- 
> 2.34.1
> 

Since 'fe' is read by ocfs2_read_inode_block(), the validation function
ocfs2_validate_inode_block() is the appropriate place to perform this sanity
check.

Please follow the pattern in commit e1c70505ee81 ("ocfs2: add extra consistency
checks for chain allocator dinodes") when adding your code.

btw, I am a little bit confused, it seems commit e1c70505ee81 is enough to fix
this syzbot issue.

Thanks,
Heming

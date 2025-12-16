Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79E22156B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765853449; cv=none; b=eKR2yXwqIDV62OTZeYVbbcFucykSr2pSsU8YxCiDIfaR9+4ze9+zeLeZNwIxJ++VcyqvjVUXLnke9ZiM9RPID/ZMRMCJhDh7y6VQ0OrPwxsDa386p10cwGQNjjA1/YFC3lgkuRioKwoovxD6sTvMoU2hq0CgLkU4qnEEL2+icMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765853449; c=relaxed/simple;
	bh=QVgKjKUDI5jysUkLMNYByH0f0h7urLamvuvFMWiJRUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hO84+AStyfsa9nG7fu3OV0eTyrP/gM/fvwa4PfSfwE/41UvEbkgyY18Hdu/lzC/9pk9aI06cz3GXWWbzb1AVJ1kxNCyYPcR8ItCXLEM9Jy3kM0HnNRkP9b1KzsuKmGtjOoErSZkJwegzgx916jvl1WwxPmjbmqO1Ch/iGfvm6f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IP4lgkyf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IP4lgkyf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779b49d724so9068355e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 18:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765853445; x=1766458245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7JjViQRQKBRsJlhymq11sv87eLLLQEFe1cEI0hqHTU=;
        b=IP4lgkyf442R4xjWmktm3XRxWTfsMQw5F/sNJ2YfHWAlTw5vgfpa3kq2sCVZSJX/xx
         riReMh+4DKmw/RpRa4aJ/nxloo3jfdyIFI6BVfCUtWd7RnSSlg9K2AqwQLNPH2EptDhA
         2XsK/GIUjc1yFRKI6VDthntoDr9fB7XsM/EMBqjhYpIqyQIvVHkoYrWy0EqwtFIKdje0
         29xTWxX7jjLbSXOittuwjvC/K34+GdcupPwcAab9O7ZWeOt0jMJVGyNGz3TZ2pzc7Mzi
         A+8Z5AjrDqFoJN7B0JO+GDKKN0nSMpXYGgMZjephLjMn5feWWsbuhMFbnjQi0+zKQLD/
         4w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765853445; x=1766458245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7JjViQRQKBRsJlhymq11sv87eLLLQEFe1cEI0hqHTU=;
        b=HrL/mkXiArTjor7US7mZqon4TvGZdMoaE6F1wKl8DnZGLPt8OL9HPAzi34/7WwerZl
         3tMkYgQ/nMsgD1lVwuzLH6xKtU9FHmz/k90IBX6TmXuh2YOPhpVXKpPEjdKNJUBpoeAe
         1ZKpvynP+XXjBSYXf4ao/ongXc0TuzqssTsYYPBAtEfpoCYM4rq0iDfVdTUIkS0wCSYj
         6s3bYTlGh9NfljG8Ofct8TkPE4sCpyz/+keqMYDtHK2o2abmngJyz6s9wdFn+s1jKXTJ
         YQ5rbI4nnz1dBeWQWcNnWi2DzMjMzWS91MXT2dNByThieTC+Z75IjNOBMxVQ/43smmi7
         fJTg==
X-Forwarded-Encrypted: i=1; AJvYcCWDixGbr2xHyRZGnL/u33N7+q3wx3H2Z9DjdE5N4CLApSdek6WTyRMKdIuU+1sbaBsSFAfZUg4DPotUbZeYSFv0rIeYyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHU6VSIQx6Uw8Fvo1YM/JWYrSo4/DBeUV6wjz7X9xJWTaB6X1a
	+fvRh3EUZCsI+w87rHLhR9OxRH+Jk9k8UGpfYSgcFhm9QLKXXE9K6tlozHrT27yM2So=
X-Gm-Gg: AY/fxX6eeENtYdrYDI6kmV7uBgCfqOprzPcuS+VhbCduUzzbC4tsVRWK0yWY8vdP9I7
	uWv99Kt/Zb9UOemtBaHVDNOAZfcXDBQc/CnJd/AU7M6Jp3cFi+v3C/LqtcqwLGRAufyVGfTBVyi
	N2lK5cyTZ4GXc3a9v6XZCM9gk/tOEaOr4CqQh4xafozd/DhrNjmRsmx667y5N1eUoC+ZVLLOYT5
	a2mMjaAHw2jvg6L+XBXcJBEl0celZtJ/pYjpzaxyxzp/MT6hZXWINTJrJhAVdA324sdMiGdbJj7
	5O6MAvaMCibOHwl4SiVW8jESGklqMHIK1P1XeX5WTY/5KLK+GIi6vx2gvY/hYXkpmfvpEwNUvxW
	+nVnFSprdX3PoAPd/t4gif24ulnts4M9kGZ4h/EcTPXGEU4z91NJEEKJZxeOy9hPgymQjY5OQPX
	c2n/CwYWaRAQ==
X-Google-Smtp-Source: AGHT+IGFpdWj4AV29w7LnuY195yA8yw6v8/URhKN2zatGt1tepq5Iy0jAGPkzT9Eum/fIrrrz8MkwA==
X-Received: by 2002:a05:600c:444b:b0:477:a203:66dd with SMTP id 5b1f17b1804b1-47a8f8a8a12mr80146825e9.2.1765853445137;
        Mon, 15 Dec 2025 18:50:45 -0800 (PST)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b651sm148500855ad.94.2025.12.15.18.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:50:44 -0800 (PST)
Date: Tue, 16 Dec 2025 10:50:42 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4] ocfs2: Add validate function for slot map blocks
Message-ID: <wcvwgkjd63d2taeghkojxtunk2p2gz7xtynyihgznosgpmye57@bcgd6mbyausn>
References: <20251215184600.13147-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215184600.13147-1-activprithvi@gmail.com>

On Tue, Dec 16, 2025 at 12:15:57AM +0530, Prithvi Tambewagh wrote:
> When the filesystem is being mounted, the kernel panics while the data
> regarding slot map allocation to the local node, is being written to the
> disk. This occurs because the value of slot map buffer head block
> number, which should have been greater than or equal to
> `OCFS2_SUPER_BLOCK_BLKNO` (evaluating to 2) is less than it, indicative
> of disk metadata corruption. This triggers
> BUG_ON(bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) in ocfs2_write_block(),
> causing the kernel to panic.
> 
> This is fixed by introducing function ocfs2_validate_slot_map_block() to
> validate slot map blocks. It first checks if the buffer head passed to it
> is up to date and valid, else it panics the kernel at that point itself.
> Further, it contains an if condition block, which checks if `bh->b_blocknr`
> is lesser than `OCFS2_SUPER_BLOCK_BLKNO`; if yes, then ocfs2_error is
> called, which prints the error log, for debugging purposes, and the return
> value of ocfs2_error() is returned. If the if condition is false, value 0
> is returned by ocfs2_validate_slot_map_block().
> 
> This function is used as validate function in calls to ocfs2_read_blocks()
> in ocfs2_refresh_slot_info() and ocfs2_map_slot_buffers().
> 
> Reported-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c818e5c4559444f88aa0
> Tested-by: syzbot+c818e5c4559444f88aa0@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>

Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
> v3->v4:
>  - Remove if condition in ocfs2_validate_slot_map_block() which checks if 
>    `rc` is zero
>  - Update commit log message 
> 
> v3 link: https://lore.kernel.org/ocfs2-devel/tagu2npibmto5bgonhorg5krbvqho4zxsv5pulvgbtp53aobas@6qk4twoysbnz/T/#m6f357a93c9426c3d2f0c2d18d71f4c54601089ec
> 
> v2->v3:
>  - Create new function ocfs2_validate_slot_map_block() to validate block 
>    number of slot map blocks, to be greater then or equal to 
>    OCFS2_SUPER_BLOCK_BLKNO
>  - Use ocfs2_validate_slot_map_block() in calls to ocfs2_read_blocks() in
>    ocfs2_refresh_slot_info() and ocfs2_map_slot_buffers()
>  - In addition to using previously formulated if block in 
>    ocfs2_validate_slot_map_block(), also check if the buffer head passed 
>    in this function is up to date; if not, then kernel panics at that point
>  - Update title of patch to 'ocfs2: Add validate function for slot map blocks'
> 
> v2 link: https://lore.kernel.org/ocfs2-devel/nwkfpkm2wlajswykywnpt4sc6gdkesakw2sw7etuw2u2w23hul@6oby33bscwdw/T/#m39bc7dbb208e09a78e0913905c6dfdfd666f3a05
> 
> v1->v2:
>  - Remove usage of le16_to_cpu() from ocfs2_error()
>  - Cast bh->b_blocknr to unsigned long long
>  - Remove type casting for OCFS2_SUPER_BLOCK_BLKNO
>  - Fix Sparse warnings reported in v1 by kernel test robot
>  - Update title from 'ocfs2: Fix kernel BUG in ocfs2_write_block' to
>    'ocfs2: fix kernel BUG in ocfs2_write_block'
> 
> v1 link: https://lore.kernel.org/all/20251206154819.175479-1-activprithvi@gmail.com/T/#mba4a0b092d8c5ba5b390b5d6a5c3ec7bc6caa6ae
> 
>  fs/ocfs2/slot_map.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/slot_map.c b/fs/ocfs2/slot_map.c
> index e544c704b583..ea4a68abc25b 100644
> --- a/fs/ocfs2/slot_map.c
> +++ b/fs/ocfs2/slot_map.c
> @@ -44,6 +44,9 @@ struct ocfs2_slot_info {
>  static int __ocfs2_node_num_to_slot(struct ocfs2_slot_info *si,
>  				    unsigned int node_num);
>  
> +static int ocfs2_validate_slot_map_block(struct super_block *sb,
> +					  struct buffer_head *bh);
> +
>  static void ocfs2_invalidate_slot(struct ocfs2_slot_info *si,
>  				  int slot_num)
>  {
> @@ -132,7 +135,8 @@ int ocfs2_refresh_slot_info(struct ocfs2_super *osb)
>  	 * this is not true, the read of -1 (UINT64_MAX) will fail.
>  	 */
>  	ret = ocfs2_read_blocks(INODE_CACHE(si->si_inode), -1, si->si_blocks,
> -				si->si_bh, OCFS2_BH_IGNORE_CACHE, NULL);
> +				si->si_bh, OCFS2_BH_IGNORE_CACHE,
> +				ocfs2_validate_slot_map_block);
>  	if (ret == 0) {
>  		spin_lock(&osb->osb_lock);
>  		ocfs2_update_slot_info(si);
> @@ -332,6 +336,24 @@ int ocfs2_clear_slot(struct ocfs2_super *osb, int slot_num)
>  	return ocfs2_update_disk_slot(osb, osb->slot_info, slot_num);
>  }
>  
> +static int ocfs2_validate_slot_map_block(struct super_block *sb,
> +					  struct buffer_head *bh)
> +{
> +	int rc;
> +
> +	BUG_ON(!buffer_uptodate(bh));
> +
> +	if (bh->b_blocknr < OCFS2_SUPER_BLOCK_BLKNO) {
> +		rc = ocfs2_error(sb,
> +				 "Invalid Slot Map Buffer Head "
> +				 "Block Number : %llu, Should be >= %d",
> +				 (unsigned long long)bh->b_blocknr,
> +				 OCFS2_SUPER_BLOCK_BLKNO);
> +		return rc;
> +	}
> +	return 0;
> +}
> +
>  static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
>  				  struct ocfs2_slot_info *si)
>  {
> @@ -383,7 +405,8 @@ static int ocfs2_map_slot_buffers(struct ocfs2_super *osb,
>  
>  		bh = NULL;  /* Acquire a fresh bh */
>  		status = ocfs2_read_blocks(INODE_CACHE(si->si_inode), blkno,
> -					   1, &bh, OCFS2_BH_IGNORE_CACHE, NULL);
> +					   1, &bh, OCFS2_BH_IGNORE_CACHE,
> +					   ocfs2_validate_slot_map_block);
>  		if (status < 0) {
>  			mlog_errno(status);
>  			goto bail;
> 
> base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
> -- 
> 2.43.0
> 

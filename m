Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74E357CFF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624531; cv=none; b=gB7RIHU+sQ/qq0T6HqNw2Faw6P6plVcW2WJiOFnHzGlQ59VVN/lj667Ll14g4Y2Gq7OFDM36DWKRfqzz9Y0Wwm20WXXfZPtEcUzk5ynSQJYtZ0v7FlSMiTqZFpRBMJli/s1kqLFvjznwoRgBMLBvwfd/zWrnh+Sen7InZyUJGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624531; c=relaxed/simple;
	bh=fKXRzsyPrMDCepYl/y2S1DD8oCfDl/6FZvmP/4LbbX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icYf7yQqjlbLR83ATEWKtzed6N+QUC26q6krVJrkSyfNo0f7SscCehWz2CzYwozUEy5qsP1DBpWDYj5btrkFJlhrLHf5R+JdvtUMvReuqDr2F7xEx9dILdR+J52PdG9TKQ90o3/R7DIbRBgjzpkRh1ffvtd/9DAHZllW6ycqPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=sWHKl8YJ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="sWHKl8YJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F3440BA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 22:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q08tnnw0hCi1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 May 2026 22:22:09 +0000 (UTC)
X-Greylist: delayed 666 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 12 May 2026 22:22:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E60840A42
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E60840A42
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=sWHKl8YJ
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.121.94.186; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=<UNKNOWN> 
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E60840A42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 May 2026 22:22:07 +0000 (UTC)
X-KPN-MessageId: 745c291c-4e4f-11f1-89ea-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 745c291c-4e4f-11f1-89ea-00505699b430;
	Wed, 13 May 2026 00:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=KFY+NLisTxw88P/4n/HvkB0xQgcjZ1+4M/U1TJ4/PLU=;
	b=sWHKl8YJSxV4UJ2M6kUuJbc2oOKpRMqhqJhPH7u+gVNf0CJIYDmIMas8GcJ+UBj+HBO8oo2IR2X39
	 2QrlO27qWd/3tDwB7XEZVyeRnIXiW63+ox5/dkrMhYOyIKItM205NbwHHrB8QCvhhmR/lR4Pq0Us4g
	 dgkmklt2QnnoCJUf5Fwou9Lw4zt/UwI8F8RitfnI7QSKBSv6KscbvgYrdlyQS9FfRGWt5sCpb5XHj8
	 PvOmMnK6Ae8c26hsea8Ja8C0i61BkrJy0Ipqi0alcrksW2PPAYg0nmBCP9cYs/nOSiO8YvrskMwXlU
	 d1VlsV6iYhNxeNGqajJ6Lhf7edPmUkg==
X-KPN-MID: 33|s0AxYYjSZj8Cir1UdRPTDQDefg7mHDpS4VpcwdRwuDmVtYbeOUf4k/moiX1d6ID
 W96I1/ggiNxQfshKlVFSfp1gHK2hlxt5KfHI4XbusdWM=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|/av9dgq7tIV2pvFC0vhxLDL8A6WmOC+tNflbBtXBGRSU/x+I2vyWfEFjWUYfkdt
 uVJ99O2+zS1Kom01dFCxkvw==
Received: from localhost (unknown [178.226.150.234])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 743aaffa-4e4f-11f1-9c0c-00505699d6e5;
	Wed, 13 May 2026 00:10:58 +0200 (CEST)
Date: Wed, 13 May 2026 00:10:52 +0200
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Abdellah Ouhbi <abdououhbi1@gmail.com>
Cc: tytso@mit.edu, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] ext4: Use %pe to print PTR_ERR() in namei.c
Message-ID: <agOecLx8tAm8zwIw@lt-jori.localdomain>
Mail-Followup-To: Jori Koolstra <jkoolstra@xs4all.nl>, 
	Abdellah Ouhbi <abdououhbi1@gmail.com>, tytso@mit.edu, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
References: <20260424152245.142308-1-abdououhbi1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424152245.142308-1-abdououhbi1@gmail.com>

On Fri, Apr 24, 2026 at 04:22:45PM +0100, Abdellah Ouhbi wrote:
> Fix coccicheck warning
> ./namei.c:150:25-32: WARNING: Consider using %pe to print PTR_ERR()
> 
> Replace %ld with %pe and PTR_ERR(bh) with bh pointer.
> The %pe specifier automatically converts error pointers to
> human-readable error names instead of raw error codes.
> 
> Signed-off-by: Abdellah Ouhbi <abdououhbi1@gmail.com>
> ---
>  fs/ext4/namei.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 4a47fbd8dd30..c0cabf172020 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -145,9 +145,9 @@ static struct buffer_head *__ext4_read_dirblock(struct inode *inode,
>  	if (IS_ERR(bh)) {
>  		__ext4_warning(inode->i_sb, func, line,
>  			       "inode #%llu: lblock %lu: comm %s: "
> -			       "error %ld reading directory block",
> +			       "error %pe reading directory block",
>  			       inode->i_ino, (unsigned long)block,
> -			       current->comm, PTR_ERR(bh));
> +			       current->comm, bh);
>  
>  		return bh;
>  	}
> -- 
> 2.51.0
> 

OK, this looks fine. I do wonder if using %pe really makes sense here
since this thing never gets to be a pointer, so if I read this and don't
notice the IS_ERR(bh) I might think that bh could be a pointer there if
I'm reading quickly.

Thanks,
Jori.


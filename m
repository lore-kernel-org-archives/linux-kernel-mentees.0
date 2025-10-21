Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2326F2BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030164; cv=none; b=SdDqksMe/D1wP5fCBuj48m5n56tkvj7UseYfS+4wc3j7h+TGfrV7EU1/St02GygLl+0efglVgGETXEQT/PlGlf8fNrbXNmSi3aL+WGF7uMdAvvW1NwSQRVqmv83FYSyMf5D7pj+hTeIZNN1qV5zGxop9CFvfwKAuohXAgmf2ppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030164; c=relaxed/simple;
	bh=6lEWOnbf4y1y98HAP+LxVFokT9voRQdo4MPMdq5hVac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFThhFzhkeBk4lXiuXWumoZwtzog3VNczM5PJscNVDBPaDdSKKCCAvREWDo0y43tiC5DjTQ3YJYsjGlDnx+F7sWdN9OrNxSOtEo103V0YGBV8RjYZotCRJ2sAynE0bwWBJKW5Wu1ZSBlaZdlw+S0us7KjIt7M/ElFn+3zhpJcYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erXKkGm/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erXKkGm/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFF380F93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IiZo6nq-kJ6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 07:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=cem@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D85A80F91
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D85A80F91
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=erXKkGm/
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0D85A80F91
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 07:02:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7B33401A8;
	Tue, 21 Oct 2025 07:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EE8C4CEF1;
	Tue, 21 Oct 2025 07:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761030160;
	bh=6lEWOnbf4y1y98HAP+LxVFokT9voRQdo4MPMdq5hVac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erXKkGm/laR+wHFojIbkxwSIaRuI9hXLjpyDKcKZW+TmUpzofZpqRzjSBAMTLIH1H
	 XT8LBljnrDjiC0cqnRajY4uJf8O6hyvpkHqKP0/zvJNaIgXMXcFAAmQxLkGKdv0GJ+
	 cbXoYAzDoPB5YBUYUXdlUCueOCcxvBkF8WSR1qWgj3JHJRgZwOEK0LLu6CCg2rOHpt
	 cVp+PD7kLMWDtK3utBCD27VhpnlJmPDuO6d3ErusEKjwk2+Z/yUaGSbj7LxglSXKU2
	 ZuWThaCUBUIG9BYp8hrrWfCRcQNiM3ylGgNDM6fvxTaGga8dbHjYPZQMnQBK4RVkKL
	 +8Pv993bJnFnQ==
Date: Tue, 21 Oct 2025 09:02:35 +0200
From: Carlos Maiolino <cem@kernel.org>
To: Kriish Sharma <kriish.sharma2006@gmail.com>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] xfs: use kmalloc_array() instead of kmalloc() for map
 allocation
Message-ID: <qw64zhza44fxxtoripp2nu7d4tny7wy7dyqapilhxyxmng5jsk@fxyxlisrbcls>
References: <eeslnTm4EeKA2atDj3UKUcXAaGwgiPzioO9tR3Kf0pBEyUjxEO_9DaFIpNYIlc_9ey63h8gqdBsIt9Xjgn7AkA==@protonmail.internalid>
 <20251018194528.1871298-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>

Hello.

On Sat, Oct 18, 2025 at 07:45:28PM +0000, Kriish Sharma wrote:
> Using kmalloc_array() better reflects the intent to allocate an array of
> map entries, and improves consistency with similar allocations across the
> kernel.
> 
> No functional change intended.

Thanks for the patch.
Have you ran xfstests against this patch? All patches sent to xfs should
at least pass basic testing via xfstests. I.e. ensure there is no new
failure between an unpatched kernel and a kernel with your patch.

If you did, please send me the results summary, if you did not, please
run it, and send a V2 of this patch  including in the patch description
the summary of the results.

Any changes includes risk, and so every patch sent to xfs should be at
least basically tested against xfstests auto group.

Thanks,
Carlos

> 
> Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
> ---
>  fs/xfs/xfs_qm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
> index 23ba84ec919a..34ec61e455ff 100644
> --- a/fs/xfs/xfs_qm.c
> +++ b/fs/xfs/xfs_qm.c
> @@ -1218,7 +1218,7 @@ xfs_qm_reset_dqcounts_buf(
>  	if (qip->i_nblocks == 0)
>  		return 0;
> 
> -	map = kmalloc(XFS_DQITER_MAP_SIZE * sizeof(*map),
> +	map = kmalloc_array(XFS_DQITER_MAP_SIZE, sizeof(*map),
>  			GFP_KERNEL | __GFP_NOFAIL);
> 
>  	lblkno = 0;
> --
> 2.34.1
> 

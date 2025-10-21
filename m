Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9A33FE23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058277; cv=none; b=ApZMr29lj+vEJ7YqwXtcU9mCMKvLFztlA0zmBwza4pra0TFl62ZjjWyG26O/R9guf+WK+n+3Eou3454XOYBHT5l+fczx6HPf6VTZToYktgRrd59bV/0dLM8GoHA6hdQwIHqbIi3yoeJyfXXfv/YUEFjHnUWm7q3ExJA4YcrlzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058277; c=relaxed/simple;
	bh=4j58uT7Q9RaxMbe9w9Sd/lYEYQAeZE1sPmPoN/jramg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+vfiblEo8qmQG23GotjCfI+oq/jvoNcZFK0Abk2bOZUF1C8h3fk5Z7p8krGucFC6TteSQ7/DmqhEoJWdB+qcWPQxmjSVyeYY30xvgydS0kIm+o04sLir3bjzcdShGBdWwAYA+APDt2Ihny3Lcgcmr782yj4KBg5acg71NrkwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn8oXSr7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn8oXSr7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD8881514
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 14:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y55PR_eUddzK for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 14:51:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=djwong@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2571281495
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2571281495
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cn8oXSr7
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2571281495
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 14:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05C0E442DC;
	Tue, 21 Oct 2025 14:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA4DC4CEF1;
	Tue, 21 Oct 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761058273;
	bh=4j58uT7Q9RaxMbe9w9Sd/lYEYQAeZE1sPmPoN/jramg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cn8oXSr7AB9lkN7l/rANcOok3/1OdG622CRbwrL+nWhUhIRwNTXnV5FcZWiWiCt5Q
	 /AnsyeSIQG4GeV+dCTcciBIgyAxW4i3qcUszQXeVbZRVNSOZwvEztRSgHG0RACRl6l
	 0+5Wfes0lnreqWHqKrxHmE5eUFCAc0HfD6h9/N3SSDaVHfnrYmIHaedbnAwYoWt/Zl
	 hiQwmxl+XW21CsZcRFnMWNVrcQqsZbb6fgQbhynWn7la0HObJWvVphgGQ8WVuIc/tD
	 rOEXPrG0Kb3Q1lHaP/NtRvMC0QOjt4wXaTemELaOBgpS6RjTKZu1uJQ6e6cSXMh6mv
	 dmthJBixlr7TA==
Date: Tue, 21 Oct 2025 07:51:13 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Kriish Sharma <kriish.sharma2006@gmail.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] xfs: use kmalloc_array() instead of kmalloc() for map
 allocation
Message-ID: <20251021145113.GI3356773@frogsfrogsfrogs>
References: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018194528.1871298-1-kriish.sharma2006@gmail.com>

On Sat, Oct 18, 2025 at 07:45:28PM +0000, Kriish Sharma wrote:
> Using kmalloc_array() better reflects the intent to allocate an array of
> map entries, and improves consistency with similar allocations across the
> kernel.
> 
> No functional change intended.
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

Why would we replace a constant that can be computed at compile time
with a dynamic computation that is now fallible despite NOFAIL?

--D

>  			GFP_KERNEL | __GFP_NOFAIL);
>  
>  	lblkno = 0;
> -- 
> 2.34.1
> 
> 

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20E313E27
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392846; cv=none; b=sfCIC4i69tzWcDFJ01P0RgFrjhN/fsMe68cyWzAH8kF6RbdxFPOidOW3HyqAdsaHQPCsu21k8as4jiE0giCMLE4madOOHEGl27PcXJB3Y5v2VtEtAyMcmOqoYioM34jyQOFbMCORZS1bljmaUFYNDzlX/2nE2ZPr2Cogzn+bMvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392846; c=relaxed/simple;
	bh=m7DbKa5nL0/l/h4kStB22h0PHHL/c9TtGgkpRT1CwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/ZCBGJbn4bhSg8gPLW5+Mnj2f4BQybANSEKP5GxWksCQpcvVbSTD+bsPeWWoVtn90CQpym4eUtOIWvp/mMPf/vIDvM4apeNvkuSAZVbx+aOOqnVVc5WWL/K05+L/t7HhGnd6N/p1omh+ee4ukhKtgjTaMRFxojR0z80WLLcd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3/dMkL2; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3/dMkL2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF45660E30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RbDgWqbcmUk for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Aug 2025 14:54:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=djwong@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0F2E60E44
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F2E60E44
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3/dMkL2
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E0F2E60E44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 28 Aug 2025 14:54:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C173660055;
	Thu, 28 Aug 2025 14:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE16C4CEEB;
	Thu, 28 Aug 2025 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756392841;
	bh=m7DbKa5nL0/l/h4kStB22h0PHHL/c9TtGgkpRT1CwFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3/dMkL2cuy5yroFBqYyQ61iRC8Tauq4yidehrDsfj6WVwgQbMSYv8ZXKUX7z4/qL
	 AmyASZXoT+ejQ42z0edgv3o9ecNh5ZygL6zJZdaGI69WL66tkchTqb9GeU02hWPEh/
	 KkXir5k3p2hI3gVzEIECg7En3TONYSRGB377PiMSSXQFL8qZoog7aYhzPd720uQ5XB
	 owQ5l4zlELlxI+byPMAwljWd5nZ4lc/pHoy5u/wee/Kq4EQO/5dGEv5HNmthrYij06
	 KqLJDrd6/ErMCRBVkU5JDyf5uxFaEJJbcWR83n+cmcRLlyofjZ9uY8vfHLuX9Havjs
	 44drH1fMRJQSQ==
Date: Thu, 28 Aug 2025 07:54:00 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] xfs: Replace strncpy with memcpy
Message-ID: <20250828145400.GH8096@frogsfrogsfrogs>
References: <20250827221830.23032-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827221830.23032-1-marcelomoreira1905@gmail.com>

On Wed, Aug 27, 2025 at 07:17:07PM -0300, Marcelo Moreira wrote:
> The changes modernizes the code by aligning it with current kernel best
> practices. It improves code clarity and consistency, as strncpy is deprecated
> as explained in Documentation/process/deprecated.rst. This change does
> not alter the functionality or introduce any behavioral changes.
> 
> Suggested-by: Dave Chinner <david@fromorbit.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

memcpy is fine, the repair code determines the new target length via
strnlen(bufsize) later on so we'll continue to fix the "non-null
characters after the zero terminator" case.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
> Changes since v2:
> - Fixing some errors in the commit message.
> Link to v2: https://lore.kernel.org/linux-kernel-mentees/CAPZ3m_iNj2zwpAovv3BTz8gNp5XzdxSRHBFonM9sJvaSjYVBeg@mail.gmail.com/T/#t
> 
>  fs/xfs/scrub/symlink_repair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/scrub/symlink_repair.c b/fs/xfs/scrub/symlink_repair.c
> index 953ce7be78dc..5902398185a8 100644
> --- a/fs/xfs/scrub/symlink_repair.c
> +++ b/fs/xfs/scrub/symlink_repair.c
> @@ -185,7 +185,7 @@ xrep_symlink_salvage_inline(
>  		return 0;
>  
>  	nr = min(XFS_SYMLINK_MAXLEN, xfs_inode_data_fork_size(ip));
> -	strncpy(target_buf, ifp->if_data, nr);
> +	memcpy(target_buf, ifp->if_data, nr);
>  	return nr;
>  }
>  
> -- 
> 2.50.1
> 
> 

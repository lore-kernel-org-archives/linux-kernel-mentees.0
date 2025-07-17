Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0C2F948A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770366; cv=none; b=ifPDUKTv3ncSmTCynESv2XA7H5aE9a2bwGiAYddYAv09vvxdruemPd5RSG8eJuXQqEApcb4usN0CcMECx8L6TJGTRXVggj+XoSl8q+neFnZNNZRTI26s37xhNPFTAbGkHGYz7kSocIQsBl6myEDYwRz5yrpwxHNz4BYbncjdXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770366; c=relaxed/simple;
	bh=DUuaQ5fBKnMeGewxsxqW1NmtpbgDaSIp9zGPMWqqa3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fk9ARHi6F/DG4FVaf8BIKWo7DyR7DVB1LCa7Y9zIxQ9R7MIdgPGW1KLeZ+CB0caftk1QatgJB4LuCgFviTinttONei97IZ8fkxxg/mneAJcOvmkied6QOwswyHtmfVswGMcbksoAD0CWY6f7jVPfXpVp76X9AisYdQVGCR50DF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPY+TatH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPY+TatH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBB483CEE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99osHkVTl9Mz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 16:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=djwong@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E592081A24
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E592081A24
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kPY+TatH
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E592081A24
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:39:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D204C5C5B43;
	Thu, 17 Jul 2025 16:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728E1C4CEE3;
	Thu, 17 Jul 2025 16:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752770357;
	bh=DUuaQ5fBKnMeGewxsxqW1NmtpbgDaSIp9zGPMWqqa3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPY+TatHmQ+T9YDfwv/7mJ/0aor2fYIRcXUOWaXzMfKT1O3gg/yyleXmsK1fOv2SS
	 Ce+Mpq10TVdPvhF8qyUSeGWDWNvMLuyxJuUeCH9Q0+9UePewq/gQKva6bymwMCVqPJ
	 EPtIrNBIeEL20JNkU8BAvZVKe9wFWJrUhMkrDrtdttbNILVzx+2r8HUq7Lr/IfVoDe
	 kfPjMDwyKXiASOcYar9+j2aFYuB4s0XHOw0U+hW1J9EdpBD/9mp6FSAKCLC9pq1plG
	 hx12wTb5DWvbKO1BLglbC/qjbdBF6GDytUf2e/7Wz6vHWePlfDGuHsfHIQNBBoanlm
	 2PtGGa/Blc53w==
Date: Thu, 17 Jul 2025 09:39:16 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: cem@kernel.org, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] xfs: Replace strncpy with strscpy
Message-ID: <20250717163916.GR2672049@frogsfrogsfrogs>
References: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716182220.203631-1-marcelomoreira1905@gmail.com>

On Wed, Jul 16, 2025 at 03:20:37PM -0300, Marcelo Moreira wrote:
> The `strncpy` function is deprecated for NUL-terminated strings as
> explained in the "strncpy() on NUL-terminated strings" section of
> Documentation/process/deprecated.rst.
> 
> In `xrep_symlink_salvage_inline()`, the `target_buf` (which is `sc->buf`)
> is intended to hold a NUL-terminated symlink path. The original code
> used `strncpy(target_buf, ifp->if_data, nr)`, where `nr` is the maximum
> number of bytes to copy. This approach is problematic because `strncpy()`
> does not guarantee NUL-termination if the source string is truncated
> exactly at `nr` bytes, which can lead to out-of-bounds read issues
> if the buffer is later treated as a NUL-terminated string.
> Evidence from `fs/xfs/scrub/symlink.c` (e.g., `strnlen(sc->buf,
> XFS_SYMLINK_MAXLEN)`) confirms that `sc->buf` is indeed expected to be
> NUL-terminated. Furthermore, `sc->buf` is allocated with
> `kvzalloc(XFS_SYMLINK_MAXLEN + 1, ...)`, explicitly reserving space for
> the NUL terminator.
> 
> `strscpy()` is the proper replacement because it guarantees NUL-termination
> of the destination buffer, correctly handles the copy limit, and aligns
> with current kernel string-copying best practices.
> Other recommended functions like `strscpy_pad()`, `memcpy()`, or
> `memcpy_and_pad()` were not used because:
> - `strscpy_pad()` would unnecessarily zero-pad the entire buffer beyond the
>   NUL terminator, which is not required as the function returns `nr` bytes.
> - `memcpy()` and `memcpy_and_pad()` do not guarantee NUL-termination, which
>   is critical given `target_buf` is used as a NUL-terminated string.
> 
> This change improves code safety and clarity by using a safer function for
> string copying.

Did you find an actual bug in online fsck, or is this just
s/strncpy/strscpy/ ?  If the code already works correctly, please leave
it alone.  Unless you want to take on all the online fsck and fuzz
testing to make sure the changes don't break anything.

--D

> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  fs/xfs/scrub/symlink_repair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/scrub/symlink_repair.c b/fs/xfs/scrub/symlink_repair.c
> index 953ce7be78dc..ce21c7f0ef54 100644
> --- a/fs/xfs/scrub/symlink_repair.c
> +++ b/fs/xfs/scrub/symlink_repair.c
> @@ -185,7 +185,7 @@ xrep_symlink_salvage_inline(
>  		return 0;
>  
>  	nr = min(XFS_SYMLINK_MAXLEN, xfs_inode_data_fork_size(ip));
> -	strncpy(target_buf, ifp->if_data, nr);
> +	strscpy(target_buf, ifp->if_data, XFS_SYMLINK_MAXLEN + 1);
>  	return nr;
>  }
>  
> -- 
> 2.50.0
> 
> 

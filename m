Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3120ED
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 00:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749946754; cv=none; b=qDE+phvZDrtoKFTmS8NfemAYrmcgLwhxCF5QybFnubxcW/nacYFEyOsqFfcp5fbJKnn5GZFE+D9yzMRjFDEYg2suuxjK5ejSyvPLFQ/sGX34rYUqB4eH48P7yPB/mkRS8MYl1qLE+fybngDN1G5+5v38uRDF/9HpKa3jSzT/Q/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749946754; c=relaxed/simple;
	bh=3B8ZjwmwaTpJfUywi8cz4b16TJXLgZq9IcKyOf5E6dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5MtEqeMOq08/A0EIIBwdZO4+0zjnw5aTKuQQGMmYsfZvLHabKaia2foMPap4IFnax8/YJquayu4RVE1c56ga/HwfTl+smvmuDi49WS9m0+sXSv2sIbmIt4y1i/7ZoHATNxFBngTOlaEosGWj/OqKXe/aRKsmpiD5xnpX5poquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VigJ5sYh; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VigJ5sYh"
Date: Sat, 14 Jun 2025 20:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749946749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H6C93AH03uM53+bm7yYHrvvEWvXyq4ZPABxruEJ66oQ=;
	b=VigJ5sYhrbkYPzGer9gDazzl6JV41HiIoDkUFV14iMsaigasqqX7LiuEHZ55rrj/bWpvPD
	g4u6uPCOnO63qF7ZBIaz/OSEfopWTuqoqjq7O0wHsOX9cmP5WzZ1OKylEEKjd/MXh72stx
	XAc+fUg/KaSntSCkf8S5N809YqZeSzc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Subject: Re: [PATCH] bcachefs: don't return early from __btree_err for bad or
 incompatible node read errors
Message-ID: <bwga4jheevnhuwwpopfwbzsjsxvmte4mtybevkfgssem4zftjo@anj44i6sfyd4>
References: <20250614185743.657564-1-bharadwaj.raju777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614185743.657564-1-bharadwaj.raju777@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sun, Jun 15, 2025 at 12:27:40AM +0530, Bharadwaj Raju wrote:
> After cd3cdb1ef706 ("Single err message for btree node reads"),
> all errors caused __btree_err to return BCH_ERR_fsck_fix no matter what
> the actual error type was if the recovery pass was scanning for btree
> nodes. This lead to the code continuing despite things like bad node
> formats when they earlier would have caused a jump to fsck_err, because
> btree_err only jumps when the return from __btree_err does not match
> fsck_fix. Ultimately this lead to undefined behavior by attempting to
> unpack a key based on an invalid format.

Hang on, -BCH_ERR_fsck_fix should've caused us to fix fixable errors,
not cause undefined behaviour.

Or is the issue that we're returning -BCH_ERR_fsck_fix for non-fixable
errors?

Glancing at the code, I think the bug might not be limited to btree node
scan; we now seem to be passing FSCK_CAN_FIX for all errors in the
non-btree-node-scan case, and I don't think that's right for
BCH_ERR_btree_node_read_err_must_retry cases.

But I'll have to go digging through the git history to confirm that, and
it sounds like you've already looked - does that sound like it?

> 
> Make errors of type BCH_ERR_btree_node_read_err_bad_node (only if
> __bch2_topology_error) or BCH_ERR_btree_node_read_err_incompatible go
> through the full __btree_err function instead of returning fsck_fix even
> when we are in that recovery phase.
> 
> Reported-by: syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
> Fixes: cd3cdb1ef706 ("bcachefs: Single err message for btree node reads")
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
> ---
>  fs/bcachefs/btree_io.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/btree_io.c b/fs/bcachefs/btree_io.c
> index d8f3c4c65e90..e010ae94f1e1 100644
> --- a/fs/bcachefs/btree_io.c
> +++ b/fs/bcachefs/btree_io.c
> @@ -556,7 +556,10 @@ static int __btree_err(int ret,
>  		       struct printbuf *err_msg,
>  		       const char *fmt, ...)
>  {
> -	if (c->recovery.curr_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes)
> +	if (c->recovery.curr_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes &&
> +	    !(ret == -BCH_ERR_btree_node_read_err_bad_node &&
> +	      __bch2_topology_error(c, err_msg)) &&
> +	    ret != -BCH_ERR_btree_node_read_err_incompatible)
>  		return bch_err_throw(c, fsck_fix);
>  
>  	bool have_retry = false;
> -- 
> 2.49.0
> 

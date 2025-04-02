Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA66B674
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618331; cv=none; b=WmgY5r1sjCP0Iyky1cgT7mZv6LfeyOPXCt5zid0cTEcXKX9eQIQr9bgF2HDs0BI1fsSXet6OE4sM1tBF412mZnxBhLnA9/dmgxRsAt5FTrDKWqrDLaNikrUtWmfppM6ouMM7I3c4ROSVKMVtu3K6zfednDKiZYbnThuly7qU0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618331; c=relaxed/simple;
	bh=X7WlFzryVQmI0vtGPEi7XUfnO0FDI6kyZPLHkYzGV2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDlTgad/VAdGesFsg/BQIYg3ZurpjDZtPjT7RsyfF4iUQFk+GsgnNTYMJHWyLdn7l7SDt8d8aWjJP5hjGN9HfO+poT3XcuixcfFjN0td1n5j4a8ISGdEiaJ/MzIt7Jg07S9oVW4hvxeAY2twpXQYDYqa4YzD31dYUoEH/I4XO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ByZ52DlG; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ByZ52DlG"
Date: Wed, 2 Apr 2025 14:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743618325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=umVlCwIMG6EvWqLUfbeLQGTAGSB4/4JNIoTa5JSviAI=;
	b=ByZ52DlG0bwUZZ7bTjHlxG69b+piu/f4vay6AOejLZfyiqQ37qOUQXSIZ0RiSJBVgWBF5a
	oJ+0oaNbX0HvF3qnarmJaNMAIqgpeU7gJCkaZ1NAdGjhlY9ltVVQ/d6pD/AbFoVE7Etq5K
	allMhOrn2eU+gcgVq0aRqpdwOzMxjco=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH bcachefs-testing] bcachefs: use nonblocking variant of
 print_string_as_lines in error path
Message-ID: <nlp6womaeq5tgt4wfae6mq5fl5w3sg7bqkyu2ctsaunxuaemqg@os4cz7r3tbyz>
References: <20250402181556.81529-1-bharadwaj.raju777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402181556.81529-1-bharadwaj.raju777@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 02, 2025 at 11:45:53PM +0530, Bharadwaj Raju wrote:
> The inconsistency error path calls print_string_as_lines, which calls
> console_lock, which is a potentially-sleeping function and so can't be
> called in an atomic context.
> 
> Replace calls to it with the nonblocking variant which is safe to call.
> 
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>

Looks good, applying.

> ---
>  fs/bcachefs/error.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/bcachefs/error.c b/fs/bcachefs/error.c
> index b885bd92834c..baf5dfb32298 100644
> --- a/fs/bcachefs/error.c
> +++ b/fs/bcachefs/error.c
> @@ -34,7 +34,7 @@ bool __bch2_inconsistent_error(struct bch_fs *c, struct printbuf *out)
>  				   journal_cur_seq(&c->journal));
>  		return true;
>  	case BCH_ON_ERROR_panic:
> -		bch2_print_string_as_lines(KERN_ERR, out->buf);
> +		bch2_print_string_as_lines_nonblocking(KERN_ERR, out->buf);
>  		panic(bch2_fmt(c, "panic after error"));
>  		return true;
>  	default:
> @@ -71,7 +71,7 @@ static bool bch2_fs_trans_inconsistent(struct bch_fs *c, struct btree_trans *tra
>  	if (trans)
>  		bch2_trans_updates_to_text(&buf, trans);
>  	bool ret = __bch2_inconsistent_error(c, &buf);
> -	bch2_print_string_as_lines(KERN_ERR, buf.buf);
> +	bch2_print_string_as_lines_nonblocking(KERN_ERR, buf.buf);
>  
>  	printbuf_exit(&buf);
>  	return ret;
> -- 
> 2.49.0
> 

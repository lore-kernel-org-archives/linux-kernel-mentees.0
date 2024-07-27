Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842F18003C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722091955; cv=none; b=ihoKHj+RvL+dl/PT3h3WQH32I0O1VkI8ycSnppN6tELZahC3ugErTGBMjOOe7WRX9QLwZMJ4775xibVEvkuFPf1QaNWbhKEgrtKooeMRRl67PBh+FT6QBsoT+uXgm8NIy1/PCY1uOusda1sO2YplxOvtuzDdVrGfoTQ1gFUCx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722091955; c=relaxed/simple;
	bh=K6NxWWNL2QqGdfUs+BXB/kW5QQcfEqNmqGcANuzcQGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iR+284fnUj8CeGfIYJPQCiivuoYY0broKaMuRt+Vf3xfS4PhgEJ7BOwUa2JrlBUk3xf6z/0EYw7TvdZLwIdtwNeHN2CSUpGynLeSEAzBk13ub7pcjmAKvoDKmfjfNd9zhwfJMy7ZAGBMkf8U0H6fevRe2ZqQFy0U05P/B202bXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aJdzF1oO; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aJdzF1oO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F43340210
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 14:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTvviw1vsjiU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 14:52:32 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31A80400C6
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A80400C6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=aJdzF1oO
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 31A80400C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UrVcCwUbiNWo86A31hbf2V6PwUgVZZxFzYmDkpri+fU=; b=aJdzF1oOhi04inpLbfh9ssab7A
	SY5fGThBcQmMX/IILXRp9nc4Y3kSUHv14jK3O4XrTMxrpJAfhPn0Mo8AOMGmy2mi2LtbKs8g5+GD0
	T1GBSBUK5gS0flH/pdE9Ik3/e5Mhr96MnsoghOMTEW+/aINc7Wqrf0DfpgwPy8S8r2pzzAhkXh2hq
	Jh4tcJr60oDtFSkvGoobNCsSHNU5C3Nj+Sbh2F9t251aNcb7iGz0+rmNPv/mbwoz22ofcGzLSr/pX
	0fMLL8GfFQQROjk3Q52Yaeu9bbLb6uSZ18qg5URINkvwRyrVBHoOaMHME7sKzfA6QP20iN4RzV8eR
	fL2a2pBw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXimX-0000000BQSc-0NFZ;
	Sat, 27 Jul 2024 14:52:25 +0000
Date: Sat, 27 Jul 2024 15:52:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] hfsplus: Initialize directory subfolders in
 hfsplus_mknod
Message-ID: <ZqUJqAWIuFjtcccA@casper.infradead.org>
References: <20240727061303.115044-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727061303.115044-1-simeddon@gmail.com>

On Sat, Jul 27, 2024 at 11:43:04AM +0530, Siddharth Menon wrote:
> Addresses uninitialized subfolders attribute being used in 
> `hfsplus_subfolders_inc` and `hfsplus_subfolders_dec`.

This is a really poor commit message.  It needs to be more descriptive.
How can this happen?  Is it just a fuzzing thing?

> Fixes: https://syzkaller.appspot.com/bug?extid=fdedff847a0e5e84c39f
> Reported-by: syzbot+fdedff847a0e5e84c39f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/x/report.txt?x=16efda06680000
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
> Removed changes that was accidentally added while debugging
> and reformatted the message.
> 
>  fs/hfsplus/dir.c | 3 +++
>  1 file changed, 3 insertions(+)
> 644
> --- a/fs/hfsplus/dir.c
> +++ b/fs/hfsplus/dir.c
> @@ -485,6 +485,9 @@ static int hfsplus_mknod(struct mnt_idmap *idmap, struct inode *dir,
>  
>  	mutex_lock(&sbi->vh_mutex);
>  	inode = hfsplus_new_inode(dir->i_sb, dir, mode);
> +	if (test_bit(HFSPLUS_SB_HFSX, &sbi->flags))
> +		HFSPLUS_I(dir)->subfolders = 0;
> +
>  	if (!inode)
>  		goto out;
>  
> -- 
> 2.39.2
> 
> 

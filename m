Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94158179A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056077; cv=none; b=Ib+bF4Hm7YUtX/CrrHGgVdLJCx/uUgQeuRRh3IUic/TiId4FZUJg8Ky+oP4qICdmlP+rUu4QolxFGRkXPyYT3+DDyuk7OMm6J3L5VU6afPq6cU9FV7QBk69bMl4whhD2B1jbNWW2hffKJMPxJubl0iabe6u3koCloB05B6hPbZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056077; c=relaxed/simple;
	bh=e6C5AcGDW5odeEs9RqEVGCL0fJd/n/qfjve8IIa+5ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7WJ6v+PPjhOY1XkhtTxuuNfCRGCBD+A8nQZReA63jAqbqSeHVm+LgBFiWtazRaDeQ4LU6d8fvrsWIq1oOOk2ENN/irX6nI+Cqf1yfst7QVdvE5PuzYZHvBXL61jbHg+b/J2YGV/04n+mE2gmC+UFbz70maolDMDYk54GT8XbrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=tnfBm+0i; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="tnfBm+0i"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E5B8455A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.905
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD_yqnr9u2sp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jul 2024 04:54:34 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4319E84559
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4319E84559
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=tnfBm+0i
Received: from zeniv.linux.org.uk (unknown [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4319E84559
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jul 2024 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nUtHhk8ZAVlInJGOT06jW7niZwCf2d8NToEnw7afd5o=; b=tnfBm+0iMmBSyLkygQ1WoCpJHX
	MZW20fTx7pSYjssc6R28ocxrWq7iVFqsVzhpdX6DHlZab9N9eBBA6R5zPAWPbiB4kanVlYBrrWPQW
	CP1M0Vg0tY3Zl/7BkdmM5sNcfFqTinJWlGO63EyrVFIXGf8PSlxuPWhTkfdzJdes84kuEbBKfQJbx
	Q+JPSrY4xQZQstRw2EkxZX+NG8siLSLBUd2ZYHGMWL2+Am+l9w30U5mz0wPKw6pVB2RwduPP+ExUL
	/ldeEC4WZ0O05DjQ63YAAhbqA2frvHRKEJEbAFNjKN7CG9UkJp4g3Nt5VnzY/5BAeEaubML9GYkqw
	N4Kh///g==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXZRt-00000002KYy-0T7z;
	Sat, 27 Jul 2024 04:54:29 +0000
Date: Sat, 27 Jul 2024 05:54:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: hfsplus: Initialize directory subfolders in hfsplus_mknod
Message-ID: <20240727045429.GG99483@ZenIV>
References: <20240727045127.54746-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727045127.54746-1-simeddon@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jul 27, 2024 at 10:21:29AM +0530, Siddharth Menon wrote:

> -	if (S_ISBLK(mode) || S_ISCHR(mode) || S_ISFIFO(mode) || S_ISSOCK(mode))
> -		init_special_inode(inode, mode, rdev);
> +	if (S_ISBLK(mode) || S_ISCHR(mode) || S_ISFIFO(mode) || S_ISSOCK(mode)){
> +		init_special_inode(inode, mode, rdev);}

Huh?  What's that chunk about?

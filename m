Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFF221C167
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 24 Nov 2025 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764028006; cv=none; b=VkM3iYM/VF6+y9ChLMnI9vFNNY1+div31x9rV0Z5sKFrOGUYZ7jL3F80j2vEmZKWf/SKIqLTXaCcrHVEyCfyM2jOg7BpdF+olURyvLWVUDLLgfz8XJJANbOit0kYBEhnER2rfujInwEiLxWcJN2RLQR5oe3NIVoNdx9jPBRdLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764028006; c=relaxed/simple;
	bh=QM9zknqSLBY6QSYbDhz5v5I9KvKTzBfg9/rtsn7nAR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnnivndTqjGdPf9PsErod3KO805VlxpTbLpw7l949tYyHCQgK3BNJY12h2E1qprVkTfZDOmoha0cxWKbRhUIfL45eZ7Bc69yNpNfpwbaJCIIUne+aPM+vOkeo5ZxLyEMgcdCcF7B+GyQdnAyZOJTD4jmpQZTXgnJGeJDpoWB8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=TIo1KzvB; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="TIo1KzvB"
Date: Mon, 24 Nov 2025 23:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1764027992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4P2sClRaAKgY1OkBtVXJNigBx3jVH3TqY+Lt5bLcw4=;
	b=TIo1KzvBqMvrnB4vf7GcGlk4salBEPMd0xRNQWJr0i5orCJBJCSyPgeVqNO+zdEZOpOgut
	YxdYVSDASnPE6J43sA7UdU8piY8Wn7QWqn6zlrcE7nQqsT6cqX6j1XpMqvdCLKFVT61EwC
	R5hxb/doGHu3TztLZ7enPDugYTnorF6R9ypuL+STR0ZFhEg2b48cZ+r2cbELn9KjvXYmV+
	/gfKNEvK1gQKoDekICzWKDZ9X4RaDDzZkvLBMuYPf4puEpa40+4njA2XhIa3eU8gfq1Afa
	Jb+A0nP3V+0jMty/gbHaP+FoLaVcpk5yoy5Rvvw3Lk6sr/u40xq1iSAl0yrtkQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Anthony Vernon <contact@gvernon.com>
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
	"penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
	"slava@dubeyko.com" <slava@dubeyko.com>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"frank.li@vivo.com" <frank.li@vivo.com>,
	"linux-kernel-mentees@lists.linux.dev" <linux-kernel-mentees@lists.linux.dev>,
	"syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com" <syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] hfs: Validate CNIDs in hfs_read_inode
Message-ID: <aSTuaUFnXzoQeIpv@Bertha>
References: <d2b28f73-49c8-4e30-9913-01702da4dfe4@I-love.SAKURA.ne.jp>
 <20251104014738.131872-3-contact@gvernon.com>
 <df9ed36b-ec8a-45e6-bff2-33a97ad3162c@I-love.SAKURA.ne.jp>
 <a31336352b94595c3b927d7d0ba40e4273052918.camel@ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a31336352b94595c3b927d7d0ba40e4273052918.camel@ibm.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 11, 2025 at 10:42:09PM +0000, Viacheslav Dubeyko wrote:
> On Tue, 2025-11-11 at 23:39 +0900, Tetsuo Handa wrote:
> > On 2025/11/04 10:47, George Anthony Vernon wrote:
> > > +	if (!is_valid_cnid(inode->i_ino,
> > > +			   S_ISDIR(inode->i_mode) ? HFS_CDR_DIR : HFS_CDR_FIL))
> > > +		BUG();
> > 
> > Is it guaranteed that hfs_write_inode() and make_bad_inode() never run in parallel?
> > If no, this check is racy because make_bad_inode() makes S_ISDIR(inode->i_mode) == false.
> >  
> 
> Any inode should be completely created before any hfs_write_inode() call can
> happen. So, I don't see how hfs_write_inode() and make_bad_inode() could run in
> parallel.
> 

Could we not read the same inode a second time, during the execution of
hfs_write_inode()?

Then I believe we could hit make_bad_inode() in hfs_read_inode() once we
had already entered hfs_write_inode(), and so test a cnid against the
wrong i_mode.

Thanks,

George

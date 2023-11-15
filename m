Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C02FC20
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Nov 2023 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="coxdz/uM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xR5jXjalkv+3xl2hvJEA3on0YsUVjM36wGHO7zEA1+8=; b=coxdz/uMBpP2qrs6VvFvIrmOjB
	Rp0v2QygwbJhYQWMx0TaTg9q/pykgcpXK/n9As9QDhViNROUy2oaxm5e2SDDcN0hWeO+BhrO+AbIW
	owXkpwcxPFF5XAlpvXCZo4319GlmY18ZbJY//s2Kz9Z3oZ4P7XzZmmjCj6SSllxrEhgYrtAYVRVyC
	aaFDnxEp4rD+wb8o/nwrxGlsgSI6gmX37eumZP8QksJcILTlcrpDHTGCqNTY/VKwWRTig2V2TY0xG
	fK/xHNr7gDi6CwtjqwstXmKfQDuCddOg/1qcOM9pANa2sFaHWFEFSLnqnMHpcrYM1orcpXNlWoI/r
	GgEB84fQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r3LBO-00Fruc-5G; Wed, 15 Nov 2023 19:04:14 +0000
Date: Wed, 15 Nov 2023 19:04:14 +0000
From: Matthew Wilcox <willy@infradead.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Cc: akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+89edd67979b52675ddec@syzkaller.appspotmail.com,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] mm/pgtable: return null if no ptl in
 __pte_offset_map_lock
Message-ID: <ZVUWLgFgu+jE3QmW@casper.infradead.org>
References: <20231115065506.19780-1-jose.pekkarinen@foxhound.fi>
 <ZVTTbuviH9/RWYyI@casper.infradead.org>
 <1c4cb1959829ecf4f0c59691d833618c@foxhound.fi>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c4cb1959829ecf4f0c59691d833618c@foxhound.fi>

On Wed, Nov 15, 2023 at 06:05:30PM +0200, José Pekkarinen wrote:
> On 2023-11-15 16:19, Matthew Wilcox wrote:
> > On Wed, Nov 15, 2023 at 08:55:05AM +0200, José Pekkarinen wrote:
> > > Documentation of __pte_offset_map_lock suggest there is situations
> > > where
> > 
> > You should have cc'd Hugh who changed all this code recently.
> 
>     Hi,
> 
>     Sorry, he seems to be missing if I run get_maintainer.pl:
> 
> $ ./scripts/get_maintainer.pl include/linux/mm.h
> Andrew Morton <akpm@linux-foundation.org> (maintainer:MEMORY MANAGEMENT)
> linux-mm@kvack.org (open list:MEMORY MANAGEMENT)
> linux-kernel@vger.kernel.org (open list)

That's a good example of why get_maintainer.pl is not great.  It's
just a stupid perl program.  Ideally, you should research what changes
have been made to that code recently and see who else might be
implicated.  Who introduced the exact code that you're fixing?

In this specific instance, you can see Hugh already responded to it:

https://lore.kernel.org/all/0000000000005e44550608a0806c@google.com/T/

Now, part of Hugh's response turns out to be incorrect; syzbot can
reproduce this on a current mainline kernel.  But, for some reason,
syzbot has not done a bisect to track it down to a particular commit.
I don't understand why it hasn't; maybe someone who knows syzbot better
can explain why.

> > > +++ b/include/linux/mm.h
> > > @@ -2854,7 +2854,7 @@ void ptlock_free(struct ptdesc *ptdesc);
> > > 
> > >  static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
> > >  {
> > > -	return ptdesc->ptl;
> > > +	return (likely(ptdesc)) ? ptdesc->ptl : NULL;
> > >  }
> > 
> > I don't think we should be changing ptlock_ptr().
> 
>     This is where the null ptr dereference originates, so the only
> alternative I can think of is to protect the life cycle of the ptdesc
> to prevent it to die between the pte check and the spin_unlock of
> __pte_offset_map_lock. Would that work for you?

Ah!  I think I found the problem.

If ALLOC_SPLIT_PTLOCKS is not set, there is no problem as ->ptl
is embedded in the struct page.  But if ALLOC_SPLIT_PTLOCKS is set
(eg you have LOCKDEP enabled), we can _return_ a NULL pointer from
ptlock_ptr.  The NULL pointer dereference isn't in ptlock_ptr(), it's
in __pte_offset_map_lock().

So, how to solve this?  We can't just check the ptl against NULL; the
memory that ptl points to may have been freed.  We could grab a reference
to the pmd_page, possibly conditionally on ALLOC_SPLIT_LOCK being set,
but that will slow down everything.  We could make page_ptl_cachep
SLAB_TYPESAFE_BY_RCU, preventing the memory from being freed (even if
the lock might not be associated with this page any more).

Other ideas?

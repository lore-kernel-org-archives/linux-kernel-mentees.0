Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9F125BE
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Nov 2023 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TiksqvsI"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so252764fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 16 Nov 2023 00:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700123211; x=1700728011; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u2XmX2KrWi1y3m2X9AnU9wT0fC0eZs76Gy7YyWSbakc=;
        b=TiksqvsI2S8xaC1Cr5yYskWbEehfuf7EfcsBM42ml01507BamOTMQa2ax0t6wLfDqI
         rEPr/8Fdp5Tp9ksTmwNKUP4aw/iZsH4gWKdphVXUWMGx56rHsIapPDRl1ZXhRDLCTMT/
         ZT7boic2fh8LNb3F4lz6vs1bYIFXmo/E4AIndqkmntemT+p6V2d6g61gOH0aT00HVakF
         9Ei61JSAmPOw/m39yMXNBCFn7DZDMetDYlNU+CjKBW94cb9VRanVySwW5zBmJ8GWpVg2
         Mf4d45ofQ67svRaJePJ7CYNR83cBlWzEC4R294ZOuDj6i+92Abs4s+Wb8/kVEtYvdzWI
         +unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700123211; x=1700728011;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2XmX2KrWi1y3m2X9AnU9wT0fC0eZs76Gy7YyWSbakc=;
        b=GegJJLgkPpvlM8VRacyPGcPubUNFAztJoEIpYzDlkJTSr7pWwifWE4k71rDZawl8pE
         pzf5eW9sx14FUdoLNoNjqh2ZnKh+5nbF4lfO/y6HdBwhW3qIhHwl3/OPizSwKSnkjAQn
         d2FhWt1BPR/jUPj+kVuzcvAq8NqAYa4TN4hC0/J/KO7viQ5TTnK4ANl1SVuu9cBlirST
         kto9ywZqHgiuRNVY8DdVKCBiS9trZfRGWD3YRWQ8hPIeRJwYylkJZvvKajZlBfsIeSng
         GZhJc7acgvvRS0RoD6EWZVa/9ujL+iMro25SzFxOS8weHzer27zoCGLFCJiIWy23mr3U
         YgEg==
X-Gm-Message-State: AOJu0YxaC6PdBCutVHJPRCFU5M44JZ5B9Lo4yG4YwYeu2cU3WQQYFnEm
	zSyV5Yq+7CzfyqUHdWIqajcgxg==
X-Google-Smtp-Source: AGHT+IE7w+1n0Rumu6tiZ0oCMxAY+y3dimDmUbr8EZaTXEn4BDvU7a/l/yvMSZ7+Fe7ajPFFqQFb4Q==
X-Received: by 2002:a05:6870:3127:b0:1ef:cb8c:cebd with SMTP id v39-20020a056870312700b001efcb8ccebdmr17440326oaa.59.1700123210697;
        Thu, 16 Nov 2023 00:26:50 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id y4-20020a056870a34400b001e9ce1b5e8fsm2062976oak.15.2023.11.16.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 00:26:49 -0800 (PST)
Date: Thu, 16 Nov 2023 00:26:39 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Hugh Dickins <hughd@google.com>
cc: Matthew Wilcox <willy@infradead.org>, 
    =?ISO-8859-15?Q?Jos=E9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>, 
    akpm@linux-foundation.org, skhan@linuxfoundation.org, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
    syzbot+89edd67979b52675ddec@syzkaller.appspotmail.com, 
    Jann Horn <jannh@google.com>
Subject: Re: [PATCH] mm/pgtable: return null if no ptl in
 __pte_offset_map_lock
In-Reply-To: <515cb9c1-abcd-c3f3-cc0d-c3cd248b9d6f@google.com>
Message-ID: <1b7019f3-0abf-a2f5-46ae-373af2043e56@google.com>
References: <20231115065506.19780-1-jose.pekkarinen@foxhound.fi> <ZVTTbuviH9/RWYyI@casper.infradead.org> <1c4cb1959829ecf4f0c59691d833618c@foxhound.fi> <ZVUWLgFgu+jE3QmW@casper.infradead.org> <515cb9c1-abcd-c3f3-cc0d-c3cd248b9d6f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463753983-898050368-1700123209=:31351"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463753983-898050368-1700123209=:31351
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 15 Nov 2023, Hugh Dickins wrote:
> On Wed, 15 Nov 2023, Matthew Wilcox wrote:
> > On Wed, Nov 15, 2023 at 06:05:30PM +0200, Jos=E9 Pekkarinen wrote:
> >=20
> > > > I don't think we should be changing ptlock_ptr().
> > >=20
> > >     This is where the null ptr dereference originates, so the only
> > > alternative I can think of is to protect the life cycle of the ptdesc
> > > to prevent it to die between the pte check and the spin_unlock of
> > > __pte_offset_map_lock. Would that work for you?
>=20
> Thanks for pursuing this, Jos=E9, but I agree with Matthew: I don't
> think your patch is right at all.  The change in ptlock_ptr() did not
> make sense to me, and the change in __pte_offset_map_lock() leaves us
> still wondering what has gone wrong (and misses an rcu_read_unlock()).
>=20
> You mentioned "I tested the syzbot reproducer in x86 and it doesn't
> produce this kasan report anymore": are you saying that you were able
> to reproduce the issue on x86 (without your patch)?  That would be very
> interesting (and I think would disprove my hypothesis below).  I ought
> to try on x86 if you managed to reproduce on it, but it's not worth
> the effort if you did not.  If you have an x86 stack and registers,
> please show (though I'm uncertain how much KASAN spoils the output).
>=20
> >=20
> > Ah!  I think I found the problem.
> >=20
> > If ALLOC_SPLIT_PTLOCKS is not set, there is no problem as ->ptl
> > is embedded in the struct page.  But if ALLOC_SPLIT_PTLOCKS is set
> > (eg you have LOCKDEP enabled), we can _return_ a NULL pointer from
> > ptlock_ptr.  The NULL pointer dereference isn't in ptlock_ptr(), it's
> > in __pte_offset_map_lock().
> >=20
> > So, how to solve this?  We can't just check the ptl against NULL; the
> > memory that ptl points to may have been freed.  We could grab a referen=
ce
> > to the pmd_page, possibly conditionally on ALLOC_SPLIT_LOCK being set,
> > but that will slow down everything.  We could make page_ptl_cachep
> > SLAB_TYPESAFE_BY_RCU, preventing the memory from being freed (even if
> > the lock might not be associated with this page any more).
>=20
> But I don't think that's quite right either: or, I hope it's not right,
> because it would say that all my business of rcu_read_lock() and
> pte_free_defer() etc was a failing waste of everyone's time: if the
> page table (and/or its lock) can be freed while someone is in that RCU-
> protected area, then I've simply got it wrong.
>=20
> What I thought, when yesterday's flurry of syzbot messages came in,
> was perhaps the problem is at the other end - when the new page table
> is allocated, rather than when it's being freed: a barrier missing there?
>=20
> But pmd_install() does have an smp_wmb(), with a (suspiciously) long
> comment about why no smp_rmb()s are needed, except on alpha.
>=20
> I'm not much good on barriers, but the thought now in my mind is that
> that comment is not quite accurate: that at the bottom level an smp_rmb()
> is (very seldom!) needed - not just to avoid a NULL (or previous garbage)
> ptl pointer in the ALLOC_SPLIT_LOCK case, but to make sure that the ptl
> is visibly correctly initialized (or would spin_lock on it achieve that?)=
;
> and that what pte_offset_map() points to is visibly empty.  (I'm imaginin=
g
> stale cache lines left behind on the oopsing CPU, which need to be
> refetched after pmdval has been read.)
>=20
> And that this issue has, strictly speaking, always been there, but in
> practice never a problem, because of mmap_lock held for write while (or
> prior to) freeing page table, and racers holding mmap_lock for read
> (vma lock not changing the calculus); but collapse_pte_mapped_thp()
> can now be done with mmap_lock for read, letting those racers in
> (and maybe your filemap_map_pages() has helped speed these races up -
> any blame I can shift on to you, the better ;)
>=20
> But I may well be spouting nonsense.  And even if I'm right, is adding
> an smp_rmb() in there too high a price to pay on some architectures?
>=20
> I did make an attempt to reproduce on an arm64, but there's too much
> more I'd need to muck around with to get it working right.  Let's ask for
> a syz test on top of v6.7-rc1 - hmm, how do I tell syzbot that it's arm64
> that it needs to try on?  I hope it gets that from the Cc'ed syz number.

Syzbot couldn't do it from this mail, but did it from the original thread:
https://lore.kernel.org/linux-mm/000000000000ba0007060a40644f@google.com/
tells us that I was spouting nonsense: this patch does not fix it.
I have no further idea yet.

>=20
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it b85ea95d086471afb4ad062012a4d73cd328fa86
>=20
> [PATCH] mm/pgtable: smp_rmb() to match smp_wmb() in pmd_install()
>=20
> Not-Yet-Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  mm/memory.c          | 2 ++
>  mm/pgtable-generic.c | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/mm/memory.c b/mm/memory.c
> index 1f18ed4a5497..8939357f1509 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -425,6 +425,8 @@ void pmd_install(struct mm_struct *mm, pmd_t *pmd, pg=
table_t *pte)
>  =09=09 * being the notable exception) will already guarantee loads are
>  =09=09 * seen in-order. See the alpha page table accessors for the
>  =09=09 * smp_rmb() barriers in page table walking code.
> +=09=09 *
> +=09=09 * See __pte_offset_map() for the smp_rmb() at the pte level.
>  =09=09 */
>  =09=09smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
>  =09=09pmd_populate(mm, pmd, *pte);
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 4fcd959dcc4d..3330b666e9c3 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -297,6 +297,11 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long ad=
dr, pmd_t *pmdvalp)
>  =09=09pmd_clear_bad(pmd);
>  =09=09goto nomap;
>  =09}
> +=09/*
> +=09 * Pair with the smp_wmb() in pmd_install(): make sure that the
> +=09 * page table lock and page table contents are visibly initialized.
> +=09 */
> +=09smp_rmb();
>  =09return __pte_map(&pmdval, addr);
>  nomap:
>  =09rcu_read_unlock();
> --=20
> 2.35.3
---1463753983-898050368-1700123209=:31351--

Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA952D979B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494730; cv=none; b=lxy+37/KlMZYxNPo9py2YJIcvridhGhn9YlDT/JuIrbiW8TepKlXUgDS92OUC/CzaKMK7kKamDzwmR+BPxX/mVSzUqvzn8LasSZAnJ3wmjgqisdTOCBLB/FjmuQdbLZfjoVaLYwetge7EyuUcfbtUJfX2Fz8djB5THn04HVSXBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494730; c=relaxed/simple;
	bh=8o/mKyv3A3lFC7y0XtOvzYtcPxEWOuachx5Hy4zXOOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyf7vuk1OT8MyIVqcop9HtgRkU03NDnqkDxBgMxLrzBBUEOPKXRsSsgJM/DL4HbaQGTN1rLKQoHmCJ+qgZZqnmbLYyltQzcs+6pL/QBf+CT7XbLE5yBqCIqJuU+Aoe4t/wyxACnl9yDWl1VbVtsxkSL+pcHytoHXKB8oTFor6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6E4bWsV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6E4bWsV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-343f52d15efso5558432a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763494729; x=1764099529; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP8obOsgLV+Mi7QU5SctjthhRGiNVWVhn+AWfuje1og=;
        b=b6E4bWsVQ1GAZtnyNQFS0Apg/Mkhymsr7nBjoL118LJYb32HDKFSCU9omv/AFSuC39
         KLI22uafqyI1LtdfPRz4Rhfkj2vxNlzXTReI0ADuxLy1UpitXfbcWs+++zIFHGi3k2H9
         DVe4ll7HdEvm05C9nCZMSI+OsZDKry0CttCqDeoDgAGbylvNlpi4ALU3eskmqWp3Kfay
         ao1XtOU2pcsl/7pkjpY5Ko91tM5FQGtCrhkTlaC+TLwy72hrIMelqBSNrLyZTPR722Ei
         StMngNfv6K47sNyo+vFNPpRyIfegANyc+YTBRNUqFc4YozaNqjdpU5ri5C0N1t+gk4D1
         75YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494729; x=1764099529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xP8obOsgLV+Mi7QU5SctjthhRGiNVWVhn+AWfuje1og=;
        b=jhDpZrtGWJs6893sdL89O4fzOb+czQ2Jjv/+AcDFOzdCEqGUAoiWmu6PP9w0mwf0/w
         eBP6gC9VcoD8QsAz4mpqY+AhiX+A1wOTEVGZzkwRD7QcO33Ese2MLPCxp8rkaQAgE+MK
         wvAX+yh49x4ICzV/z7zmAgkgFxv1iTb81GhikZLPggHjzPxcAomucK+D7vOIatSDuriP
         yLqf5EEi7cmjlvVE6z8jxb8aUlhVfnEv9I6Patay+kM/dfqTKCOTfb91Ac0PrfS2L9aj
         Xo4pt5ap+41hag6VZ7i0KARw6j377gVE0ui9VRkBoqkXB9Jk+SlPlrbt8VxAIQLq7nwq
         0t0A==
X-Forwarded-Encrypted: i=1; AJvYcCVzYtNWF8ZN+4e0S/GrxWHrzLKwuOkAXut7ALqQsx83nkg/ulLMd+1RIVngQHs3SyRmJ6uuB+emHVU/WGsLaKfEKDSPqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX8lgh8xEmmUNuOdUnGKKT6ILtffPzopycDz0Em8NgGYkvbD7C
	UiwFTEpiv4/CKccO6vnCsVwhvrYE5RiKpHKm1na0bU4hfD2/lFguMI3LjIvY/sxri2mnhaXyGAE
	h4hkQ84SWJZufi6FhYnq3we4jps/hatc=
X-Gm-Gg: ASbGnctMEitIxRCuh9hQiRxEZ6kcPuve9OYQ8Ot0K107lxOrlcufa1Ao3xKRpR3GKxJ
	iPjrKG/Z5sFbfKNuX7pmN2Jy3R3hSe+UXLTj0R6a1DaPpVWkAqjLcVpJ6mE3jBC+lfj0J1FlTS0
	ESEgnpnBqBcZJBaQioACeNXVR5m9oOv6nvBXh4BjI/Uo5I6BTZc7ZyyIPlCuT5Ej8JzQKp8arfD
	rhIH5r5h7b+UId3uamGgA7GylYy1iJ+jnRG3IIBL/aRjaeRswC/aKmLvh5I4pB0vBlsscELw/RW
	bpbKJFN3ZJ8LumvdvLwpCg==
X-Google-Smtp-Source: AGHT+IHjQ5qI54V48OaD9lOMuf97MRj94VnLpjJI2NcKNfYtXCw0gbO/k0nfKsSQ9TEAtm7URf1eXdHMpVdLUVZFnJg=
X-Received: by 2002:a17:90b:58ef:b0:343:7714:4ca6 with SMTP id
 98e67ed59e1d1-343fa62be93mr16554523a91.22.1763494728613; Tue, 18 Nov 2025
 11:38:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114193729.251892-1-ssranevjti@gmail.com> <aReUv1kVACh3UKv-@casper.infradead.org>
 <CANNWa07Y_GPKuYNQ0ncWHGa4KX91QFosz6WGJ9P6-AJQniD3zw@mail.gmail.com>
 <aRpQ7LTZDP-Xz-Sr@casper.infradead.org> <20251117164155.GB196362@frogsfrogsfrogs>
 <aRtjfN7sC6_Bv4bx@casper.infradead.org> <CAEf4BzZu+u-F9SjhcY5GN5vumOi6X=3AwUom+KJXeCpvC+-ppQ@mail.gmail.com>
 <aRxunCkc4VomEUdo@infradead.org> <aRySpQbNuw3Y5DN-@casper.infradead.org> <20251118161220.GE196362@frogsfrogsfrogs>
In-Reply-To: <20251118161220.GE196362@frogsfrogsfrogs>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 18 Nov 2025 11:38:36 -0800
X-Gm-Features: AWmQ_bk9sXea8jL7B_XWSvq1NtCko5Jbx6_OaVtFvyVo8HnLwKRsCuuE1XHa0Cc
Message-ID: <CAEf4BzYkPxUcQK2VWEE+8N=U5CXjtUNs6GfbfW2+GoTDebk19A@mail.gmail.com>
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, 
	SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>, akpm@linux-foundation.org, 
	shakeel.butt@linux.dev, eddyz87@gmail.com, andrii@kernel.org, ast@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:12=E2=80=AFAM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Tue, Nov 18, 2025 at 03:37:09PM +0000, Matthew Wilcox wrote:
> > On Tue, Nov 18, 2025 at 05:03:24AM -0800, Christoph Hellwig wrote:
> > > On Mon, Nov 17, 2025 at 10:45:31AM -0800, Andrii Nakryiko wrote:
> > > > As I replied on another email, ideally we'd have some low-level fil=
e
> > > > reading interface where we wouldn't have to know about secretmem, o=
r
> > > > XFS+DAX, or whatever other unusual combination of conditions where
> > > > exposed internal APIs like filemap_get_folio() + read_cache_folio()
> > > > can crash.
> > >
> > > The problem is that you did something totally insane and it kinda wor=
ks
> > > most of the time.
> >
> > ... on 64-bit systems.  The HIGHMEM handling is screwed up too.
> >
> > > But bpf or any other file system consumer has
> > > absolutely not business poking into the page cache to start with.
> >
> > Agreed.
> >
> > > And I'm really pissed off that you wrote and merged this code without
> > > ever bothering to talk to a FS or MM person who have immediately told
> > > you so.  Let's just rip out this buildid junk for now and restart
> > > because the problem isn't actually that easy.
> >
> > Oh, they did talk to fs & mm people originally and were told NO, so the=
y
> > sneaked it in through the BPF tree.
> >
> > https://lore.kernel.org/all/20230316170149.4106586-1-jolsa@kernel.org/
> >
> > > > The only real limitation is that we'd like to be able to control
> > > > whether we are ok sleeping or not, as this code can be called from
> > > > pretty much anywhere BPF might run, which includes NMI context.
> > > >
> > > > Would this kiocb_read() approach work under those circumstances?
> > >
> > > No.  IOCB_NOWAIT is just a hint to avoid blocking function calls.
> > > It is not guarantee and a guarantee is basically impossible.
> >
> > I'm not sure I'd go that far -- I think we're pretty good about not
> > sleeping when IOCB_NOWAIT is specified and any remaining places can
> > be fixed up.
> >
> > But I am inclined to rip out the buildid code, just because the
> > authors have been so rude.
>
> Which fstest actually checks the functionality of the buildid code?
> I don't find any, which means none of the fs people have a good signal
> for breakage in this, um, novel file I/O path.

We have plenty of build ID tests in BPF selftest that validate this
functionality:

  - tools/testing/selftests/bpf/prog_tests/stacktrace_build_id.c
  - tools/testing/selftests/bpf/prog_tests/stacktrace_build_id_nmi.c
  - tools/testing/selftests/bpf/prog_tests/build_id.c

This functionality is exposed to BPF (and PROCMAP_QUERY, which has its
own mm selftests), so that's where we test this. So we'll know at the
very least when trees merge that something is broken.

>
> --D

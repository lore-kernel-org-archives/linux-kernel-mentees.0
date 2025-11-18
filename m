Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E72E889C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494082; cv=none; b=eoyw3CeKtlFznUoneKJitZvaxJEk4gVQdL1K7o43EGo7ehqZxDpkyzcH2v7lL8eERAt7Y0As9DgprJ5mwb4jDVCs0DrH4aDqqjgd4qZWBRZE4eosazL3hmkwrj/LuRqbNQ6C/CP4GyqFsWBU5/JaF5dZDz8ubAcy1fwbg79fcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494082; c=relaxed/simple;
	bh=CEu2HX49eMyL/fkGI6RcH7NRGSH9WLfbLJE7zmZxVOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqlyMkrZ3jdBmZYH5udpcVyNQyDYlJcftDY1zojeUtlP/jZ3z9LCPMGge8K1V6Vkckgp5DMfwY55jNw7tORSKJ08CxmqErqAm0uw4AUHz2jYn0AjEzoILRQ/tZ/oAR6wT+40vF75Mh2aKSh+754ceetkf3idIq3OsI2N59lWgRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgxUm9Sx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgxUm9Sx"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so6548523a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763494080; x=1764098880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doC9uXNUqoKejMIunGd/jGTKolDii5Qguk+TBihyyxM=;
        b=FgxUm9Sxze5l4N00eeM6MoJz2qkeRU6pMC+ozEsHQlycESgctKbpLy4FolMSChnIMl
         ShIkAmEFSFpn9ycWd6aJSDXpQDlxF0SFPMumhPT/oIAs5FLMN6wvZpsKXt5C1TkuLN4y
         KXNwbZv56gzs3dZZ/Bo2QTCI/fTLsVKbCpjR0zPWXxlyCNFgEW3ccvUXwmjgceHA9ZcT
         Msssmn3H/BFvfEcUFN4rGI3j9RB44gxaXjsM37E94p9282gt/9Y0pdBrLOT49TjyKWQR
         CMCXicxeZ8BjEmmc8pTRb80gFeHGi+WgnIevziWax8xdpauA87UMEAj86rGSHMDQ3jsz
         GJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494080; x=1764098880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doC9uXNUqoKejMIunGd/jGTKolDii5Qguk+TBihyyxM=;
        b=DkWRJszSFnEQGf4tEBA6+nFCSTH0IySBIt55Eh8yPIMoJ+4u/j38F/RPSqmQqCbgCT
         y6yUncA9TuILfeOTXMu3Yp3s+Pp89GLfLkb6KQT4sBXP+En7Y/wsw4qzn9WnAVM8XfUW
         nK7YDT+ZcrYHWMFHGwyI2ix8hdSyKjnQGtUhwUnerG6GdSoHn5OLAh8818j8GwxLnNAb
         1t/hKwlfNakpKhHiYbAzSM5KN1L4x8P5QdFs/1o9Jvxfkhs9bTPYwx25vdKpPipaOvd5
         60AN0PnNfzL1vN6u8ME8Ns+zNDKjyPsBiEOuAKO9znOnnA+y3BMZ5w0QbHbvh/8nkk3o
         oFug==
X-Forwarded-Encrypted: i=1; AJvYcCULMts1NjqAzRdt1wug/YG0+EsDScnVPNlnUnl8DP+If88nTuml3TP+bMHnCMEqgGOnPI25VSsMcwfkk3A1gne2b0XBvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAncVo7SNmRzSqI6v2RieDg8ytVA46rcyEzTgHTe4dNg9NG7pG
	wiSsGDLFvzlrcCQ6K0KprivixtIAa8PghiHah2Vk9JrE5rsZJpyBdqCyK9hW6XILG/j4Cs0IpOX
	NCKHoDdsDhdo0KWXvLQMUCtYnC44Hw4k=
X-Gm-Gg: ASbGncuUq5T5VshDXqMSPRMxFNsiVcAr8FmroGnSAa+XyXJ+F2pijFR5zjEpW865JlY
	FWDMAfu2VGKrEEPNA7R+JbT3bXA/DFrNmQ82NvlI+udq84ara83FMaByHWxANBNdnQLSvWKZxKN
	+h65vgqriHdHmWcOxqgaSLfpyKRFB6At0OO2b6KV91YHUxm/X0Nyaon2xYXbYlr3R5WhAB/ZGEa
	4jTIl2Fd6DxxldLnmioJfarYraurIBI5mNdtKteEJELtKpIb3Q8nEtdismMj5YDM37N06ynFU+P
	OLx8tCHVwZ2dpvrhFggOCA==
X-Google-Smtp-Source: AGHT+IG58zG+XluUaIiZAZv9m1uRF7fwmOmXIq4KeWpc40NILlovsL0nA2fYLe6y5JHtEDDylDzt5ytVO+jnJ5EKrZo=
X-Received: by 2002:a17:90b:2788:b0:340:ad5e:cb with SMTP id
 98e67ed59e1d1-343f9eaa41dmr17041894a91.8.1763494079727; Tue, 18 Nov 2025
 11:27:59 -0800 (PST)
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
 <aRxunCkc4VomEUdo@infradead.org> <aRySpQbNuw3Y5DN-@casper.infradead.org>
In-Reply-To: <aRySpQbNuw3Y5DN-@casper.infradead.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 18 Nov 2025 11:27:47 -0800
X-Gm-Features: AWmQ_bn356VQg7AFLndJgLd27HF_zQfgIMoqrhbk6mAt-2PXr32Xi9lJz8Nh9GM
Message-ID: <CAEf4BzY1fu+7pqotaW6DxH_vvwCY8rTuX=+0RO96-baKJDeB_Q@mail.gmail.com>
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
To: Matthew Wilcox <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>, akpm@linux-foundation.org, 
	shakeel.butt@linux.dev, eddyz87@gmail.com, andrii@kernel.org, ast@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 7:37=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Nov 18, 2025 at 05:03:24AM -0800, Christoph Hellwig wrote:
> > On Mon, Nov 17, 2025 at 10:45:31AM -0800, Andrii Nakryiko wrote:
> > > As I replied on another email, ideally we'd have some low-level file
> > > reading interface where we wouldn't have to know about secretmem, or
> > > XFS+DAX, or whatever other unusual combination of conditions where
> > > exposed internal APIs like filemap_get_folio() + read_cache_folio()
> > > can crash.
> >
> > The problem is that you did something totally insane and it kinda works
> > most of the time.
>
> ... on 64-bit systems.  The HIGHMEM handling is screwed up too.
>
> > But bpf or any other file system consumer has
> > absolutely not business poking into the page cache to start with.
>
> Agreed.

Then please help make it better, give us interfaces you think are
appropriate. People do use this functionality in production, it's
important and we are not going to drop it. In non-sleepable mode it's
best-effort, if the requested part of the file is paged in, we'll
successfully read data (such as ELF's build ID), and if not, we'll
report that to the BPF program as -EFAULT. In sleepable mode, we'll
wait for that part of the file to be paged in before proceeding.
PROCMAP_QUERY ioctl() is always in sleepable mode, so it will wait for
file data to be read.

If you don't like the implementation, please help improve it, don't
just request dropping it "because BPF folks" or anything like that.

>
> > And I'm really pissed off that you wrote and merged this code without
> > ever bothering to talk to a FS or MM person who have immediately told
> > you so.  Let's just rip out this buildid junk for now and restart
> > because the problem isn't actually that easy.
>
> Oh, they did talk to fs & mm people originally and were told NO, so they
> sneaked it in through the BPF tree.

This patch set was never landed and has *NO* relation to the
lib/buildid.c stuff we are discussing. There was no sneaking anything
in. The patch set in question that added folio-based reading logic was
developed in the open with both mm and fsdevel in CC. Matthew himself
looked at it, he NAKed page-based initial implementation but suggested
folio-based one ([0]). Shakeel did review this (the patch set went
through 10 revisions, plenty of time to object).

  [0] https://lore.kernel.org/bpf/ZrOStYOrlFr21jRc@casper.infradead.org/

>
> https://lore.kernel.org/all/20230316170149.4106586-1-jolsa@kernel.org/
>
> > > The only real limitation is that we'd like to be able to control
> > > whether we are ok sleeping or not, as this code can be called from
> > > pretty much anywhere BPF might run, which includes NMI context.
> > >
> > > Would this kiocb_read() approach work under those circumstances?
> >
> > No.  IOCB_NOWAIT is just a hint to avoid blocking function calls.
> > It is not guarantee and a guarantee is basically impossible.
>
> I'm not sure I'd go that far -- I think we're pretty good about not
> sleeping when IOCB_NOWAIT is specified and any remaining places can
> be fixed up.
>
> But I am inclined to rip out the buildid code, just because the
> authors have been so rude.

Can you please elaborate on "authors have been so rude" a bit more?
Besides that link to an absolutely unrelated patch set?..

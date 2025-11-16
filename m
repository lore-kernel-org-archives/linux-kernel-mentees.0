Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19418223DCE
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Nov 2025 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763271836; cv=none; b=ClabBjehARV4Wj37BYH0gDexi6ZSL9eUh1R6MiYIuGZU8VpJL2f5DjSL7R3pa2EgIKqBwTuHuNWUJjgqjzhfYYVhYofvXFAU/rpt0L93bcm2+TZTfF45uxvTia7/BnrbcvDfpNMyXSPfqgnaAIcr66dobrtZ6x2SkIA8xnl5rmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763271836; c=relaxed/simple;
	bh=eoJw2Efup2w2YVsLo4aqrneZqPKDdsmFPYUMFj/63dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1LKUTXDXLe9khobbEIHuncYzOBvmMSnys6WnzZlL9uI9wN+zlpvwnIC8Gybh50FHaTBNsQoK2nlsYzgNtqSzJpjtptVmfp//cle+hi3i+8UafD2nX1oqT63u6qFk9Beu5maruu2NGdk1bVWwiMDKssIjkvTz5aYlyhipEi3WEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=K2o7DhOm; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="K2o7DhOm"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-641e942242cso1422706d50.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Nov 2025 21:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763271834; x=1763876634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sirh6NDYx1jXZksmc9REBWYgPRZY1FFJRO7s3p+KRfI=;
        b=K2o7DhOmeck+lRqFIpR4fDFXMs1dI57KImBt/sykdcQoTITfxlyQrg98+NIrZCqZTB
         WDqawgL1AWdnLvcj52of8V8d/y0U62Ilimj31sFdufVCbaEGyZIL0TPpdSlDv3sKL1Mr
         +E+HKuGs809soIjex3eLWB/h2OsbwyKwAsZdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763271834; x=1763876634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sirh6NDYx1jXZksmc9REBWYgPRZY1FFJRO7s3p+KRfI=;
        b=jUe0f6q6E77f+BzR+iUJMweGqu2dnDzukyDWSgrMBCpXtSxmXYR4Ew0B9tQNyZw69B
         LKZxfM7isfxgitjdXusz1b42taAX7/wGhb3k/DHqfHyiDMKG1EVGqFspg+g0SKChj0LB
         9O7LIdWXWyuAS5dwLnINTjegBBXmGwLJ7p2xdrEPC+5pEM7aiYLh+/n13qaz/zPQ8u89
         RVhtOW1hhXpWZCjF1uAqO/9FBJ+KMRe42LPP1fF3TrhMR9fMLy8olF3jARoE2aneNue2
         uhXQlisFF835gL9qu8VxSTTLz/tbbbZ3qR1wKvzZABgrVZqfFzwaNRoFQ3VgI5f9Y+eu
         xl9g==
X-Forwarded-Encrypted: i=1; AJvYcCXZSwlI+9eLyqpEZuD/CH2ZrUAg1lhfWvB7/mUzNQqt35Jrd5UPaO3yCzfUxSijLc9FpNlM40oWNr8b9GORb/qAh1RQVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoVBN7EjbStu35/lMxnLMtfPUtg2lrSvTpwWo0Ej2Eg2qO/bT5
	nADjJQ2VnCE63IjJBqUViQ3bd5CfojTcASlKTGhXnvaPpIDgzpXgxHnSe9ZKmxgiFBHP3/miK7H
	iWb8u2VOgv+17xr0KuJKYJbV8GK7is537++iDt135Og==
X-Gm-Gg: ASbGncuYlKVHwvl274izUpiqiHRAL7H1vB1DTc8AljbYFFx5Cgt2uDTQdqLsjVs0h/6
	0Im82LtplTlc7aIbHxBgEDm/K9yuhy6d3AzyRd1AXGbhJpPajPZukpCpEF2aE6vA6Mb0TusQLYO
	r0k5EpBxXbTEMXjYQsX39yiYtXbMIw80toBaovyfAf2BkvKkfdfKtgqNAQLUd8HzIDAPEMbINKe
	BvbgOs9gpIpXbxXdoCooLGsW8gz/AfyDf9dE859EkDAE5HSg4Uq2obyfoGQjrMx2LQ7HLA6vwau
	BafRdhGze1ZUEIRMbo5+O1NN9Sw/KQ==
X-Google-Smtp-Source: AGHT+IE+5DA78oTs53xtft4SWvilkCaz3ny9tzlKa2iQLr6n4dDJdZ1qZa1fVJLBqkojTcs9rHz8X3gNdwixSxrbVqw=
X-Received: by 2002:a05:690e:4296:20b0:636:d63e:5c1f with SMTP id
 956f58d0204a3-641e7681ef6mr5755482d50.49.1763271834121; Sat, 15 Nov 2025
 21:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114193729.251892-1-ssranevjti@gmail.com> <aReUv1kVACh3UKv-@casper.infradead.org>
In-Reply-To: <aReUv1kVACh3UKv-@casper.infradead.org>
From: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Date: Sun, 16 Nov 2025 11:13:42 +0530
X-Gm-Features: AWmQ_blIHXWGYcdl0Doxe099dF8-mjHoCOkxYkSY-L1Qbxh_adlvYQhe5rWPRrM
Message-ID: <CANNWa07Y_GPKuYNQ0ncWHGa4KX91QFosz6WGJ9P6-AJQniD3zw@mail.gmail.com>
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, shakeel.butt@linux.dev, eddyz87@gmail.com, 
	andrii@kernel.org, ast@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 2:14=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sat, Nov 15, 2025 at 01:07:29AM +0530, ssrane_b23@ee.vjti.ac.in wrote:
> > When read_cache_folio() is called with a NULL filler function on a
> > mapping that does not implement read_folio, a NULL pointer
> > dereference occurs in filemap_read_folio().
> >
> > The crash occurs when:
> >
> > build_id_parse() is called on a VMA backed by a file from a
> > filesystem that does not implement ->read_folio() (e.g. procfs,
> > sysfs, or other virtual filesystems).
>
> Not a fan of this approach, to be honest.  This should be caught at
> a higher level.  In __build_id_parse(), there's already a check:
>
>         /* only works for page backed storage  */
>         if (!vma->vm_file)
>                 return -EINVAL;
>
> which is funny because the comment is correct, but the code is not.
> I suspect the right answer is to add right after it:
>
> +       if (vma->vm_file->f_mapping->a_ops =3D=3D &empty_aops)
> +               return -EINVAL;
>
> Want to test that out?
Thanks for the suggestion.
Checking for
    a_ops =3D=3D &empty_aops
is not enough. Certain filesystems for example XFS with DAX use
their own a_ops table (not empty_aops) but still do not implement
->read_folio(). In those cases read_cache_folio() still ends up with
filler =3D NULL and filemap_read_folio(NULL) crashes.
Since build_id_parse() only works for true page-backed mappings, I think th=
e
most reliable fix is to fail even earlier in _build_id_parse() before
we even reach the filemap path:

    if (!vma->vm_file->f_mapping->a_ops->read_folio)
        return -EINVAL;

This catches XFS+DAX and any other filesystem that lacks ->read_folio,
and it fails fast at the correct layer rather than deeper in mm/filemap.

I think this is the right approach. I=E2=80=99ll send a v2 shortly.

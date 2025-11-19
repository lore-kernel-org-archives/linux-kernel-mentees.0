Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1930AD0C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572347; cv=none; b=Lz1/hQpMsbDT9DWpWKxvAHu/QZ7DZF/Sqlw4PEPYmAdaqYuqpTUJ/9WMhn3vLQpxOtCoznwR9KjqfO3ZJmP3vDF7HjDo02SQgzwHEu8kWhgqMsfS6aCHGo+jjlzb1f5s3/zW7/V4dKLFcjFETNR5CWz3TI+N+JIYCktMdWGttWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572347; c=relaxed/simple;
	bh=w6kqF6fnUpsB/PZ9jA+/sWDdgtjvStdMKkxAgqfj548=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/atzuAQaXb+jggX73zSO+mfBKjUxc8hFKToBl4Tv2RkT/lb76VMiYjJCl1vj6ZX8FQhr2VtGLhQ46UpQl9y/9pcRO86nOKGTQ7ZPlQax/LnPmwwkxrzOpqvPlT3vaNBDON2CtdHvcqlJ+H/65XgTRnONoIS0IJHItzFz6oWv0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRUBRyxc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRUBRyxc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343514c7854so1048505a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 09:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763572345; x=1764177145; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lttwGYno15TKpeAV3UohAgRcGG4eYP6EQ60N4Vw7zBA=;
        b=kRUBRyxcL8iVHIB8KAwx9Oarm45OMwAplLB4l7hc6zPf0ee1k2G93Ycqr4D4cC49BK
         arDBaLZYE87Ko49pGNw6jnt8AQFNPDfNrIbXscrrhwxuqvPtdbeLxPpDKVhzh5KYLmq4
         Q1/TATi09oFcLNMNxw0LZ55RiBJ3nUQqNdXA6XXxvdbiSIvBGzLo4IUBUNL0p+KZtcm9
         geHDloKuL16cMIMarJ7ldR0eFVXRZdKRSSP1MjPZHUI9XgiYaHmHXYZy7cLGt+KdmL2m
         n7fzhJ3WjVVQ8dKnqq68KcRMhEaCsA+crL4Yjk84b1K+Fo1Cc3fQOl2RQkPXKk8CSviT
         zv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572345; x=1764177145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lttwGYno15TKpeAV3UohAgRcGG4eYP6EQ60N4Vw7zBA=;
        b=p6gyX+/9+SWeDwTPMXlb9n1J1IzyA6UiEhIGrytEjq1h/3bCpHzzXb/wkNbUMWQ679
         RqfLne8rN5q4gdcHjA6Kfc8F2CP51lukcmV4PTmDUuv8DRbYyDgx+EesElgF4AsAF/9m
         gSP7gy1qWjpxhNp1+Y3qU5DpWxEPJ/qHwWBnq/DcdnpJ5rqUaRTGHOA0WlWaa1J1OHx9
         WUpWJYhWWxhvMqy4CBYIeoS+y393eU9Xa3BcrlKcvIVh4qeCHUpu5bAAKVCScZivdtp7
         brZR0QNM66WM9NLgsevclTs3dKfX8E/lhy/OVVojuqaQUK/Ur+HoNq+JxSA6Wo6Ezwp8
         1YBg==
X-Forwarded-Encrypted: i=1; AJvYcCV3pfyirAwuM3rnSpvKpKitNjIyFCcty3hiXriVcPSjIczArVw/QLJfiKVBzOsbNHgpgEGKeNHELy7XvFWyhgudr+vrZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvI68e1Lmq7QblOEdHGGU9SNDEEoAhx5/jAMP1p2gs+9c9R1Ns
	qUtuxlZ3cw2mIHqQSkeo/VJE8QdJm49mTmP6tsWY0l+SEzTjfoajwE1WgHp8zKYGQ3ZWGBjc6St
	ii3Isp66MPFisBjOB0bYwN2HnFz14DvM=
X-Gm-Gg: ASbGncvvpB1XGXjE0u3Z/3lgOBB+LbkBa+7jehNHdge99/v+/FGOk2ttckMpmCL4Z1S
	KYv6nmoTaWj/FU/eMnUbt2UqB1qOsybeNdDu8tgQygfpUSvYrtMr8xuBjHxArlieVWUt7o2gIOH
	jEJOObHgkPTUE1fgcJ2QtIwo3EnWqjzXxkz2zCATHWt6vqjcEQ25XNPBYHnTWWLETvFVNf94lOe
	e13G0yLL/oTXlxJHasPHq8fxMmyVago2nyka1bJIHecb65nSqyI8nGCIge7/t0u5SCBwKu6Fq4C
	NCHHKmnYlE8zqawK64cBGQ==
X-Google-Smtp-Source: AGHT+IF9TqhCM5sftaGQEl9XduGer2CQZxEu8IUrH3eRt+kYJfd47IRIpaKq9Ngl12wdt9H+9C14CbQPOOKDWoLkN3c=
X-Received: by 2002:a17:90b:51cd:b0:343:7410:5b66 with SMTP id
 98e67ed59e1d1-345bd1fb660mr3491803a91.11.1763572345294; Wed, 19 Nov 2025
 09:12:25 -0800 (PST)
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
 <CAEf4BzY1fu+7pqotaW6DxH_vvwCY8rTuX=+0RO96-baKJDeB_Q@mail.gmail.com> <aR1awLOhdOXNMl9c@infradead.org>
In-Reply-To: <aR1awLOhdOXNMl9c@infradead.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 19 Nov 2025 09:12:13 -0800
X-Gm-Features: AWmQ_bnhWvlGu_up0m2ui85unGpA2DRPQC9h14GAV7wAvQEwMdsyPJvZ2JIRYok
Message-ID: <CAEf4BzYWBUE0VseYgoa4r+UndxiOdCWazZ5FgZxi=dfhXaM16g@mail.gmail.com>
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in do_read_cache_folio()
To: Christoph Hellwig <hch@infradead.org>
Cc: Matthew Wilcox <willy@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>, akpm@linux-foundation.org, 
	shakeel.butt@linux.dev, eddyz87@gmail.com, andrii@kernel.org, ast@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 9:50=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Tue, Nov 18, 2025 at 11:27:47AM -0800, Andrii Nakryiko wrote:
> > Then please help make it better, give us interfaces you think are
> > appropriate. People do use this functionality in production, it's
> > important and we are not going to drop it. In non-sleepable mode it's
> > best-effort, if the requested part of the file is paged in, we'll
> > successfully read data (such as ELF's build ID), and if not, we'll
> > report that to the BPF program as -EFAULT. In sleepable mode, we'll
> > wait for that part of the file to be paged in before proceeding.
> > PROCMAP_QUERY ioctl() is always in sleepable mode, so it will wait for
> > file data to be read.
>
> That's pretty demanding:  "If you don't give me the interface that I want
> I'll just poke into internals and do broken shit" isn't really the
> best way to make friends and win influence.,

Did you read the second part of my reply? The functionality in
question ([0]) was developed in the open, over multiple revisions,
with both mm and fsdevel mailing list CC'ed. Matthew Wilcox did look
at this, provided feedback and suggestion to use filemap_get_folio() +
read_cache_folio(), which I did incorporate.

  [0] https://lore.kernel.org/bpf/20240829174232.3133883-1-andrii@kernel.or=
g/

>
> > If you don't like the implementation, please help improve it, don't
> > just request dropping it "because BPF folks" or anything like that.
>
> Again, you're trying to put a lot of work you should have done on
> others.  Everyone here is pretty helpful guiding when asking for help,
> but being asked at gunpoint to cleanup the mess your created is not
> going to get everyone drop their work and jump onto your project.

Gunpoint, really?.. Am I not asking for help to improve the code? This
functionality is being used, and we can't "just rip it out" as you
propose. Let's fix it instead.

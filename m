Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50B30E0FB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Sep 2025 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604314; cv=none; b=O1H09ZNjFeQD/CypYLHpyS3toch+RTSLDCKL9y4IpWMmp86J8OWEGcZWd9EPwiNEA4mReteWnlAUiD3UYTDN3qPhmEifZP9T0PKHmyOBUjerdMAZNioB2RW5/QduGh8Hy1Oe6igDqMWuR04bLoKmN1o0MB81H564SWE2SZgltOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604314; c=relaxed/simple;
	bh=H8oZjwkzLuzCrJu5AgJD/IpchDJW9dBa+Wc3mxEgcyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTMYS/XncCVzfDpB9n0H+kdTIPvaM0wGfsURNmTuDOEmwAhS+zyyuABPirV2Mz73R4Pnt+kef59i1mF7+CMbHIwtC4yoNtc6XhTRzRAibWTOQmyseruN7EMPz6r/AdD6IQtmT8C/OyKivokPNXs4UtpXuCow7E0sSe+AR5ptBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdpIU8w0; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdpIU8w0"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so5696557a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 22:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758604311; x=1759209111; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H8oZjwkzLuzCrJu5AgJD/IpchDJW9dBa+Wc3mxEgcyE=;
        b=WdpIU8w0yYzAk80uaOiU750ct3Hpu01KRubF0JESFbPGA43h7YyQmWIll1S3iOk+sl
         mR1iyAwCQ3bGU4uK303yrOpKOeKlEA1/iovnQ1f65AGrBPW9YGFhXjyxHgC1/jsJTImh
         yNgd/ZwZYczrgwaEWhbeaw+0yIBgblWVtwH2eFEXKsH6D8KzG2mP7MlE3bflfYTq8Nf1
         4N3w/tEGUuaBQJmj1wEChqPV+mb2p1n0Z8XHfUgP6xwUNdjDVfO7J2TZ4b0KUKye6NIR
         vgse26FoHyWEpCawr1yRNLVIqM9MBTLX/0ld2nmWYBQs0Ve9GdkkcXbV23HFoqYyGmOB
         oBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758604311; x=1759209111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8oZjwkzLuzCrJu5AgJD/IpchDJW9dBa+Wc3mxEgcyE=;
        b=ThmaApLSGLHvrTZ8Y8s97mSijpyuGymBvUgVbJUOPJGKwm0URQ8NN7D9Ojc1LDCt+Q
         pBNyoN+AdhuFS25ect92F+WDppKq3z6MOEZHLyyhM3gH3uTg85C1gyFiPvkitXwGHoz/
         uL3veIacvXZYP+pnC0J9r/qOxWR6b6QyRX8jr6sfaOdxpG76/jz1e5KeS/IiHgYj9hVd
         rSIbh65EA1IJ3kMMtpTBRnC8FDwF9Yv2ffAkEW5JZRuuZdNGXtQVm5KAC9x7OE4Imzbc
         FCDeaB67uNztmnBzWYuTqxu0SLa7HJLLnGZKmZn9NXmo9fr2sHkOvCYvGL1A+y1XtsXq
         Tqbg==
X-Forwarded-Encrypted: i=1; AJvYcCWmLUpMgdGMo/5TkeBWzyiDfowmteOTqAoDMpi1U0epqe6V0TViw1lR1vIs/trtgpMIn1RkjfhKtfCLINGd1hwdu8jzIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzORY/yy+jaP1HgtXjzL0LGmk4yHiUlIKe00nIu3gCGDnd3nlMR
	SsK1ulco7PJkNCZFSMQNcI9DCHY3SQdFNFN8rEvh6baRTD+7yRWRCQ14of1TJVYm7NenXgNN2Hq
	eyKZsmFbomU0QZ2SBKnZHOpRfrwikPqc=
X-Gm-Gg: ASbGncuCb5TwIaNgM1UhIbY31CK+v7g4WVbXqDG3QkRpvFnk9GgL57ElvLR/htMx0M5
	Iuy7sOPk/pLYDjq5P6cCvou0OzzsxFRgBZUMHDyI4Ev5LN5uWI7M6ewmBa5v1RevO4K0PaS/RgD
	n9Eh2eXlu0gFbMDpjRRvdt+T+RzmDx9OJY45tFdIVm/DK44h+1APT29/wAITuatM0Kk5H98Nbr4
	Uh1Bu2MfVAtQkfohHYcexj3EZWOkJX6zxbyafB5KakqFWxYavz63Q==
X-Google-Smtp-Source: AGHT+IEPRdvpieHJw8RRRxoSE2PSWeDmEsF3LD8Vt0hJlWeSXhWvyc1YF2YZ1JHwU/y/0MfHKNaPmCTEz9q/HlDi2A8=
X-Received: by 2002:a05:6402:4311:b0:631:b058:bf04 with SMTP id
 4fb4d7f45d1cf-63467812253mr1028138a12.19.1758604310599; Mon, 22 Sep 2025
 22:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250922170357.148588-1-viswanathiyyappan@gmail.com> <aNGOnDb0WsIbk2zx@hyeyoo>
In-Reply-To: <aNGOnDb0WsIbk2zx@hyeyoo>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 23 Sep 2025 10:41:39 +0530
X-Gm-Features: AS18NWAz93VsrUOfHCTB4kaK6hHURodNuYHUG5D8F71sybC2WG0KWMO2FAQjnLQ
Message-ID: <CAPrAcgM=-2dvHg5yvsqtT_YfjH-gThc+iGZGJpc8gpKbg-OdrA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/slab: Add size validation in kmalloc_array_* functions
To: Harry Yoo <harry.yoo@oracle.com>
Cc: vbabka@suse.cz, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linux.dev, 
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 23:30, Harry Yoo <harry.yoo@oracle.com> wrote:

> When bytes > KKMALLOC_MAX_SIZE (8K on my system), kmalloc redirects allocation
> to the buddy allocator, which can allocate up to (PAGE_SIZE << MAX_PAGE_ORDER)
> bytes (4M on my system).

In include/linux/slab.h,
KMALLOC_MAX_SIZE is ultimately defined as PAGE_SIZE << MAX_PAGE_ORDER and
KMALLOC_MAX_CACHE_SIZE as PAGE_SIZE << 1

I was using those definitions

> Because allocating a page with order > MAX_PAGE_ORDER page is never
> supposed to succeed, the caller of kmalloc should be fixed rather than
> kmalloc itself.

So, Is it almost never a good idea to add new validation in the allocator code?

> I think the right fix should be to return -EINVAL in max_vclocks_store()
> if max * sizeof(int) exceeds PAGE_SIZE << MAX_PAGE_ORDER?

Thanks, I will go ahead with this approach

Thanks,
Viswanath

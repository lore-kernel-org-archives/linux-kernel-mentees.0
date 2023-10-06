Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BADE92FF2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 07:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1DCF80E39;
	Fri,  6 Oct 2023 07:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DCF80E39
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k0DXNjy0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-1BTO4DZ6Gu; Fri,  6 Oct 2023 07:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 99EC180DB2;
	Fri,  6 Oct 2023 07:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99EC180DB2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D136C0071;
	Fri,  6 Oct 2023 07:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DE47C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 07:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220BF8235B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 07:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 220BF8235B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPweJYdFw6bL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 07:09:43 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B778E81FAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 07:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B778E81FAF
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53639fb0ba4so3132532a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Oct 2023 00:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696576181; x=1697180981;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=V5ladE5tkTaw6kg06jFlVzHqN5oLjCVd34OCxyKLMKo=;
 b=k0DXNjy0n7vvPmjE2ttzLO2SYT1B9hNqqzzn6iQo/EaavPgvJy3RPOOSCSdkSa/U8Q
 kibmJ/g69hPXEHisQVJwIy/6wGBbEgJTE1rMZRqluGDWm+tMI4c+G7eel3gVu+H1m6n9
 mCAP9xc86PUBBUOD/EXbEZ9NdAJL8C30ZwAbX+V1eXEdMDocQ++B+tiB3UIyYWf0qDbt
 D9p6iYrty8dt+EisX3cUVLlb78b0Be/wxE/Aev7qeNSd5rnSqwTQUG+wEelMYAuHRICK
 GcTjTI1huAJPncyem6pZKVVH4405KAcswqFjnEr0oiaTOsXkbt2t/4V6Y4lVcpi4/Dgd
 9ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696576181; x=1697180981;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5ladE5tkTaw6kg06jFlVzHqN5oLjCVd34OCxyKLMKo=;
 b=Wd6yjHfqTyMKpVNYjeHmIxnZA3WD2Stg5Bxin3r1ealBnoxz3Za4ar/wWqGq8wQev3
 EvuRhm6i9VvpkySBOpF0UCKntho0Mec04al9sSINvWPV7RU172LwDG7qVis1QDU7i1Tb
 KDpod+NH6r0L4JCbuD68x5vVbCWLXP6EGF/jJfFeARaRG8CUPnsyyX3PLhvT53ym+5ap
 pwzH8M+3ombaNGpYLvrlVTVfABfuBO92e2rAwwJ9d2wPq/W7gEt0SVJSb8Gfj6KhpdXD
 irAMcTCyln1izxOf7aViWMxS0Nbdf2I9xCLE2jSJ2F1uFltIhcsmLuX+RcvQnD1nOTvV
 b3VA==
X-Gm-Message-State: AOJu0YymYr8mUq9uwvrSUDiXVcJ5Gw2sdMut7lPKihYsGpC2XSdnTjIC
 CE22Qk3cUXT82pK4kLDqeXqImhSipmlBbvMu
X-Google-Smtp-Source: AGHT+IEhkKlWhY9En4mCZRCfskhgcjCs7rAtjGq2BhW+LxJgq8JJ78L9ycc/ObnygNJjxQHecLZ7+A==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr7661985lfb.48.1696576169648; 
 Fri, 06 Oct 2023 00:09:29 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.57]) by smtp.gmail.com with ESMTPSA id
 r26-20020ac25a5a000000b00502c6dc612fsm184811lfn.219.2023.10.06.00.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 00:09:28 -0700 (PDT)
Message-ID: <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
X-Google-Original-Message-ID: <ZR+yfWLkv4rrr0i6@akanner-r14.>
Date: Fri, 6 Oct 2023 10:09:20 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
References: <20231005193548.515-1-andrew.kanner@gmail.com>
 <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
Cc: xuanzhuo@linux.alibaba.com, daniel@iogearbox.net,
 maciej.fijalkowski@intel.com, hawk@kernel.org, edumazet@google.com,
 aleksander.lobakin@intel.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 syzbot+b132693e925cbbd89e26@syzkaller.appspotmail.com, bjorn@kernel.org,
 ast@kernel.org, jonathan.lemon@gmail.com, kuba@kernel.org, bpf@vger.kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com,
 magnus.karlsson@intel.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Oct 05, 2023 at 06:00:46PM -0700, Martin KaFai Lau wrote:
[...]
> > diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
> > index f8905400ee07..c7e8bbb12752 100644
> > --- a/net/xdp/xsk_queue.c
> > +++ b/net/xdp/xsk_queue.c
> > @@ -34,6 +34,11 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
> >   	q->ring_mask = nentries - 1;
> >   	size = xskq_get_ring_size(q, umem_queue);
> > +	if (unlikely(size == SIZE_MAX)) {
> 
> What if "size" is SIZE_MAX-1? Would it still overflow the PAGE_ALIGN below?
> 
> > +		kfree(q);
> > +		return NULL;
> > +	}
> > +
> >   	size = PAGE_ALIGN(size);
> >   	q->ring = vmalloc_user(size);
> 

I asked myself the same question before v1. E.g. thinking about the
check: (size > SIZE_MAX - PAGE_SIZE + 1)

But xskq_create() is called after the check for
!is_power_of_2(entries) in xsk_init_queue(). So I tried the same
reproducer and divided the (nentries) value by 2 in a loop - it hits
either SIZE_MAX case or the normal cases without overflow (sometimes
throwing vmalloc error complaining about size which exceed total pages
in my arm setup).

So I can't see a way size will be SIZE_MAX-1, etc. Correct me if I'm
wrong, please.

PS: In the output below the first 2 values of (nentries) hit SIZE_MAX
case, the rest hit the normal case, vmalloc_user() is complaining
about 1 allocation:

0x20000000
0x10000000
0x8000000
[   41.759195][ T2807] pre PAGE_ALIGN size = 2147483968 (0x80000140), PAGE_SIZE = 4096 (0x1000)
[   41.759621][ T2807] repro-iter: vmalloc error: size 2147487744, exceeds total pages, mode:0xdc0(GFP_KERNEL|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
[...]
0x4000000
0x2000000
0x1000000
0x800000
0x400000
0x200000
0x100000
0x80000
0x40000
0x20000
0x10000
0x8000
0x4000
0x2000
0x1000
0x800
0x400
0x200
0x100
0x80
0x40
0x20
0x10
0x8
0x4
0x2

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

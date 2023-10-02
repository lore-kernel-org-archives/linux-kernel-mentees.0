Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B0E776CE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 22:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 393FA81FF6;
	Mon,  2 Oct 2023 22:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 393FA81FF6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QQs0PTZO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwC0VmEMcC-1; Mon,  2 Oct 2023 22:03:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D329881FEF;
	Mon,  2 Oct 2023 22:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D329881FEF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAA58C0071;
	Mon,  2 Oct 2023 22:03:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCA95C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89C8F81FF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89C8F81FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcTiO1Btzt1V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:03:42 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0542581FEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 22:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0542581FEF
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so4458958e87.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 15:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696284219; x=1696889019;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GcfuhtzVzjDNtRj4QA4ePrsnxqf+lMTsaZP4TTaHfSU=;
 b=QQs0PTZOe1dSs7a2+qM5zgdSvEa6OIqNo0fbnsEscWLU6wuXP1LnSoq6TKQb6ckQyK
 Cto9uxOGT5cKURAau7yORBVeZ3lIlMp2MF2Jnvb/uGVaA566IETUKEYOnyYHsqnyl+9r
 vN8l04/sAiLHg+AWtpc0P/RiMleOr/3O+JFGrI3hNPpJUfA0qLbvnBg5luwiNdEPuUw8
 4lwqiii4VTcBgzmgVKl+MR1KoRSCmmV4udf1hMbadtyKmHznGiWzO1o8fUir80EVKZE3
 tJiXbfv2kU81Myy+8WF53Aoo2DfFkzLw7QyXp3p2c1nxRU8fCQrAw/Qr4jFcx4RkgA2r
 pNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696284219; x=1696889019;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcfuhtzVzjDNtRj4QA4ePrsnxqf+lMTsaZP4TTaHfSU=;
 b=eqL28taOaRY8vZAzP2lOVP55LeMOSjYz9EUxp28EK/mFQodynDzafMfCFKX97HZos5
 Txfg2xdvoSvL39QE+7SfB3sxHhgVRA9XrjAMVw1PDuTRA9JkM5Xojo8MVg+Y0dlcLXy4
 WpOqnQD2VsgsQdSsTl2vtE/8I5FYfT/ZHUz4kbevcYm0fD8Eynuz3/VQF6nyZDD6E2ju
 p+TmQby4pDwwDHEYgSH5tvZ1UucLZ4dw83VZdm3o5wWZafiYu+X2G6+BgY4UMfs55iF8
 2NnyZQo9cyC3KX5D9j/bAsnyxjNMMVY3ZnM7pBnxL0IFcZExtQlwMaZa9RooMWunNi+n
 y47A==
X-Gm-Message-State: AOJu0YwZTgxEqCkpAx9p3nbqEisgiiR0Udv5D9lYxRbQO0msEn6F39wD
 ZKgqXvjPAyMtmMtr7K7HKLk=
X-Google-Smtp-Source: AGHT+IEAgHJlYSsgmnfK4UkrJFaksI3FPfgxhdP0pFjvKUKbN9WNfKQ7eecVA+Ftm1fOyG812fGfGA==
X-Received: by 2002:ac2:4577:0:b0:4fe:4896:b6ab with SMTP id
 k23-20020ac24577000000b004fe4896b6abmr708500lfm.15.1696284219160; 
 Mon, 02 Oct 2023 15:03:39 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.78]) by smtp.gmail.com with ESMTPSA id
 w9-20020ac25989000000b005057781cee2sm1212429lfn.264.2023.10.02.15.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 15:03:38 -0700 (PDT)
Message-ID: <651b3e3a.c20a0220.a0ffe.58a3@mx.google.com>
X-Google-Original-Message-ID: <ZRs+NzP9sL5jbhad@akanner-r14.>
Date: Tue, 3 Oct 2023 01:03:35 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v1] net/xdp: fix zero-size allocation warning in
 xskq_create()
References: <000000000000c84b4705fb31741e@google.com>
 <20230928204440.543-1-andrew.kanner@gmail.com>
 <2165e4a3-a717-f715-f7c3-e520d45ec21c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2165e4a3-a717-f715-f7c3-e520d45ec21c@intel.com>
Cc: xuanzhuo@linux.alibaba.com, maciej.fijalkowski@intel.com,
 netdev@vger.kernel.org, bjorn@kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, jonathan.lemon@gmail.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 magnus.karlsson@intel.com,
 syzbot+fae676d3cf469331fc89@syzkaller.appspotmail.com
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

On Mon, Oct 02, 2023 at 03:52:44PM +0200, Alexander Lobakin wrote:
> From: Andrew Kanner <andrew.kanner@gmail.com>
> Date: Thu, 28 Sep 2023 23:44:40 +0300
> 
> > Syzkaller reported the following issue:
> 
> [...]
> 
> > PS: the initial number of entries is 0x20000000 in syzkaller repro:
> > syscall(__NR_setsockopt, (intptr_t)r[0], 0x11b, 3, 0x20000040, 0x20);
> > 
> > Link: https://syzkaller.appspot.com/text?tag=ReproC&x=10910f18280000
> > 
> >  net/xdp/xsk_queue.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/xdp/xsk_queue.c b/net/xdp/xsk_queue.c
> > index f8905400ee07..1bc7fb1f14ae 100644
> > --- a/net/xdp/xsk_queue.c
> > +++ b/net/xdp/xsk_queue.c
> > @@ -34,6 +34,9 @@ struct xsk_queue *xskq_create(u32 nentries, bool umem_queue)
> >  	q->ring_mask = nentries - 1;
> >  
> >  	size = xskq_get_ring_size(q, umem_queue);
> > +	if (size == SIZE_MAX)
> 
> unlikely().
> 
> > +		return NULL;
> > +
> >  	size = PAGE_ALIGN(size);
> >  
> >  	q->ring = vmalloc_user(size);
> 
> Thanks,
> Olek

Thanks, Olek.
That is a reasonable optimization, I'll add it in v2.

--
pw-bot: cr

Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

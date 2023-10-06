Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43EE94139
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Oct 2023 23:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24FD06110C;
	Fri,  6 Oct 2023 23:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24FD06110C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fOGWMeNL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tm8cPF9ZaZkn; Fri,  6 Oct 2023 23:24:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBF5A60F13;
	Fri,  6 Oct 2023 23:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF5A60F13
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E93C0071;
	Fri,  6 Oct 2023 23:24:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5DBEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A8386110C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A8386110C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qbEmzs-EmF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:24:16 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B0860F13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Oct 2023 23:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B0860F13
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5333fb34be3so4669547a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Oct 2023 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696634654; x=1697239454;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=hPaXNBZLQrXq61kgT1VtVRZp5hOGTGuxGwxK2C9WNE4=;
 b=fOGWMeNLlLqSLsO+wLP5O9dWkhU/z/mpXjEAJ5Aq+OIw7zp2tNLIFa2wdQ3Vl5kUKx
 zyMuBrPexjz39pDDtJidNGPyMur7FZOHJa1KK1exzYoXv/1YdfU4I9Q5N2HpspD5+dM0
 DaQpdJRmc244waUhwHx1gQMf2FTc0b5pTcZbsoXk4eKx6vbdimizyF7LFVdd/LGnrqqV
 9A/PtzhTucSEgsX+3lGnTviM9UIhWmCPWiMlkroF70sNm+0BpLqoIJjIL0oN7bEmBLe8
 D84hPLQK/LuzaC0QdSv+OJyybtg1pMRHnLwR3wYdRZ8u2Um4gKIHMFXKrDAkOQgoBM14
 G1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696634654; x=1697239454;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPaXNBZLQrXq61kgT1VtVRZp5hOGTGuxGwxK2C9WNE4=;
 b=EQ4QlEki8EyRp0P8+3oSZ80yAjPkurQk3fEYM1nHMjIK+BLqsAByzP56Aqy/HAZf9Q
 tUZc6OUD/CumlipCFQlDc88Ph6qoHZvkxVA24fC216+NjuO5SuTp1fDxdr5tgiZQ4rD5
 f7ZnSECvrZpaHuke9do6HJlJUpP2tkGPloVoIRHaJFYFoBy3rsOLCesoyttRAVU6zaSH
 TrYcSWskWqVCaUpMZsM/LyZsSb15Y7z7ahJOHzlqdOYzYlWiRl/5HmgJ3e4TI148wuDe
 fPO0LNCoKwSo5qa/2kbKom27tHe8nycnC00Uco+qo4fpHIbNZT+Z014px3ICHefYiOI8
 kVqw==
X-Gm-Message-State: AOJu0Yz0IzY0u+RVZGhXMHGjplDKn6nBd4TKDEFEghT/hAgBkc/na5yO
 qQySXjiKn6EKeDYNS8xRZa8=
X-Google-Smtp-Source: AGHT+IFfto7EAMEg7VApspqL6vAy9RqJg0LXgxG7jOvdtW7oM72tB4A8+dN9tWoFUCe051xP4IEYnA==
X-Received: by 2002:aa7:d492:0:b0:533:39da:6ffb with SMTP id
 b18-20020aa7d492000000b0053339da6ffbmr8401911edr.14.1696634654420; 
 Fri, 06 Oct 2023 16:24:14 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.57]) by smtp.gmail.com with ESMTPSA id
 l25-20020aa7c319000000b0053441519ed5sm3152155edq.88.2023.10.06.16.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 16:24:13 -0700 (PDT)
Message-ID: <6520971d.a70a0220.758e3.8cf7@mx.google.com>
X-Google-Original-Message-ID: <ZSCXFdDLDycRAPxQ@akanner-r14.>
Date: Sat, 7 Oct 2023 02:24:05 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
References: <20231005193548.515-1-andrew.kanner@gmail.com>
 <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
 <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
 <57c35480-983d-2056-1d72-f6e555069b83@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57c35480-983d-2056-1d72-f6e555069b83@linux.dev>
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

On Fri, Oct 06, 2023 at 10:37:44AM -0700, Martin KaFai Lau wrote:
[...] 
> > > What if "size" is SIZE_MAX-1? Would it still overflow the PAGE_ALIGN below?
> > > 
> > > > +		kfree(q);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > >    	size = PAGE_ALIGN(size);
> > > >    	q->ring = vmalloc_user(size);
> > > 
> > 
> > I asked myself the same question before v1. E.g. thinking about the
> > check: (size > SIZE_MAX - PAGE_SIZE + 1)
> > 
> > But xskq_create() is called after the check for
> > !is_power_of_2(entries) in xsk_init_queue(). So I tried the same
> > reproducer and divided the (nentries) value by 2 in a loop - it hits
> > either SIZE_MAX case or the normal cases without overflow (sometimes
> > throwing vmalloc error complaining about size which exceed total pages
> > in my arm setup).
> > 
> > So I can't see a way size will be SIZE_MAX-1, etc. Correct me if I'm
> > wrong, please.
> > 
> > PS: In the output below the first 2 values of (nentries) hit SIZE_MAX
> 
> Thanks for the explanation, so iiuc it means it will overflow the
> struct_size() first because of the is_power_of_2(nentries) requirement?
> Could you help adding some comment to explain? Thanks.
>

The overflow happens because there's no upper limit for nentries
(userspace input). Let me add more context, e.g. from net/xdp/xsk.c:

static int xsk_setsockopt(struct socket *sock, int level, int optname,
                          sockptr_t optval, unsigned int optlen)
{
[...]
                if (copy_from_sockptr(&entries, optval, sizeof(entries)))
                        return -EFAULT;
[...]
                err = xsk_init_queue(entries, q, false);
[...]
}

'entries' is passed to xsk_init_queue() and there're 2 checks: for 0
and is_power_of_2() only, no upper bound check:

static int xsk_init_queue(u32 entries, struct xsk_queue **queue,
                          bool umem_queue)
{
        struct xsk_queue *q;

        if (entries == 0 || *queue || !is_power_of_2(entries))
                return -EINVAL;

        q = xskq_create(entries, umem_queue);
        if (!q)
                return -ENOMEM;
[...]
}

The 'entries' value is next passed to struct_size() in
net/xdp/xsk_queue.c. If it's large enough - SIZE_MAX will be returned.

I'm not sure if some appropriate limit for the size of XDP_RX_RING /
XDP_TX_RING and XDP_UMEM_FILL_RING / XDP_UMEM_COMPLETION_RING rings
should be used. But anyway, vmalloc() will tell if it's not ok with
the requested allocation size.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DE8E92FFD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 06:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A3A8401B1;
	Sat,  7 Oct 2023 06:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3A8401B1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kQKJVVzS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1GQ8V-Onf6g; Sat,  7 Oct 2023 06:56:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 502D64026E;
	Sat,  7 Oct 2023 06:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 502D64026E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C9F2C0039;
	Sat,  7 Oct 2023 06:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD5CBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 06:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9820141DC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 06:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9820141DC4
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kQKJVVzS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMt_cFdSih5f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 06:56:17 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A23EB41D9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 06:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23EB41D9F
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso509744466b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Oct 2023 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696661775; x=1697266575;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YUw7XoLsz41SiLTdb8LgB9w87N22enKZ40wW5PzF0/s=;
 b=kQKJVVzSDHNSuYhtt9P4HexEFGOd1hZj3tu+b3hQ/C23qynmkHFbTx+jpFMbeUOMrv
 fCM0sSOaJrH2jlfab2Px7K18Z+OUb1u7j3ZJ3GrCom6kVURBStD4qsJf6PA3iImNLBhB
 Bm+Qy0FJ6be7x11uaiHn4wmU9pxPiYgCEpMPbXLLsEUyDb0gWlJrCPBE1MCpG64hjSxv
 kgaYoUO5mPisGyJcQoidfx5AWP95EKSVIJkAua8DxB9IeEaVnJQtBD2ixXAuslPrMLaD
 U5mUoWlOsX4FstYySaILjmuM9EPY2RPAer0iPXGULi+n0ZVwfTahaiKD+f4yULXXHJO9
 JaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696661775; x=1697266575;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUw7XoLsz41SiLTdb8LgB9w87N22enKZ40wW5PzF0/s=;
 b=kNdHwas6kiHEGhI2VVOcy00YqlagN6fxIomgFI1YKIlFy8+o7rDErzKet22OVnMlUI
 YFKR03rxBM01S1RZ0HmkE/rjEuhEjdench8tweb7yCT3m9ACQma6MpwIYM5C+JKEsv6V
 0z8oAUHg/6/dwsx8QXZR0TtjUuq0h2URnlUPtYQZJGDgoXAJLyl3UUp2QSK4KuIjObj8
 azEmPGBn29HUyJV6/isecc+g36nTxG2c5he6aIm6SEky5/Wvz49TpWwfuEzWCmVlGKq+
 dQPpEibyKWiiY7FXOx97KgiibOQJ2BcDVThcQAjGTcuCmmg3BQfJTFmLZEc4cGA1Ya0q
 FPbw==
X-Gm-Message-State: AOJu0YySzSEEVXowolbXMER7I5jU/NfFZDteeuA5jTihx4twgBTaY7kU
 jlntkkAv3g3H5Bu8KWGAO4k=
X-Google-Smtp-Source: AGHT+IE9bYWCnyZHBnyoiDrTEX9fuL1lMn3ATCGlp1Qxp0RTtKHcxZd4K4z8vLp4+Z+7rjnr4qBHKA==
X-Received: by 2002:a17:907:7888:b0:9ae:68dc:d571 with SMTP id
 ku8-20020a170907788800b009ae68dcd571mr10124154ejc.46.1696661775293; 
 Fri, 06 Oct 2023 23:56:15 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.57]) by smtp.gmail.com with ESMTPSA id
 rn4-20020a170906d92400b0099bc038eb2bsm3858516ejb.58.2023.10.06.23.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 23:56:14 -0700 (PDT)
Message-ID: <6521010e.170a0220.1f5b5.aaa6@mx.google.com>
X-Google-Original-Message-ID: <ZSEBBY1Xb7vjm0ua@akanner-r14.>
Date: Sat, 7 Oct 2023 09:56:05 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [PATCH bpf v3] net/xdp: fix zero-size allocation warning in
 xskq_create()
References: <20231005193548.515-1-andrew.kanner@gmail.com>
 <7aa47549-5a95-22d7-1d03-ffdd251cec6d@linux.dev>
 <651fb2a8.c20a0220.8d6c3.0fd9@mx.google.com>
 <57c35480-983d-2056-1d72-f6e555069b83@linux.dev>
 <6520971d.a70a0220.758e3.8cf7@mx.google.com>
 <eb61966f-8666-80f6-1eab-c89bffe496b8@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb61966f-8666-80f6-1eab-c89bffe496b8@linux.dev>
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

On Fri, Oct 06, 2023 at 04:58:18PM -0700, Martin KaFai Lau wrote:
> On 10/6/23 4:24 PM, Andrew Kanner wrote:
> > > Thanks for the explanation, so iiuc it means it will overflow the
> > > struct_size() first because of the is_power_of_2(nentries) requirement?
> > > Could you help adding some comment to explain? Thanks.
> > > 
> > The overflow happens because there's no upper limit for nentries
> > (userspace input). Let me add more context, e.g. from net/xdp/xsk.c:
> > 
> > static int xsk_setsockopt(struct socket *sock, int level, int optname,
> >                            sockptr_t optval, unsigned int optlen)
> > {
> > [...]
> >                  if (copy_from_sockptr(&entries, optval, sizeof(entries)))
> >                          return -EFAULT;
> > [...]
> >                  err = xsk_init_queue(entries, q, false);
> > [...]
> > }
> > 
> > 'entries' is passed to xsk_init_queue() and there're 2 checks: for 0
> > and is_power_of_2() only, no upper bound check:
> > 
> > static int xsk_init_queue(u32 entries, struct xsk_queue **queue,
> >                            bool umem_queue)
> > {
> >          struct xsk_queue *q;
> > 
> >          if (entries == 0 || *queue || !is_power_of_2(entries))
> >                  return -EINVAL;
> > 
> >          q = xskq_create(entries, umem_queue);
> >          if (!q)
> >                  return -ENOMEM;
> > [...]
> > }
> > 
> > The 'entries' value is next passed to struct_size() in
> > net/xdp/xsk_queue.c. If it's large enough - SIZE_MAX will be returned.
> 
> All make sense. I was mostly asking to add a comment at the "if
> (unlikely(size == SIZE_MAX)" check to explain this details on why checking
> SIZE_MAX is enough.

Ok, I got it. Will add in v4.
Thanks.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

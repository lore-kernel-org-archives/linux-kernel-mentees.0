Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19117C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Aug 2023 12:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8680141AE2;
	Wed,  2 Aug 2023 12:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8680141AE2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MCHG2V9Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2onHMrxI3D5q; Wed,  2 Aug 2023 12:31:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3186741954;
	Wed,  2 Aug 2023 12:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3186741954
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08BB0C0072;
	Wed,  2 Aug 2023 12:31:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07E3FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 12:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C2741AFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 12:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8C2741AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ldc9TIT_FWQT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 12:31:26 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB3524195A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Aug 2023 12:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3524195A
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31771bb4869so6868765f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Aug 2023 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690979484; x=1691584284;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=M/m/gzewmCnAmIApz3YxUDPf30Sh/dA/f5p9pyqk5tg=;
 b=MCHG2V9Qo/45YT02/1PeUF3/ROIo4tB7le3QDdH/gDTWQJEGR8ADc8EzIqx2OWjJxL
 9UJDBTxx05zFF6tNdsQU5cGmqDSEWya4likKfLq/IUj6S9DjkAQ81DgGhCPpsMNu2IAt
 7M1G+phvyTVzKvXTJEfcP2SjYORFoM3eIkdEG5+0Saz8d1lI7ANmhfb96p6wrDh3MGlB
 r1phEHqoMz9nFD4FoG17Ggqyl8OfaDmvsUZag08zIh+0k/pUDDlz1w4uO9nBzFCHPHVL
 G7OHSocTAWStxv5B7sgxhfkqMnzzJ4w+M1kbdcMjLq6+iXLFNIYek2E2dIrC/tmrOhuX
 ZhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690979484; x=1691584284;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M/m/gzewmCnAmIApz3YxUDPf30Sh/dA/f5p9pyqk5tg=;
 b=TsaPYbLzSTgsikqr+yrxJP2SqF6193QLqoBs2vlo5dq4vvaGXpxCGEG21v4IcGD5CK
 FCWHfU6Y3n6Al3hl59nUAZCsOPxwsrBX2VnZeO4BUvzBdO2lKwqrrkTn7h57r5SiX1Nf
 5q+q0yI4vCCYbKjN7fy97u9RopnzVpnUcjFwz/GUWRPfgdbiTEX/UawNvn6uqWcxxDeC
 ox7Ut4RztEcfnHHaKioOVWxQUzdEKWpNfE/yzQvomlBQGR2f9v00knp1Hzi7WDqbf88C
 nEYtrYOVUGGcdD1kEMgF0u17+9ZTwlO2BebvRDxOoEOCGnY6cSVY5npV7hmEBi0Vajb4
 xulQ==
X-Gm-Message-State: ABy/qLaly4NHVRir17N757ppIPYS0iYJUqkPMuHrF3vo8BAR/+q22bHm
 G+p42LGglek3UCyYSACvj8M=
X-Google-Smtp-Source: APBJJlEhxGp8UzvRhk6wLS7gXVN8NGSRwfsL5WAcYURFG9K14NiU37a760PVMsWwLzEp7FSpGWRwtA==
X-Received: by 2002:adf:fec4:0:b0:314:1aed:8f5f with SMTP id
 q4-20020adffec4000000b003141aed8f5fmr4960310wrs.34.1690979483752; 
 Wed, 02 Aug 2023 05:31:23 -0700 (PDT)
Received: from akanner-r14. ([77.222.27.58]) by smtp.gmail.com with ESMTPSA id
 n6-20020a5d4206000000b00317a04131c5sm9907243wrq.57.2023.08.02.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:31:23 -0700 (PDT)
Message-ID: <64ca4c9b.5d0a0220.2f302.b8de@mx.google.com>
X-Google-Original-Message-ID: <ZMpJNh+PYy40FRnZ@akanner-r14.>
Date: Wed, 2 Aug 2023 14:16:54 +0200
From: Andrew Kanner <andrew.kanner@gmail.com>
To: David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <3fa4d25d-7fea-d25b-fa83-4ada2c550725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fa4d25d-7fea-d25b-fa83-4ada2c550725@gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, jasowang@redhat.com, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, jbrouer@redhat.com, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Tue, Aug 01, 2023 at 07:07:39PM -0600, David Ahern wrote:
> On 8/1/23 4:07 PM, Andrew Kanner wrote:
> > @@ -1594,7 +1597,13 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
> >  	if (zerocopy)
> >  		return false;
> >  
> > -	if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
> > +	rcu_read_lock();
> > +	xdp_prog = rcu_dereference(tun->xdp_prog);
> > +	if (xdp_prog)
> > +		pad += XDP_PACKET_HEADROOM;
> > +	rcu_read_unlock();
> 
> 
> since you do not care about the actual xdp_prog (only that one is set) I
> believe you can use rcu_access_pointer here.

Good point. Thanks, David.

I'll resend both as v5.

The correct cc-list for PATCH 2/2 is also needed. It fixes
net/core/filter.c instead of drivers/net/tun.c now.

pw-bot: changes-requested

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

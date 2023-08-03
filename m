Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEB8EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 17:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5D3417DA;
	Thu,  3 Aug 2023 17:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F5D3417DA
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JL+ZqAqj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3FBCQ3iQZit; Thu,  3 Aug 2023 17:53:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 13AB940488;
	Thu,  3 Aug 2023 17:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13AB940488
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBE19C0072;
	Thu,  3 Aug 2023 17:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 396D7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 17:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C78B40003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 17:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C78B40003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jv54T9joo16s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 17:53:24 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3810D40488
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 17:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3810D40488
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so19602171fa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691085202; x=1691690002;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=V+wyudEu/QspMENufwePSDeBm7uMlK4OkNp5EvN/35o=;
 b=JL+ZqAqjXrPGGLl4Rbob9P7lElgz/eZuZmXKnawuVKZBW75wL5TqICw4umkMOq+7PV
 00x8OW1CbC//gpvy8dRhNiGfAPCugbxKC3zfXksmbBbUscvWho018BDCca2uVKy0k8vw
 8TRd/qdKa6fpUJychSdgSxRvnTiB8e8Wn/gwrh/UaAoC+eF6HkUz/G/nqoBBD/szkhnc
 XQ6l2u6atW5ZZbHWLQ4Tal1fh+ROry20RaLG35HfU1ewxzJMlgFT3J4Tj7MaRKxxxBBY
 OEndrsRCD8JDKLUN53jpgdimIobPT096j/V0OHlJkxMkn1InGJ8WO1nAuRezDqZDc5WG
 7+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691085202; x=1691690002;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+wyudEu/QspMENufwePSDeBm7uMlK4OkNp5EvN/35o=;
 b=bJT0EuKObNA65fMhuxu7DvX97C4gA/XqtDj03WK56gOZbwQPiH+tREz7d+f6zu02Sn
 0dW7+TfmgiYbf4kJJdLxdcoPMhBhBLa7gIMVM3wKnTQd/6Xac+UAWG26PChFZ8lsRz4g
 isItXCRWbS88zPmG9tjHuWWQ9VXW8DS5eWoam9Tla6ie3CntGfDmqZ9ph6yrkYE+Ci/l
 vaqeORjHu8VkY7pwwBD7aVeQuQegc9vZt+uuWANkSveV02wbb+vt/sc+RLeE95gJOkQg
 EmiJN8rTUZbKCgkVsAt3cMRMl3wMMWbTfQLIzJZLsR/h1EQ6a3wn81jVhhK31Fjp+8lD
 RP8g==
X-Gm-Message-State: ABy/qLbVW/2NJt3Z/XJX7CIkX1eMIckpL3Dcn/mHTguW7kvTLop/TzJc
 7gbF6BD49cBLINcRPIYtkrs=
X-Google-Smtp-Source: APBJJlF+LqRZRqf2E33KO6guouHFBeH+ORAACowQeq08iE+8pelgELDa3c7+5LJh1LSKxy24OeUz2g==
X-Received: by 2002:a05:6512:370b:b0:4fe:279b:8a02 with SMTP id
 z11-20020a056512370b00b004fe279b8a02mr6690530lfr.67.1691085201631; 
 Thu, 03 Aug 2023 10:53:21 -0700 (PDT)
Received: from akanner-r14. ([77.222.27.58]) by smtp.gmail.com with ESMTPSA id
 m8-20020a195208000000b004fe31fa2490sm46205lfb.247.2023.08.03.10.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 10:53:21 -0700 (PDT)
Message-ID: <64cbe991.190a0220.b646b.04c1@mx.google.com>
X-Google-Original-Message-ID: <ZMvpjJFyLDqMuLK/@akanner-r14.>
Date: Thu, 3 Aug 2023 20:53:16 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Jason Wang <jasowang@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <2cb34364-0d7c-cf0a-487f-c15ba6568ac8@kernel.org>
 <CACGkMEvukuV5UZqb=MOaPqWfuJKOokZW1986GE4cRwt=Vx9Unw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEvukuV5UZqb=MOaPqWfuJKOokZW1986GE4cRwt=Vx9Unw@mail.gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 jbrouer@redhat.com, edumazet@google.com, dsahern@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

On Thu, Aug 03, 2023 at 11:19:47AM +0800, Jason Wang wrote:
> > > @@ -1594,7 +1597,13 @@ static bool tun_can_build_skb(struct tun_struct *tun, struct tun_file *tfile,
> > >       if (zerocopy)
> > >               return false;
> > >
> > > -     if (SKB_DATA_ALIGN(len + TUN_RX_PAD) +
> > > +     rcu_read_lock();
> > > +     xdp_prog = rcu_dereference(tun->xdp_prog);
> > > +     if (xdp_prog)
> > > +             pad += XDP_PACKET_HEADROOM;
> > > +     rcu_read_unlock();
> > > +
> >
> > Isolated seen, I guess, this is a correct fix to 7df13219d757.
> 
> I think so.
> 
> Actually, I think we can probably always count XDP_PACKET_HEADROOM
> here. Since there's a window that XDP program might be attached in the
> middle of tun_can_build_skb() and tun_build_skb().


Thanks, that makes sense.
I will do it in v5.


> > Question to Jason Wang:
> > Why fall back (to e.g. tun_alloc_skb()) when size is above PAGE_SIZE?
> >
> > AFAIK tun_build_skb() *can* create get larger packets than PAGE_SIZE
> > from it's page_frag.  Is there a reason for this limitation?
> 
> I couldn't recall but I think we can relax.

Jesper already sent enough info for this idea in v2, I will use it for
the next patch/series.

Jesper, I will add this tag for this next patch/series if you don't
mind:
Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

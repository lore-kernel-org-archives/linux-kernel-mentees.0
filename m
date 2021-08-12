Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79D8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 19:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F29F60EFE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 19:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F29F60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AAEE60B79;
	Thu, 12 Aug 2021 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joU9Ob4uhRJv; Thu, 12 Aug 2021 19:17:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1FC1260B70;
	Thu, 12 Aug 2021 19:17:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00B35C001A;
	Thu, 12 Aug 2021 19:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B1C9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74BB94015E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 19:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPzsoD6349Fs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 19:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF6D40112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 19:17:25 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so12353383pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Swd4Qb0LB2gTSkGGkD/oyA9lgEK689TaeHzpVlWAOxs=;
 b=R3GMMo6DOaRMP1S/Sg8zqd2DyQ7n28u+R11cM1SCrFSkKO9S35XvkiVGoNXWxuA018
 HACPnb/yyQleUMjJeyyMWFpOa9TSSYQAIFgkSBoYFU4fiIhyaSVapMs/YL8FH/3g6Y6p
 RcfxdsZUZAXYJxVUHU3o5+y0laSFE7L5kGer00ByYRhZTgcQ8mvyuJ9GMGtgsf9l25aF
 J7DxtDYSEXONUCijrmatj6rzA+YltW6Ag9gOJFYBBwaO5V8EOqr9TjxhLdW1AsF1QMSq
 cYyGgNJBIuXaCNdfEJW0JY1bjhBav0HrxbErGvYDHe7Q5TevYjIneaYcWIqD+ack2o7I
 gjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Swd4Qb0LB2gTSkGGkD/oyA9lgEK689TaeHzpVlWAOxs=;
 b=KWmenoMobbkP11gPuWWU6Hvk6UiEOTFTSm708UExrjz5mbB4lQuMJwfnx0v5zOqahM
 8gzTOwHifvpgOnG/TEi49lck01ZjmPhwMxlTXqCCniSETw9aiQmPpVvwluxTOEXK0Cza
 UZUXlX+rHssyR0+AZ1+JB1MPHNSytQR9IE0D5GrP+FUxOBan+rzQfS2ov76NTsp3fByi
 c1vy3rmCV5usV3OsLpvHFG76ob8f5om685l6NMIhv58wRYBtdYuSPJjidEWEaMqmE9pt
 V9tjstI89UV999svV9wuG7SsNAynuIlATn5EhyLV+kAx1tX08dHpdVBzQ/wK1V9E6FJL
 jhjg==
X-Gm-Message-State: AOAM531NgGiFTJ+5PRrB3GGfik8e6k15YMAe2rcWxUiZ7WP4/QUxHEVg
 1rI+VUkzi/4mb3sZ3mENv68=
X-Google-Smtp-Source: ABdhPJw8G2L5h5WAqtC9ejHViYetlM+iE1PMgY21/PqVy2uSp7qAQRAiJYDBaJp4/CvGHFr7w1tfkA==
X-Received: by 2002:a17:90a:2fc2:: with SMTP id
 n2mr5503399pjm.112.1628795845101; 
 Thu, 12 Aug 2021 12:17:25 -0700 (PDT)
Received: from [192.168.1.38] (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id c23sm4873686pgb.74.2021.08.12.12.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 12:17:24 -0700 (PDT)
Subject: Re: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
To: Eric Dumazet <edumazet@google.com>
References: <20210811235959.1099333-1-phind.uet@gmail.com>
 <CANn89iLQj4Xm-6Bcygtkd5QqDzmJBDALznL8mEJrF1Fh_W32iQ@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <663ac8c4-b0c3-5af6-c3c3-f371e0410a43@gmail.com>
Date: Fri, 13 Aug 2021 03:17:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CANn89iLQj4Xm-6Bcygtkd5QqDzmJBDALznL8mEJrF1Fh_W32iQ@mail.gmail.com>
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Alexander Lobakin <alobakin@pm.me>,
 syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com,
 Alexei Starovoitov <ast@kernel.org>, Wei Wang <weiwan@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Yonghong Song <yhs@fb.com>, linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, kpsingh@kernel.org, memxor@gmail.com,
 Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>,
 Antoine Tenart <atenart@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Taehee Yoo <ap420073@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 8/12/2021 3:07 PM, Eric Dumazet wrote:
> Also I object to this fix.
> 
> If packets have been stored temporarily in GRO, they should be
> released at some point,
> normally at the end of a napi poll.
> 
> By released, I mean that these packets should reach the upper stack,
> instead of being dropped without
> any notification.
> 
> It seems a call to gro_normal_list() is missing somewhere.
> 
> Can you find where ?
> 
> Thanks !
> H Eric,

I think the location that should have a call to gro_normal_list() is 
__netif_napi_del(). Let say, if the driver call a function that lead to 
gro_normal_one(), and add a skb to the rx_list while the napi poll is 
not scheduled, and the driver remove the napi context before a napi poll 
could be triggered, then the added skb will be lost.

Actually, this was the first solution that I tried with syzbot (It 
passed the test too).
Best regards,
Phi
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463D1C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA79460EFE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA79460EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC8A80E91;
	Fri, 13 Aug 2021 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXkuTSMInFvK; Fri, 13 Aug 2021 10:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF7A280E93;
	Fri, 13 Aug 2021 10:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95DC0C001A;
	Fri, 13 Aug 2021 10:51:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 587D2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C074015D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3f01dwJCZFl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86157400BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:51:40 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so1733086pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:user-agent:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=y1kdczTRTUq0E8aAH+vtFhoJAvPT0kPuLojaeEkmlK4=;
 b=MK7CFkoZKvHbUmSmRQ4RYlRrjNUWXYbvWVv3ooMEHY1UrrC6+TNgo3yOvat4hz+s1/
 42ZqQ9+Bt/tq/eKQO15IagdqXMYHLmNuNrtrMs8uqe9wnR8r3ZcXuhi47xOywys3Vzpa
 CJtxuilBVSoV6dzHrUq+K85NThS6hzRiUfublOerQKt/mrfuleq1pb5M6S4bH8oJ0afp
 qPtTceMOL3cv8GfGZ0/ZX2e+/u3C+OQpZee7PUL0EZWz7Dj2BEg7L1huTjVYO5kR+pE5
 9j67BTbDoV3+otbN/6hQmb7hc8lrqWBGfmAUwyG/m5Nm+9iXyjH1q4Ef/mR33XhlPeDh
 Gstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=y1kdczTRTUq0E8aAH+vtFhoJAvPT0kPuLojaeEkmlK4=;
 b=ePYXzWq2BT9E2ck4E02lKK14hD5k7+lGAyVbmDpS770uWwFKyH6l5hWMdb4VMrsjyk
 JHSdCKuJaSDYMHE+B9Kn59KVyFmHwyVA3j95cvZNUlhyfkUNmaBlo5AM/uqnmtztUqM7
 MAA7KcM3BswM4NhcGjhSEAPiAUBHA5+vRs1Qsxge7/ZrMLiCd9Scd4H4m+S97mxx1Ftp
 gn29rtcfFwV2U0qww9J6b1oPiH7lvm59A9F7+e3C27aTCQy6KqXIHAG2DSvpe9bX7nUZ
 rImLDDvkXmazEV0eXXAouF8bEBFzIJQ1dewLlhGfi5+gpps0Z8IfjZ7m52rsOatYTf82
 Q0bw==
X-Gm-Message-State: AOAM533lngRiqJ4zZMdP3UDGeHM6AE3v+MlMstF2GdlqTovoe8JCRMpI
 5wOl1ilyUwZRkL7ppCklJmQ=
X-Google-Smtp-Source: ABdhPJxOPJdbAvGqQ5fHpx70w8gkZ4j54wwWOUoXuw4W9dPkwVjP2Wl5COtIr7eqZ/75R/sW5WMFdg==
X-Received: by 2002:a65:6717:: with SMTP id u23mr1858160pgf.28.1628851899898; 
 Fri, 13 Aug 2021 03:51:39 -0700 (PDT)
Received: from [10.212.113.128] ([122.11.212.60])
 by smtp.gmail.com with ESMTPSA id x81sm1787568pfc.22.2021.08.13.03.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 03:51:39 -0700 (PDT)
Date: Fri, 13 Aug 2021 18:51:35 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <8f324e46-f05c-42d7-9599-a43de7be17dc@gmail.com>
References: <20210811235959.1099333-1-phind.uet@gmail.com>
 <CANn89iLQj4Xm-6Bcygtkd5QqDzmJBDALznL8mEJrF1Fh_W32iQ@mail.gmail.com>
 <663ac8c4-b0c3-5af6-c3c3-f371e0410a43@gmail.com>
 <8f324e46-f05c-42d7-9599-a43de7be17dc@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
To: Eric Dumazet <eric.dumazet@gmail.com>,Eric Dumazet <edumazet@google.com>
From: Nguyen Dinh Phi <phind.uet@gmail.com>
Message-ID: <804FB1AF-90C7-4430-9C5A-6837C32E431A@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Alexander Lobakin <alobakin@pm.me>,
 syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com,
 Alexei Starovoitov <ast@kernel.org>, Wei Wang <weiwan@google.com>,
 Mahesh Bandewar <maheshb@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Yonghong Song <yhs@fb.com>, linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, kpsingh@kernel.org, memxor@gmail.com,
 Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>,
 Antoine Tenart <atenart@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, bpf <bpf@vger.kernel.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On August 13, 2021 6:16:34 PM GMT+08:00, Eric Dumazet <eric.dumazet@gmail.com> wrote:
>
>
>On 8/12/21 9:17 PM, Phi Nguyen wrote:
>> On 8/12/2021 3:07 PM, Eric Dumazet wrote:
>>> Also I object to this fix.
>>>
>>> If packets have been stored temporarily in GRO, they should be
>>> released at some point,
>>> normally at the end of a napi poll.
>>>
>>> By released, I mean that these packets should reach the upper stack,
>>> instead of being dropped without
>>> any notification.
>>>
>>> It seems a call to gro_normal_list() is missing somewhere.
>>>
>>> Can you find where ?
>>>
>>> Thanks !
>>> H Eric,
>> 
>> I think the location that should have a call to gro_normal_list() is
>__netif_napi_del(). Let say, if the driver call a function that lead to
>gro_normal_one(), and add a skb to the rx_list while the napi poll is
>not scheduled, and the driver remove the napi context before a napi
>poll could be triggered, then the added skb will be lost.
>> 
>> Actually, this was the first solution that I tried with syzbot (It
>passed the test too).
>> Best regards,
>> Phi
>
>I think the real bug is in drivers/net/tun.c
>
>It can call napi_gro_frags() and I do not see corresponding
>napi_complete()
>
>This seems completely bogus.
>
>Your patch only works around one the many bugs caused by 
>commit 90e33d45940793def6f773b2d528e9f3c84ffdc7 tun: enable
>napi_gro_frags() for TUN/TAP driver
>
>I suggest not adding your patch, because we should fix the root cause.

Yes, it truely comes from tun driver. But it was there before listified RX added (that time the skb will be put to stack immediately), that why I made the fix in dev.c. I thought I should change the later commit. 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

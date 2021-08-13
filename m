Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AF7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65FA60F57
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D65FA60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE5C40249;
	Fri, 13 Aug 2021 10:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32fekb7dsH4w; Fri, 13 Aug 2021 10:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 979DE401AF;
	Fri, 13 Aug 2021 10:16:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB08C001A;
	Fri, 13 Aug 2021 10:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1104DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7F4401C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1npfVWQ8PhUb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E4F401AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 10:16:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l10-20020a05600c4f0a00b002e6be174c29so2538898wmq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqw1S6wFqpcslkxegqQiXTxlXz74o59gYYNcnKgmY4g=;
 b=Iac72rAAdZ6AojYmmBS1b45TFPgBlke8aXSGKhPB+5ChYdcMcO7rrOnxRDymsPQTes
 Sfi0jSDobljIJhCJbdsbs6KE8Wo+0oGJyE0jPPl7KVeVVHxVjzpLS8r78IaunH+YGcvA
 Cyskeksk0kb8Lc4py22Ak+sLqRYBquFwbX9xBkFi6YUCplmh7QPeDhT+NupyF+dGJJQg
 a3VCGO977oB0ja8EHzCBvHK5VfyAw8jJpH4DIFE7/HQDTP3Cys8n/WyOt0OkfOvqgIzS
 UUrd0Pq8lKhUlL44AEvsXjjX2WJ9YT9JYnRG+6DZMzK9iahdYLOv/kww2MyxFbsTnyPK
 ZLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqw1S6wFqpcslkxegqQiXTxlXz74o59gYYNcnKgmY4g=;
 b=YI9/pSIyqkhdw77pr38XoWPYe3YMZX7CiKEIluSCj7uaXzuAVfliU19wpHvjw0W+t6
 G0isN6jA89W8dTiMSevCWwsaMk782gcDCQ1bcbxS/iRfV55sI3+HFKLsIGGg5E1buFEg
 Aw/YkP3F/m3HfDbbj4ZaiyMGzpWFfjq4IaGRmpDK7CjnUMMT9soGsZ0su9yYgNgeN7LC
 H/vMyBgkAtifj36W3kTNnygeaNxUXD36TB/TwDFOM59Fgf0nTDGKF52L0+CWLij2K70Y
 4fDDamSObBxjsOG42yvzLZKJOFA+iOjNLzIPi8xbEK655/DK5/LUYcwmbAUuxOcWtFYC
 fRWw==
X-Gm-Message-State: AOAM532jfKI4YmbdTdnQ68cv5WZFLymeZ2Iojor008aiKndKSHWsXXxz
 RYML7JNgD0TW3KRCQfFs0CQ=
X-Google-Smtp-Source: ABdhPJxusspL3XxpzAX1smg8pNVYGaREmsqR1h9AnCCTJ/0mjdcoR9VTniawwni1Ad19eDHMKiwbBA==
X-Received: by 2002:a05:600c:4fd6:: with SMTP id
 o22mr1880796wmq.45.1628849804786; 
 Fri, 13 Aug 2021 03:16:44 -0700 (PDT)
Received: from [10.0.0.3] ([37.165.153.200])
 by smtp.gmail.com with ESMTPSA id p5sm1253942wrd.25.2021.08.13.03.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 03:16:44 -0700 (PDT)
Subject: Re: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
To: Phi Nguyen <phind.uet@gmail.com>, Eric Dumazet <edumazet@google.com>
References: <20210811235959.1099333-1-phind.uet@gmail.com>
 <CANn89iLQj4Xm-6Bcygtkd5QqDzmJBDALznL8mEJrF1Fh_W32iQ@mail.gmail.com>
 <663ac8c4-b0c3-5af6-c3c3-f371e0410a43@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <8f324e46-f05c-42d7-9599-a43de7be17dc@gmail.com>
Date: Fri, 13 Aug 2021 12:16:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <663ac8c4-b0c3-5af6-c3c3-f371e0410a43@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 8/12/21 9:17 PM, Phi Nguyen wrote:
> On 8/12/2021 3:07 PM, Eric Dumazet wrote:
>> Also I object to this fix.
>>
>> If packets have been stored temporarily in GRO, they should be
>> released at some point,
>> normally at the end of a napi poll.
>>
>> By released, I mean that these packets should reach the upper stack,
>> instead of being dropped without
>> any notification.
>>
>> It seems a call to gro_normal_list() is missing somewhere.
>>
>> Can you find where ?
>>
>> Thanks !
>> H Eric,
> 
> I think the location that should have a call to gro_normal_list() is __netif_napi_del(). Let say, if the driver call a function that lead to gro_normal_one(), and add a skb to the rx_list while the napi poll is not scheduled, and the driver remove the napi context before a napi poll could be triggered, then the added skb will be lost.
> 
> Actually, this was the first solution that I tried with syzbot (It passed the test too).
> Best regards,
> Phi

I think the real bug is in drivers/net/tun.c

It can call napi_gro_frags() and I do not see corresponding napi_complete()

This seems completely bogus.

Your patch only works around one the many bugs caused by 
commit 90e33d45940793def6f773b2d528e9f3c84ffdc7 tun: enable napi_gro_frags() for TUN/TAP driver

I suggest not adding your patch, because we should fix the root cause.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

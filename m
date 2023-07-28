Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26718C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Jul 2023 00:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9486A84089;
	Fri, 28 Jul 2023 00:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9486A84089
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=n2svxsWY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJNy-DDpkrqp; Fri, 28 Jul 2023 00:12:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6E80E8407C;
	Fri, 28 Jul 2023 00:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E80E8407C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59AB3C0072;
	Fri, 28 Jul 2023 00:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 765ECC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE06A42090
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE06A42090
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n2svxsWY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adUg96qrTMuM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:12:10 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D18BE42046
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18BE42046
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3487d75e4c5so6598265ab.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690503128; x=1691107928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JwOH31B9YC5Qq5eOuM4YDVXxICyCI8qLiMY5d30rtYA=;
 b=n2svxsWY7nhs+X7iL+CNV93rlxWXNy8DKhBsequbKHAsWICSwP9FHUrAUJqaCYGqdZ
 wMG5TLcsHWxov44VFlACkqXYZf0Im5U6wzer0OkeVQL5jTmxjbLc8QOmMtTHnlglJWjK
 BlAe6JF6UpTB1DkdymKkPrMqx5kfyiuAgNQcK2EBLY+Ol/SqolHAWDU0qLdhLuVz+vOZ
 rFQfLnfPnEDmJNFHrCM7SIh7qMYecY4LKDB7dqIfDPMd9d2VGj5PLlmhDyDNCQgQiav/
 dNoA2nTMiBSaIoU2wxqZQnzSH8tAH95bstJsrsnwdL2WSVT++r/jA28D2S7e3pZllAmF
 dKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690503128; x=1691107928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JwOH31B9YC5Qq5eOuM4YDVXxICyCI8qLiMY5d30rtYA=;
 b=P7E3bXjPIQyXDxJnXKtqxGGgX6kauv7sEE4i5zY7jAfgSB9BBGnud2sBr5Cq6olE59
 4oukichuzLHMloS/Qf4BlPF1FGPt8wOjSwARmNBO3dRHnmAuoJzySkth7XM9Fd4fb9p3
 EqrNHC/Wej3/7pXnmnKoEGGMfG7GvnCHHAaAU6UPfCM6XJu3DisLCK7Dz66R/vVJCjwR
 USAyBQKVLxoY8UD6vnK6b1A/6cBfMfFjzeWxy6VVJeR/wTzDBZGoobRdmU009Tw9CJOW
 oinh291rBpdKRm1wFaJJlFETAVbxPTtAiyVVrT3R4m90cBP8P4khA6xXreVST/fD6hq1
 49YA==
X-Gm-Message-State: ABy/qLYejLtcYfv0MZBxNHeB1sg0YgFLneMh8M+qIONd93GZR4x5dCYv
 crdaIPjEVRLpcMmG8Af1xIA=
X-Google-Smtp-Source: APBJJlFBi8MzPqGS4a5G0CvRMP10AO7jeswih1bVJor5eo3HO+kmYkNCU1XCNo4FpUvOF4Sa3MGFQw==
X-Received: by 2002:a05:6e02:1ba5:b0:348:f6cb:e585 with SMTP id
 n5-20020a056e021ba500b00348f6cbe585mr1175069ili.30.1690503128696; 
 Thu, 27 Jul 2023 17:12:08 -0700 (PDT)
Received: from ?IPV6:2601:282:800:7ed0:211e:b7c4:92fe:76f4?
 ([2601:282:800:7ed0:211e:b7c4:92fe:76f4])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a92c6d2000000b00348cc29117esm829376ilm.34.2023.07.27.17.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 17:12:01 -0700 (PDT)
Message-ID: <cf1ef905-fa48-df3a-2d3c-37d7a1e79b8e@gmail.com>
Date: Thu, 27 Jul 2023 18:11:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
 <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
 <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
 <220fc36ba1086c1390ba087d08561b61762c965a.camel@redhat.com>
 <3659ea35-8d03-aae7-53c0-09181bb1b69d@redhat.com>
 <64c30249.2e0a0220.f779a.1c31@mx.google.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <64c30249.2e0a0220.f779a.1c31@mx.google.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, brouer@redhat.com, kuba@kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
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

On 7/27/23 5:48 PM, Andrew Kanner wrote:
> 
> Thanks, everyone.
> 
> If we summarize the discussion - there are 3 issues here:
> 1. tun_can_build_skb() doesn't count XDP_PACKET_HEADROOM (minor and
>    most trivial)
> 2. WARN_ON_ONCE from net/core/filter.c, which may be too strict / not
>    needed at all.
> 3. strange behaviour with reallocationg SKB (65007 -> 131072)

I believe that happens because of the current skb size and the need to
expand it to account for the XDP headroom makes the allocation go over
64kB. Since tun is given the packet via a write call there are no header
markers to allocate separate space for headers and data (e.g. like TCP
does with 32kB data segments).

> 
> I can check these issues. I have to dive a little deeper with 2-3,
> most likely with kgdb and syzkaller repro. But seems this is not
> somewhat urgent and lives quite a long time without being noticed.
> 
> BTW: Attached the ftrace logs using the original syzkaller repro
> (starting with tun_get_user()). They answer Jesper's question about
> contiguous physical memory allocation (kmem_cache_alloc_node() /
> kmalloc_reserve()). But I'll check it one more time before submitting
> a new PATCH V4 or another patch / patch series.
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

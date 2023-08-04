Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B369BC00528
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Aug 2023 09:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C34F404B6;
	Fri,  4 Aug 2023 09:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C34F404B6
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sIGAu88h
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djRJpqhxQvfJ; Fri,  4 Aug 2023 09:30:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E8D1D401FA;
	Fri,  4 Aug 2023 09:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D1D401FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D488AC0071;
	Fri,  4 Aug 2023 09:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA4A7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A682A400D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A682A400D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtnKNm4Vasvr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:30:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0AE9415A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Aug 2023 09:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0AE9415A3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1638C61F63;
 Fri,  4 Aug 2023 09:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5BDC433C7;
 Fri,  4 Aug 2023 09:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691141408;
 bh=LEzM9G3hCkmW57EJI+SwefMcALPoyoAqXr/zZx0/GPw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sIGAu88hByPr2pePZ9Q6D3Op+OdIxyXOdviLitcorwMWrv8SrX0NOW/EDrU5LDMRu
 hbC7eG8xmtLQf+t62qRsaSoAEwpDcb1klZN6MFIfPJiCvpF/2GOTg7fidd0TiMIe3s
 TgLaTMxQvbTEMyrZ3dp3/jqeJxlPeyTi+F4GJHh+mU5+pz+mKvRL0dY/knGbTdvr26
 Jetk/KBw7uzKMLQa8BIUZ3MuzFJ1hR98N0GM7SLCFrCndR0/I6S3MJV5J/kYCbPPHZ
 XmxwbxAs2V855E3W7I+pwkz8Jaq4Z8N7SK70s1QU2+HqqZRpM39LnD0og0yM2QRggL
 NxhvBslhPcR7Q==
Message-ID: <224e100b-6874-2993-a743-0a93ca0201fd@kernel.org>
Date: Fri, 4 Aug 2023 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] drivers: net: prevent tun_build_skb() to exceed
 the packet size limit
Content-Language: en-US
To: Andrew Kanner <andrew.kanner@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <2cb34364-0d7c-cf0a-487f-c15ba6568ac8@kernel.org>
 <CACGkMEvukuV5UZqb=MOaPqWfuJKOokZW1986GE4cRwt=Vx9Unw@mail.gmail.com>
 <64cbe991.190a0220.b646b.04c1@mx.google.com>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <64cbe991.190a0220.b646b.04c1@mx.google.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 jbrouer@redhat.com, edumazet@google.com,
 Alexander Duyck <alexander.duyck@gmail.com>, dsahern@gmail.com,
 kuba@kernel.org, pabeni@redhat.com,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 03/08/2023 19.53, Andrew Kanner wrote:
>>> Question to Jason Wang:
>>> Why fall back (to e.g. tun_alloc_skb()) when size is above PAGE_SIZE?
>>>
>>> AFAIK tun_build_skb()*can*  create get larger packets than PAGE_SIZE
>>> from it's page_frag.  Is there a reason for this limitation?
>> >> I couldn't recall but I think we can relax.
> > Jesper already sent enough info for this idea in v2, I will use it for
> the next patch/series.
> 

I have some more input and considerations when selecting the new
constant that replace PAGE_SIZE.

Lets see if Eric Dumazet or Alex Duyck disagree?
("inventors" of page_frag scheme)

The function tun_alloc_skb() uses a page_frag scheme for allocation.
The maximim size is 32768 bytes (Order-3), but using something that is
close to this max alloc size can cause memory waste and fragmentation.

My suggestion would be to use the constant SKB_MAX_ALLOC (16KiB).

Maybe Eric or Alex would recommend using something smaller? (e.g. 8192)

page_frag limit comes from:
  #define SKB_FRAG_PAGE_ORDER get_order(32768)


> Jesper, I will add this tag for this next patch/series if you don't
> mind:
> Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>

ACK

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

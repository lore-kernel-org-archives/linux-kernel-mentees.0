Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A6FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3B461075
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 10:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D3B461075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB85340266;
	Fri, 20 Aug 2021 10:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjjYRYeddwTp; Fri, 20 Aug 2021 10:00:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E0B5440262;
	Fri, 20 Aug 2021 10:00:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C15BBC001A;
	Fri, 20 Aug 2021 10:00:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62CF1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF076125A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExkNbaPK9Tsv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89BE260B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:00:47 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id m193so17790760ybf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FlTYa2HajOWnWLWh45PgqFy1wfRiVZeU4UuYicYP+IY=;
 b=qhvlhcON2A0E2MEan4XKPEMNaXDkI321DZnkWxyKaMPE8//tOS+PBWNgUR4qFcqYKG
 axjmwS6Dzqk47ZMDVpAAVQIOkIt4ERZZE5En2xWxwoBUMLeC9mTwrqyLdCG2vSEk1d9U
 4A2VTD848AW2BwlkRbOVGj0re0sLt+E3Z7M83tF/5pep0OLjJ5igIt7zR/08Lz9/3C9+
 T03XBWLG4Y7d2s/pK1mScaAQJVM0QbslqamYqtJPBMV5/BXJDbPkdWSzOPSLjpvt2hv6
 Mwe6/j0XsXHzyXFtrromBXLB5ykKJVADACsKvvVwltoy+/d/7bGET2JzkWBK0veCCCTR
 9hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FlTYa2HajOWnWLWh45PgqFy1wfRiVZeU4UuYicYP+IY=;
 b=cO4SVtWYBcs6qdTt3GVJ/r3agchIw/Ql/HBmENzTvLs0q3uNkRauA159uHc3NmEjpK
 tRlops75d/4ugsPHyz6cRkTa7OhWFlU4qOxwroXtu1p2C21q8K3+XUW7ULiUQ23CRZwI
 5WTXEfI2QIvubJxXlSRFES18+cL1cNtr9zbYXfG6MsOZKulhNjJwRJ4PlLugLYoLRZos
 PsYpHCCxfZ7YQ0I9jS6CyLzwF3ibNrZY5eWVRiqOzS137tQZq8BeifEzznm7j9tgTw9g
 oNBSMEXxOJUVa7dxsS77VNabsYqx3y5jv76yTBdC5eIjiTUmhEz7Ngm0VpZIW6OUATJh
 Serg==
X-Gm-Message-State: AOAM532MibBIUrbFrDnxr9/fHef17RCQNnyHeEQ5127SVxvMH2Gh3rZk
 qpvdNKKxFS/SLcEoubyUZR6J7NAbtKz4B/arCeM=
X-Google-Smtp-Source: ABdhPJx/B5fAf+/OkC7gQSzP/7ovCpgCXvLgfBQ3z9UkOFrO9imcsq+Rei5sgJYE84dUJ8miiH5NLIpdbgvwwLVNtcE=
X-Received: by 2002:a25:b948:: with SMTP id s8mr24134515ybm.281.1629453646384; 
 Fri, 20 Aug 2021 03:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210805111207.19171-1-vineshraut2017@gmail.com>
In-Reply-To: <20210805111207.19171-1-vineshraut2017@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 20 Aug 2021 12:00:43 +0200
Message-ID: <CAKXUXMzOugdVkzHJVALZq+NXrk-BKLWtPorDtcJBoPuFU+dpoQ@mail.gmail.com>
Subject: Re: [PATCH] mptlan.c: fixed UNNECESSARY_CASTS warning
To: Vinesh Raut <vineshraut2017@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 5, 2021 at 1:12 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:
>
> multiple UNNECESSARY_CASTS warnings fixed from mptlan.c
> It is not good practice to cast alloc function as it may hide the bugs.
>

So what is casted here? from which type to which type?

Explain which type of bug here specifically would be hidden.

If you do that, it is much more comprehensible and clearer why this
deserves to be addressed (or not).


Lukas
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
> ---
>  drivers/message/fusion/mptlan.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/message/fusion/mptlan.c b/drivers/message/fusion/mptlan.c
> index 3261cac762de..f45e7a25e7c3 100644
> --- a/drivers/message/fusion/mptlan.c
> +++ b/drivers/message/fusion/mptlan.c
> @@ -860,7 +860,7 @@ mpt_lan_receive_post_turbo(struct net_device *dev, u32 tmsg)
>         if (len < MPT_LAN_RX_COPYBREAK) {
>                 old_skb = skb;
>
> -               skb = (struct sk_buff *)dev_alloc_skb(len);
> +               skb = dev_alloc_skb(len);
>                 if (!skb) {
>                         printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
>                                         IOC_AND_NETDEV_NAMES_s_s(dev),
> @@ -1006,7 +1006,7 @@ mpt_lan_receive_post_reply(struct net_device *dev,
>  //                     "for single packet, concatenating...\n",
>  //                             IOC_AND_NETDEV_NAMES_s_s(dev)));
>
> -               skb = (struct sk_buff *)dev_alloc_skb(len);
> +               skb = dev_alloc_skb(len);
>                 if (!skb) {
>                         printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
>                                         IOC_AND_NETDEV_NAMES_s_s(dev),
> @@ -1048,7 +1048,7 @@ mpt_lan_receive_post_reply(struct net_device *dev,
>
>                 old_skb = skb;
>
> -               skb = (struct sk_buff *)dev_alloc_skb(len);
> +               skb = dev_alloc_skb(len);
>                 if (!skb) {
>                         printk (KERN_ERR MYNAM ": %s/%s: ERROR - Can't allocate skb! (%s@%d)\n",
>                                         IOC_AND_NETDEV_NAMES_s_s(dev),
> --
> 2.30.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

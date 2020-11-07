Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F52C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 19:02:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E3820723
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 19:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsKVuUwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E3820723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C691784A33;
	Sat,  7 Nov 2020 19:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfAuT3kwWRDU; Sat,  7 Nov 2020 19:02:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43BF784A0F;
	Sat,  7 Nov 2020 19:02:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28D03C088B;
	Sat,  7 Nov 2020 19:02:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBA92C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDA8C84A33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrbN8-50FfYG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:02:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9E5484A0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:02:24 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f9so6612351lfq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soRNlc/K6cVluQ0+VaeOOXxw2r7plkvcC+reHxKQUx4=;
 b=bsKVuUwXgaCLddOnkSoCSlZQdNoGIm5R9XzwGw4xELX/hCS4M3IHaDAXT1Kq5gfTmq
 yI5wo4MevNnQkkFUgvSP57zaP48d6vpbrCpenDjCDuGcNvjbECT7yhwXKJeCzUC+y1rY
 SWHHMolvi1R2mpcQ2vqDR5VaLnpnbkDObMWz59mhHEaw/aoxBC++LT99MNWNgrgKLDbI
 u62GipruMVYvivCT7vMRsTGV7OjcKYlAUM5MRsCaFvXgIevCl1h8rueTe0/fv61rXK1l
 ygXSXvdIvKJdo/WE4kcXbP/XeRTCUFLrmysh3G5endpMgEI9IHIaJ0bPQM4SOFa0nSID
 Aryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soRNlc/K6cVluQ0+VaeOOXxw2r7plkvcC+reHxKQUx4=;
 b=mKVF/AkbJYYb/cy60qIOeRFIWpeg6fDfvOcKKSGx9Qo6I8KchhfdrdCAHro4AdFl6k
 z8KV13ziG9FxgPVGDs0IJFhy3cGjy4QrzLjRdaGR9Q2GxpTGzvYIS01Xy0dRe8y7DTRG
 VEbUh0r+OaotFUTLCFCiuW93KHndlY26rv57YZYkcQXEecMRY3vaOLQfEUJOqbf/O3qU
 u99PYcvmxRHeNoHLVt29TVyKN4jJdtX9vt6wtvJscLTlMEHWERHUc6cDRM8EBMCbWyAj
 EH6+Owp0Df6wW2m00xu9Jk7LG6KP7yO1mGbC3yi0YDvLrNJmGt92jRA2yy5P+fgQUgZI
 qctw==
X-Gm-Message-State: AOAM532P4YoyM9EuOVftSWwVAaD/u8q67unEIL6WvRW2qu5S1t8pnP3f
 yNSmh3mi1JFy5LDmgLAWHi5Oai5JEQW89gFP2G4=
X-Google-Smtp-Source: ABdhPJxEngv1+mdvrUYfkQFjIIpERTeGA4ZgOah7n1WIRgvZ3iWHY3CR104/Xc6//Qc330otjPMDGbU3nnX5PAlPqSk=
X-Received: by 2002:ac2:48b7:: with SMTP id u23mr3212679lfg.327.1604775742934; 
 Sat, 07 Nov 2020 11:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20201105155600.9711-1-anmol.karan123@gmail.com>
 <20201107185654.4339-1-anmol.karan123@gmail.com>
In-Reply-To: <20201107185654.4339-1-anmol.karan123@gmail.com>
From: Anmol karn <anmol.karan123@gmail.com>
Date: Sun, 8 Nov 2020 00:32:11 +0530
Message-ID: <CAC+yH-ZCcL=D-ExzXSedRWL2Jq5DY-1tRqP82MjhnBpuKbtONA@mail.gmail.com>
To: ralf@linux-mips.org, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>
Cc: netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 syzbot <syzbot+a1c743815982d9496393@syzkaller.appspotmail.com>,
 Saeed Mahameed <saeed@kernel.org>, linux-hams@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: rose: Fix Null pointer
 dereference in rose_send_frame()
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

Hello,

Sorry for this wrong subject(It should be v3 instead of v2),
please ignore this patch.

I will send a new one with the corrected subject.

Thanks,
Anmol

On Sun, Nov 8, 2020 at 12:27 AM Anmol Karn <anmol.karan123@gmail.com> wrote:
>
> rose_send_frame() dereferences `neigh->dev` when called from
> rose_transmit_clear_request(), and the first occurrence of the
> `neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
> and it is initialized in rose_add_loopback_neigh() as NULL.
> i.e when `rose_loopback_neigh` used in rose_loopback_timer()
> its `->dev` was still NULL and rose_loopback_timer() was calling
> rose_rx_call_request() without checking for NULL.
>
> - net/rose/rose_link.c
> This bug seems to get triggered in this line:
>
> rose_call = (ax25_address *)neigh->dev->dev_addr;
>
> Fix it by adding NULL checking for `rose_loopback_neigh->dev`
> in rose_loopback_timer().
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> ---
> Changes in v3:
>         - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
>         - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
> Changes in v2:
>         - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)
>
>  net/rose/rose_loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..2c51756ed7bf 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
>                 }
>
>                 if (frametype == ROSE_CALL_REQUEST) {
> -                       if ((dev = rose_dev_get(dest)) != NULL) {
> +                       dev = rose_dev_get(dest);
> +                       if (rose_loopback_neigh->dev && dev) {
>                                 if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
>                                         kfree_skb(skb);
>                         } else {
> -
> 2.29.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78D4C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 08:20:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9D9208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 08:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="unNAAEgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9D9208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2F3A85D08;
	Sat,  7 Nov 2020 08:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2rOP1042NeE; Sat,  7 Nov 2020 08:20:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6042585C95;
	Sat,  7 Nov 2020 08:20:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57FC6C088B;
	Sat,  7 Nov 2020 08:20:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56CE3C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 08:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 329962036C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 08:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6OsBeKb43c0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 08:20:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 0FFAB2010C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 08:20:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 62so2967372pgg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZP1wEjjNoJ7pwTRn6B7L6e9GaH7pRaX0MhMHLuNUUzM=;
 b=unNAAEgdoUDKN/F2HuUqnEzWeq0STic/TxA0q/cExK2sDKNpEFMRHH+AyP8SomR7qi
 mVH3I9f5Wryxp+VM5xhVudErsG94nCnVOrm5Bf4o+iSekbwLekB2Wtgpm0jvDMFRbFEj
 C4G7DEvjz5s8uUqqZ2B4j4+d/ix/X5+kiCuIPJK/sMNaRz9Vy59aMNEXoMWYVI+Yyrhb
 PFyZuIPPJFOb/asp0TA3SNbeHnQn35zYipjt0w9eQL9ztTHCmCzPNVj+k7CtGVNmdU0i
 oLQvC5tiqAAVJgchqDcoHzCTiWv8gz3SFvbU2whwgNBHUwZ82I52hIXNHKrUhxli88EK
 eDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZP1wEjjNoJ7pwTRn6B7L6e9GaH7pRaX0MhMHLuNUUzM=;
 b=pl/Af6eyK7vb3w45kzHtHH0Yl2kd5u0yg6OwZeThP+mxvAkAPhxRtcswJlvwaTctnk
 /XCozbAAwHKGYwFpp66AOuyWxYb+t36ZrMZc9FVJ2KLf+Vxd3S9TYKuSZk+wUJP0rKtK
 k26uAIUGAXuCS418r/tPzSVNupuyBRtagpgMVPemlRxdeGHVD8IpCnpljTNwX9A+4S27
 KTIVkobvJDFh5q3POyo7erF5Mh55L+LjO4W0XQN9CGppFtvwEqi/arBqzsBCduX/C/Kj
 KKshpo42jn8ggrj4zgV9jVkDgxfhka5ckORADePkzsjtFZmCP1Zj++O2wfW8pP06yQan
 MK3A==
X-Gm-Message-State: AOAM533op4dgSX5tvIpNXQjgL0xVbXvw4T3VjQQ29euwbTzJ/MWesqMW
 Qi0B1BtP4+lKpFzNT9Iy17g=
X-Google-Smtp-Source: ABdhPJwY1LHmH+/XEfvhKs3BiIJJD7hZS7rvqj9s+q0mulqx4/2BTdYcuEQUexGwjRK/t5UKFC/a3Q==
X-Received: by 2002:aa7:973d:0:b029:18b:23db:7711 with SMTP id
 k29-20020aa7973d0000b029018b23db7711mr5545839pfg.13.1604737250479; 
 Sat, 07 Nov 2020 00:20:50 -0800 (PST)
Received: from Thinkpad ([45.118.167.196])
 by smtp.gmail.com with ESMTPSA id g3sm3996722pgl.55.2020.11.07.00.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 00:20:49 -0800 (PST)
Date: Sat, 7 Nov 2020 13:50:41 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Saeed Mahameed <saeed@kernel.org>
Message-ID: <20201107082041.GA2675@Thinkpad>
References: <20201105155600.9711-1-anmol.karan123@gmail.com>
 <b97dc3f0843cc2b7d7674dbd467ad5ba40824ba3.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b97dc3f0843cc2b7d7674dbd467ad5ba40824ba3.camel@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2 net] rose: Fix Null pointer
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

Hello Sir,

On Fri, Nov 06, 2020 at 01:04:27PM -0800, Saeed Mahameed wrote:
> On Thu, 2020-11-05 at 21:26 +0530, Anmol Karn wrote:
> > rose_send_frame() dereferences `neigh->dev` when called from
> > rose_transmit_clear_request(), and the first occurance of the `neigh`
> > is in rose_loopback_timer() as `rose_loopback_neigh`, and it is
> > initialized
> > in rose_add_loopback_neigh() as NULL. i.e when `rose_loopback_neigh`
> > used in 
> > rose_loopback_timer() its `->dev` was still NULL and
> > rose_loopback_timer() 
> > was calling rose_rx_call_request() without checking for NULL.
> > 
> > - net/rose/rose_link.c
> > This bug seems to get triggered in this line:
> > 
> > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > 
> > Fix it by adding NULL checking for `rose_loopback_neigh->dev` in
> > rose_loopback_timer(). 
> > 
> > Reported-and-tested-by: 
> > syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > Link: 
> > https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> >  
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> 
> missing proper fixes tag.
> 
> > ---
> >  net/rose/rose_loopback.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> > index 7b094275ea8b..cd7774cb1d07 100644
> > --- a/net/rose/rose_loopback.c
> > +++ b/net/rose/rose_loopback.c
> > @@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list
> > *unused)
> >  		}
> >  
> >  		if (frametype == ROSE_CALL_REQUEST) {
> > -			if ((dev = rose_dev_get(dest)) != NULL) {
> > +			if (rose_loopback_neigh->dev && (dev =
> > rose_dev_get(dest)) != NULL) {
> >  				if (rose_rx_call_request(skb, dev,
> > rose_loopback_neigh, lci_o) == 0)
> >  					kfree_skb(skb);
> >  			} else {
> 
> check patch is not happy:
> 
> WARNING:TYPO_SPELLING: 'occurance' may be misspelled - perhaps
> 'occurrence'?
> #7: 
> rose_transmit_clear_request(), and the first occurance of the `neigh`
> 
> ERROR:ASSIGN_IN_IF: do not use assignment in if condition
> #36: FILE: net/rose/rose_loopback.c:99:
> +                       if (rose_loopback_neigh->dev && (dev =
> rose_dev_get(dest)) != NULL) {
> 
> total: 1 errors, 1 warnings, 0 checks, 8 lines checked
> 
> 

Thank you for your review will rectify these and send another version.

Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

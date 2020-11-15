Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E5AC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:45:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1002225B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZoP9Ve4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1002225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 882B2869DA;
	Sun, 15 Nov 2020 11:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYHpYCYUrOWV; Sun, 15 Nov 2020 11:44:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 167A4869CD;
	Sun, 15 Nov 2020 11:44:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E07C0800;
	Sun, 15 Nov 2020 11:44:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 448EBC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2104020397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTBp-YIl7JBd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:44:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 5725520134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:44:57 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id w7so2500138pjy.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 03:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tmv8ZZeN6TdxknLtX/g558yOOygP5SGuU1C7JA+C4O0=;
 b=hZoP9Ve4d54Ov6C5lzXSlYc/1VBgNVdp0HM83TnmjMByRcWDPDdE/AiipZ+fMHPILu
 nv0KO1bOr+gZZ63oSB1PKd/0nkFSJvtDqpoJ7r/cKuhYnC9YUhFbzZPU0rJTA75P7aEz
 ybhTzNaIzW/3OKuUIDH7Kgq7JpcNtx1GRujzZw56OFK+PIRUDWwui0ZHBHALjd0zEjIl
 FEmhn76n9lCzfYEcsHnZVOY32F9+5SulLnq5RcVFd27I7xg19Zn+dpgh+Mne/ijqgm6l
 yyWqvSQ6eAsCidyw+QwwSRLdr4ZCDIBRLUn2775/ICR6XdtrJqgxLDhJ+4sIY7wnUmL8
 vszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tmv8ZZeN6TdxknLtX/g558yOOygP5SGuU1C7JA+C4O0=;
 b=qamglVf4pzvn4WNA01Rf1G9YUUmRubO3n6wHmHvWFYmT3MFn/ROoy2kVIC7nN77wkK
 919yduZUSPLDkm4TRmkY5PtpsYNv3VjTC/vLhDMOkQQnAk0+78HC7RUU1krF0GtGQoCS
 mjOf/gZaC4Rgd6oy3IjYg2NUiGELP7CBp+ugu/ZHYbgjtlW4m8SQ20EPmCHzok3GjtMB
 +NbSnLclZBys7O5vaKDDfMOKsIIb2G2U9g6XONHMMvqhxtKqFdAxmOQTuadwZ3bVNll7
 s149wVXHsbrfy9hJADPVC0p9vWWyqPMdILxlf+r03KKMWU0VI2Vkfo04SFUicW4slG9z
 kAFQ==
X-Gm-Message-State: AOAM531mPJHEKoPdR11dYvt2WwbP8T9IRjDWKJkvMvfwlDEpZWjtm/r0
 k5kpICrBjoFpWViszlQ4ayA=
X-Google-Smtp-Source: ABdhPJzhd5fE9raRSdPzbL7fsH6jo/q3xiNgphqVH6VKQMapA4fU7Ip8o4uMeQJwCzyNBUPR2pDWxw==
X-Received: by 2002:a17:90b:1098:: with SMTP id
 gj24mr11401419pjb.140.1605440696679; 
 Sun, 15 Nov 2020 03:44:56 -0800 (PST)
Received: from Thinkpad ([45.118.167.196])
 by smtp.gmail.com with ESMTPSA id 21sm15276376pfw.105.2020.11.15.03.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 03:44:55 -0800 (PST)
Date: Sun, 15 Nov 2020 17:14:48 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20201115114448.GA40574@Thinkpad>
References: <20201110194518.GA97719@Thinkpad>
 <20201111165954.14743-1-anmol.karan123@gmail.com>
 <20201114111838.03b933af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114111838.03b933af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, saeed@kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v4 net] rose: Fix Null pointer
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

On Sat, Nov 14, 2020 at 11:18:38AM -0800, Jakub Kicinski wrote:
> On Wed, 11 Nov 2020 22:29:54 +0530 Anmol Karn wrote:
> > rose_send_frame() dereferences `neigh->dev` when called from
> > rose_transmit_clear_request(), and the first occurrence of the
> > `neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
> > and it is initialized in rose_add_loopback_neigh() as NULL.
> > i.e when `rose_loopback_neigh` used in rose_loopback_timer()
> > its `->dev` was still NULL and rose_loopback_timer() was calling
> > rose_rx_call_request() without checking for NULL.
> > 
> > - net/rose/rose_link.c
> > This bug seems to get triggered in this line:
> > 
> > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > 
> > Fix it by adding NULL checking for `rose_loopback_neigh->dev`
> > in rose_loopback_timer().
> > 
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> > Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> 
> > diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> > index 7b094275ea8b..6a71b6947d92 100644
> > --- a/net/rose/rose_loopback.c
> > +++ b/net/rose/rose_loopback.c
> > @@ -96,10 +96,12 @@ static void rose_loopback_timer(struct timer_list *unused)
> >  		}
> > 
> >  		if (frametype == ROSE_CALL_REQUEST) {
> > -			if ((dev = rose_dev_get(dest)) != NULL) {
> > +			dev = rose_dev_get(dest);
> > +			if (rose_loopback_neigh->dev && dev) {
> >  				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
> >  					kfree_skb(skb);
> >  			} else {
> > +				dev_put(dev);
> >  				kfree_skb(skb);
> >  			}
> >  		} else {
> 
> This is still not correct. With this code dev_put() could be called with
> NULL, which would cause a crash.
> 
> There is also a dev_put() missing if rose_rx_call_request() returns 0.
> 
> I think that this is the correct code:
> 
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..ff252ef73592 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,11 +96,22 @@ static void rose_loopback_timer(struct timer_list *unused)
>  		}
>  
>  		if (frametype == ROSE_CALL_REQUEST) {
> -			if ((dev = rose_dev_get(dest)) != NULL) {
> -				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
> -					kfree_skb(skb);
> -			} else {
> +			if (!rose_loopback_neigh->dev) {
>  				kfree_skb(skb);
> +				continue;
> +			}
> +
> +			dev = rose_dev_get(dest);
> +			if (!dev) {
> +				kfree_skb(skb);
> +				continue;
> +			}
> +
> +			if (rose_rx_call_request(skb, dev, rose_loopback_neigh,
> +						 lci_o) == 0) {
> +				dev_put(dev);
> +				kfree_skb(skb);
>  			}
>  		} else {
>  			kfree_skb(skb);
> 
> Please test this and resubmit it if it works.

Sure sir, I will test it and resend, if it works.


Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

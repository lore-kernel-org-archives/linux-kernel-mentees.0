Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADA8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 06:36:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BCF2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 06:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRP1hK7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1BCF2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9621787E59;
	Tue, 25 Aug 2020 06:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pN8hLaYaQxVT; Tue, 25 Aug 2020 06:36:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 314E287E58;
	Tue, 25 Aug 2020 06:36:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15388C016F;
	Tue, 25 Aug 2020 06:36:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74E2EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 55FB022708
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0v1DlRAKIeff
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:36:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 41F0B2210F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 06:36:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o13so6136770pgf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1imp3+Ksc7RuV6xFYmD+POgYzK3oIgsJy+XwlfX1vWM=;
 b=QRP1hK7ZSNCvr8yONsKOqaVMMy8SLMGDLSJQZXMqISsQCowT1avtYcJD8nLL2z3JSM
 9u4RKw/319OGcfitYg6vzWzQ3JXOBHIGRsaFNolssKdsW7oLt0n5ZYD46k7TymZr9sle
 GjgXAIeBRQBIZ/AxJ8Hc8ySzGtFy+iij5FYEiZLMekfCrCd93MSHFtkc5j6qOg7L3OrG
 Yghok62XGvH/RLvemGcu9a5bdODx7jPKdkVrY2FKl9a/Xm/G6g8Shy1/oqxd1BAtFSjY
 3EWzopiTvWNiRRO/GQadTmErSPObfGfFqzxNSbJRKMtuKdp9qHFV+Pzee5lF90BLO+fY
 6xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1imp3+Ksc7RuV6xFYmD+POgYzK3oIgsJy+XwlfX1vWM=;
 b=isFyaO+DSAUfmjHzhFE3uWtzQVTvFInz2mV2HdGxl6bjSoMTmOXyAR6iuXf2jZdANL
 CQfUTJJOFKtLZ/04XLDXK/KeKvE8S8a2TKv62OchaBrS70W7qwAplrTxJmCeSWe3yu3x
 uuu9cpKxmCil5fuCBtiq40quzoeQ3YBQeaX6YvXXRYqcCuooexAwHm+xDsLjR2B8xbOZ
 mbSDGpOF0HzwKDR/FXRYF1gpBBct216PGorR3Df1qHD5JhLWWlupvCpSLr/GSqNRDO7+
 rlmHiBTOEbCbMXCBst2JGSoeFTpW4ozF+KHBBwquoy/kq14FvkSbG8XlvzaGDoVKwB9n
 M/yA==
X-Gm-Message-State: AOAM530kpHhrKhbEW+nJ6Q2p8EaXfcwYYwXZ6uR9EflZfo78GmRjuA2C
 ia4aAqmASM439eSA2qYNRto=
X-Google-Smtp-Source: ABdhPJxbg4sF0Lr6g1Mh0p09gnomcuIy8SBHXncnjZPUMeo6cn4NDTun5tIVj0oYys9mXexnhUzcyg==
X-Received: by 2002:a62:c541:: with SMTP id j62mr6898091pfg.257.1598337386778; 
 Mon, 24 Aug 2020 23:36:26 -0700 (PDT)
Received: from ideapad ([157.32.253.94])
 by smtp.gmail.com with ESMTPSA id 131sm1628345pfw.167.2020.08.24.23.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 23:36:26 -0700 (PDT)
Date: Tue, 25 Aug 2020 12:06:20 +0530
From: Himadri Pandya <himadrispandya@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20200825063620.GA17052@ideapad>
References: <20200823082042.20816-1-himadrispandya@gmail.com>
 <20200824111655.20a3193e@kicinski-fedora-PC1C0HJN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824111655.20a3193e@kicinski-fedora-PC1C0HJN>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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

On Mon, Aug 24, 2020 at 11:16:55AM -0700, Jakub Kicinski wrote:
> On Sun, 23 Aug 2020 13:50:42 +0530 Himadri Pandya wrote:
> > Initialize the buffer before passing it to usb_read_cmd() function(s) to
> > fix the uninit-was-stored issue in asix_read_cmd().
> > 
> > Fixes: KMSAN: kernel-infoleak in raw_ioctl
> 
> Regardless of the ongoing discussion - could you please make this line
> a correct Fixes tag?
> 
> Right now integration scripts are complaining that it doesn't contain a
> valid git hash.
> 
> > Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > 
> 
> This empty line is unnecessary.
> 
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>

Thank you. I'll fix it.

Himadri
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

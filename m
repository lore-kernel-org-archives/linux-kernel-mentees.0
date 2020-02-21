Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918CFC3565A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:05:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFA124653
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 18:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2qRZDR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFA124653
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0387E864C3;
	Fri, 21 Feb 2020 18:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuiXmiciQiW2; Fri, 21 Feb 2020 18:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A713B84056;
	Fri, 21 Feb 2020 18:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 922F7C1D81;
	Fri, 21 Feb 2020 18:05:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ED4BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D7EF87FEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ybv4oQNqEGUt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 76DEA87FE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 18:05:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so1171019plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 10:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Vc/oNHZrVih+q2Wtn+OIaEagT0TK1906/KUzqovtsWk=;
 b=M2qRZDR0w0N9TtAzvAhQVyBgCTUZsUJIVKjS0fJfLsSi2BD1Aiv3Z+5K//qXvLxSYo
 g3CBX3z4HGbflblb3zaFb+c+wk5KD+vAjLflfdZN5mo2yVk3DBNSIYRQUL/0HoDK5epv
 jJuqBDRt28YxlC4mUCUeiERSc54eTh37p3PVzzpHYUckHOf+Pn59L7jBWaD0ATFH2bNE
 oeHRf39oYqxf3hx9ONMosK+9a7gg8cJXWLnupLhBfeDFbmuGebdanTmf/jEAJLKp46dp
 Y/tFMmqR8UqvbBQc6AuB3F6Zs+mMTr0Nrr4UwuhH8ZvnTy8hGH7WL5N58YaOqfRWCXcT
 x0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vc/oNHZrVih+q2Wtn+OIaEagT0TK1906/KUzqovtsWk=;
 b=XO8xKq/p03BpnZWdojxTmV3Xgo4k/qu/9QyGx9WIwfgNDFMlMSiqDwH+wYjgXbowQD
 wlk1wgGIwnS8ls9PcpiPbAuUNRtuwILgnx3LjFZpZDjgNH5P4zobVzqcKQltEMCUHksR
 /FkRzlUmCNiEcfg9VPIbslwn3HTesmDXlkHqQ7RXxn7w1RwfyfhmHtNAstPSLzTGvGvm
 Bd5IXPX7LKcuD2KgAfz6rq2DnFwL2tyByvAsAPLJCIlr8wUSZ9yjZt/pf6crK2krDy7d
 M+GN/aR6G4jUk2c9ObFVG8wUoLX+n0DizthTOUCzZF4eOI2NRtZ0w7ttyzjd/BWyJ8lr
 oZGw==
X-Gm-Message-State: APjAAAXy5DUse/Wo/JfAWBNAdb7jwC2749rLGJ96c8dwFhD0QiezNDNd
 VrplJBaPYFz/04s5ZF9ml9k=
X-Google-Smtp-Source: APXvYqzf4h+MKzqKo6yp8to/XMq/SAEWHlDnmYGqE3oMTfdRBQiHu6uGRXaNXVbzCvPYKsR0f1UqIw==
X-Received: by 2002:a17:90a:2223:: with SMTP id
 c32mr4700805pje.15.1582308335057; 
 Fri, 21 Feb 2020 10:05:35 -0800 (PST)
Received: from workstation-portable ([103.87.57.170])
 by smtp.gmail.com with ESMTPSA id 78sm901780pge.58.2020.02.21.10.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 10:05:34 -0800 (PST)
Date: Fri, 21 Feb 2020 23:35:29 +0530
From: Amol Grover <frextrite@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200221180529.GA3256@workstation-portable>
References: <20200221152152.16685-1-frextrite@gmail.com>
 <20200221.081958.1917105498519528151.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221.081958.1917105498519528151.davem@davemloft.net>
Cc: paulmck@kernel.org, yoshfuji@linux-ipv6.org, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, edumazet@google.com, kuba@kernel.org,
 joel@joelfernandes.org, kuznet@ms2.inr.ac.ru,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] tcp: ipv4: Pass lockdep
	expression to RCU lists
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

On Fri, Feb 21, 2020 at 08:19:58AM -0800, David Miller wrote:
> 
> netdev was not CC:'d on this patch, please resend with that fixed.
> 

Sorry for that. I've resend the patch.

Thanks
Amol

> Thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

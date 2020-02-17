Return-Path: <SRS0=adXe=4F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CC5C7619F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 12:05:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB2452072C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Feb 2020 12:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjudUUl8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB2452072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA2A185310;
	Mon, 17 Feb 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5-EWEjOonyR; Mon, 17 Feb 2020 12:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48E918471C;
	Mon, 17 Feb 2020 12:05:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 370DCC08A0;
	Mon, 17 Feb 2020 12:05:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E74C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 12:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2F93E2002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 12:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SPMmpu-C+smh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 12:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B09BE20020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 12:05:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so8782146pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2020 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E4kMIrPNCiyRmgWZhxYZuFBKw4V0voF4y3zqsgP+Bx8=;
 b=AjudUUl8bP457vmLEn8jzTV/8BjAFYLhRqQXTc79xuDnZY1eo3TRrvzB2YGEMbvLT7
 UIv4Hhl2OEVYIfYUWECPHSVBKs2rkqRl+v8qd0QPTlEUYCoMxs3BZXaCCV7htJir9cSY
 P/kY0eSDVSH+iALQRmfCw3WMbZMGTo4mQC9tEB8sy7rhWRG3A+4265uZVtAFCkzD21Ah
 9Aoi5xP2qvwE4XSzkGgH1fn6TcBfVX2C/aBtOVd7eDyB9rObsZM2boT3jLVEgvXN/Nbq
 DIo9gfPWLL/Yh5BE6QnzQL4WTrwlJ/DOUhRyBuVqHwTaWEiDf9CJ4PA1Bug15bVIDudS
 pCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E4kMIrPNCiyRmgWZhxYZuFBKw4V0voF4y3zqsgP+Bx8=;
 b=Hhqw8fIKvyTC3hpdV9Drky9Z5DKf9P+kER3EMiJ3BoAH0ndPvr9wWGz4xn34STtbKc
 z5X1XjSuJYtWXtCs8Af/ftOqh5etDzeSRUkAFD0P8kQ5ENaCQdUraNO9UQQ1ag2fngBl
 iT6fbJtgpH0fGfSL5chpRBya5HGLXBxtP4gVIZSVLlEgDbRipWBVDDO1LPsIzc5PEbOl
 nGzWAm2tdRaU1npXJMOTWe3+06q2/KKvaRklo+kgKUWemLADaNzf/ZCyuug2j9Uwt011
 65iGRjYgsKc6htNAFQ8TG7aAjbs78nUXpSkkfKx4L/21j/eFmVf36bgcJv0S5OkPr+bY
 NRXg==
X-Gm-Message-State: APjAAAWBaTwS6YhVPbbqFOwhHFZzsFex6p5EE9qwlB0PFTZw2DIYO90q
 WbnrFBLmnQDNYYVF5HsQTg==
X-Google-Smtp-Source: APXvYqyDFaAFJ2xtas+m18JCGS6zRjMUeJs00Ho6bHth9PbfxctixNvC0pC7ga6HGg9pYbnN4j/oyA==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
 t1mr19422318pjv.137.1581941134218; 
 Mon, 17 Feb 2020 04:05:34 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee0:fe92:14b2:4950:fe83:57e])
 by smtp.gmail.com with ESMTPSA id d2sm377070pjv.18.2020.02.17.04.05.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 04:05:33 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Mon, 17 Feb 2020 17:35:25 +0530
To: Sven Eckelmann <sven@narfation.org>
Message-ID: <20200217120524.GA12888@madhuparna-HP-Notebook>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
 <1634394.jP7ydfi60B@sven-edge>
 <20200216155243.GB4542@madhuparna-HP-Notebook>
 <14125758.fD4hS3u3Vl@sven-edge>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14125758.fD4hS3u3Vl@sven-edge>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, a@unstable.cc, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: batman-adv: Use built-in
	RCU list checking
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

On Sun, Feb 16, 2020 at 05:17:36PM +0100, Sven Eckelmann wrote:
> On Sunday, 16 February 2020 16:52:44 CET Madhuparna Bhowmik wrote:
> [...]
> > > I understand this part. I was asking how you've identified them. Did you use 
> > > any tool for that? coccinelle, sparse, ...
> > 
> > Not really, I did it manually by inspecting each occurence.
> 
> In that case, I don't understand why you didn't convert the occurrences from 
> hlist_for_each_entry_rcu to hlist_for_each_entry [1]. Because a manual
> inspection should have noticed that there will always be the lock around
> these ones.
>
Hi Sven,
I have been working on similar issues (passing cond argument to
list_for_each_entry_Rcu()). That's why may be I didn't notice that in
this case rcu variant is not required.
Thank you for taking a closer look and fixing it the right way.

Regards,
Madhuparna

> KInd regards,
> 	Sven
> 
> [1] https://www.kernel.org/doc/html/v5.6-rc1/RCU/whatisRCU.html#analogy-with-reader-writer-locking


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D273C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 06:21:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B445C22246
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 06:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSgC/UZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B445C22246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 107E987DE1;
	Wed, 14 Oct 2020 06:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BghqIurt-efs; Wed, 14 Oct 2020 06:21:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A997D87DC3;
	Wed, 14 Oct 2020 06:21:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F4C4C0052;
	Wed, 14 Oct 2020 06:21:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51BA4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37FAE875AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bUYgxdclkx8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:21:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 966FF87573
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 06:21:16 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id a3so3094026ejy.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 23:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=w0VoM9xAwvRUotQsNwLM0X8/wXzOnrdS5rYvfsKNHkk=;
 b=FSgC/UZlIn6mQqyJ2OjRdizSEBNchUEudGmWrlEoM8iQ85X0ZqWdLwEAPPRTt0Z9wU
 Qdwb2tqHLKmFM/zq1cyoh/UA+nptPpe7zwTk/LR17Vh+vdy63EuKsoQZy9me9teHEbME
 69C7em7alXscX+u0iBGf0NfkOsYKU4Xb0usX5+u5HY5fwfZk7UGJWdO+2F9OaH9ob64c
 nn1h3VTNDK3imANJ4nXL7iS0BsomPh0lljLV/x1aJ3Sg53srkWd6/9YUaOph3t4ygZwP
 vL5WOKAxL1QSDJfjC7rBbjyn2fb6kh3FVH4IigBvRo8l7YdaJqE1vT5/K0pdtV9LQmxG
 Sb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=w0VoM9xAwvRUotQsNwLM0X8/wXzOnrdS5rYvfsKNHkk=;
 b=WryQVMDfEeK+7yh9RuE/gEoCe9T/C+fIoohX6U9nyYVSwEV62xjgdY1Cj/p1+v8scM
 sBHc3c5kpAcMWoOLtASerhUPiMwErQKAKWNBzEgSeN5Jh783C1aSDUnQXMk4xQaEG/aq
 v+Fi5wnbqfQC2h8e3wgY0EPwHMpPvV/j62iwEkoFt47/LCeMZ3Ak5AG1xhCC1k+Gjm7E
 X2gzfFOFbtJZcWIMdMOt/Ll13iRfehAFk6nKMd13KUslEJ12SmedcMGsPy6VN3RWxzW2
 Em/ZST2QVb7Y3BzK/u9HUpFIawR08h0RyycYHzNeSouqg7KM6DpbEUulXe6KYY2s2C8Z
 FKvQ==
X-Gm-Message-State: AOAM532n+mzN68cHDjN5G2NrliDLsdSbRZSxWNPZko02Og8AR1cySQR9
 Oq8DsfeHmcjGSzihcIzIYhE=
X-Google-Smtp-Source: ABdhPJySkM0h6Zy115ghkMZgHgzrjTkrd3wXlp/7//bOPDm+1wxR5Q72+HcYv31dNBjY65s1IYfa0g==
X-Received: by 2002:a17:906:1953:: with SMTP id
 b19mr3805037eje.252.1602656475004; 
 Tue, 13 Oct 2020 23:21:15 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id z22sm1015014ejw.107.2020.10.13.23.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 23:21:14 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 08:21:13 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>
In-Reply-To: <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
Message-ID: <alpine.DEB.2.21.2010140812370.6186@felia>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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



On Tue, 13 Oct 2020, Joe Perches wrote:

> On Wed, 2020-10-14 at 07:46 +0200, Lukas Bulwahn wrote:
> > Just one bigger project example: Comparing clang-format suggestions on 
> > patches against checkpatch.pl suggestions are fine-tuning both of them to fit to 
> > the actual kernel style.
> 
> Eek no.
> 
> Mindless use of either tool isn't a great thing.
>

I did not suggest applying the tool to the source code and just changing 
the code... that is not a good idea as it is not helping anyone and just 
causing churn and distraction.
  
> Linux source code has generally be created with
> human readability in mind by humans, not scripts.
> 
> Please don't try to replace human readable code
> with mindless tools.
>

The goal is to run both tools on the code base and with the comparison see
how both tools can be improved.

We basically assume that the code is in the style it is intended to be.
What does checkpatch.pl warn about and what does clang-format still warn 
about, which is generally accepted okay as style in the kernel?
 
Then, we can improve the checkpatch and clang-format rules.

> If there's something inappropriate in checkpatch,
> please mention it.
> 
> There is a _lot_ of relatively inappropriate
> output in how clang-format changes existing code
> in the kernel.
>

Agree.
 
> Try it and look at the results.
>

Agree, that was the proposal. Nothing else.
 
> Improving how .clang-format is created and its
> mechanisms (for example: continually out of date
> ForEachMacros lists) could be reasonably be done.
> 
>

And that is something I would hope that somebody looking at the results 
would spot and start improving.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

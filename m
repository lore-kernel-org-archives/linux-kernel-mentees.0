Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F83C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:01:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1F420829
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTeN+eJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1F420829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6865F20429;
	Sun, 13 Sep 2020 11:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KosJ36YI8bhX; Sun, 13 Sep 2020 11:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6F31820426;
	Sun, 13 Sep 2020 11:01:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4552BC0864;
	Sun, 13 Sep 2020 11:01:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD76C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1F5BB85F61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjJifoTVjg8P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:01:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9080885F35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:01:41 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b12so14753372edz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=O0KzH4ksd2xth3LJkXkEpWra2DK1YbZlGZdmAStNY4M=;
 b=gTeN+eJQIvGG0HeyaY8LIXShy63fEJ3NnexyK7wtY/XnwLxARf/2jYx436sDGmDdgH
 YYNzJKFB+CmzUbTAbPr6FqfPpWIbqPsCJFFFceR/5OORXtAO29LpkAjaNs+p2141QcfO
 XcmXm4a4sy405WqGCzGB/6v3YMXgrh69tgSGJFjQvlvseaMwnwf5/REI72I4NUSZfU2R
 SH9jxJFXtBhznPlu2nLk2F9OIrzHZZJ5DVWyL1lwDHHXeagU71gjgO3bK+VZJtplSHhr
 kmZbxAujEitZafBHXXyK7Ue3sZ8ygBW+qbE4jYWOT8h7C/dg7Y/TYl2LUxj/08Q8aPLu
 pgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=O0KzH4ksd2xth3LJkXkEpWra2DK1YbZlGZdmAStNY4M=;
 b=AFqrpnRvqP0zasfWnsWU0SbqIUDeYAIslESPAqa4WbP26yyTEddywaaNBidmZgMlvv
 pMBjbOaC2RFP+UVC53B7pkqyQUyJ6EXsoqLEhgVLjEwFCwaQ/Hos7hF//X+ZNXc7z4VV
 RN2H8f3EZgr85H9gQSM0dd5r7pkX7c2PSiomfyro0gOPuhCa5ozGRsOsSjxp3Bq687cl
 p0Ac1Jhz/0BBXmk4Riy7O3iQq2D47k8CNGK+rpxtG05r5cYrhDUtp/qX3t0s0UtcQQAy
 dp2HXNf+BNxRwxUsnsjHjPSsU1OLJF7BQ318X0y9Uw/PMHrVO5gwIldo33I2LFbeubOq
 tL5g==
X-Gm-Message-State: AOAM531E8hepmB9oYAjHvT7hwbh/tQjdTipH1FJn0wq3wXeRfYKZ1q6X
 hafqgCQqmOxQ7pRqlWX5fA4=
X-Google-Smtp-Source: ABdhPJxxmXxkniSkgzIWAZyqdzk5C5YtYV4OwTrOr+oQFAtDnQoYpUYxO2XOZbUyQR9Esr1TbD1d3A==
X-Received: by 2002:a50:fe98:: with SMTP id d24mr12033550edt.223.1599994899863; 
 Sun, 13 Sep 2020 04:01:39 -0700 (PDT)
Received: from felia ([2001:16b8:2d3b:f900:79af:10ed:f757:91c8])
 by smtp.gmail.com with ESMTPSA id ly16sm5215549ejb.58.2020.09.13.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 04:01:39 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 13:01:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
Message-ID: <alpine.DEB.2.21.2009131220070.22585@felia>
References: <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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



On Sat, 12 Sep 2020, Ayush wrote:

> September 12, 2020 9:09 PM, "Ayush" <ayush@disroot.org> wrote:
> 
> > I am re-evaluating my output and will give you a analysis of all commits
> > which are getting affected by my patch.
> > It will take time to run checkpatch.pl again on those commits, so I will
> > share as soon as it's finished.
> 
> I fixed my script used for analysis and re-evaluated the affect of my patch.
> 
> I have made a list of commits which are fixed with this patch, It can be found here:
> 
> https://gist.githubusercontent.com/eldraco19/e7bf729b04cf6e2eee6ec52785b318d4/raw/74e13760fe01deee3285a1ec047ea0ac036cae76/commit_report.txt
> 
>

Did checkpatch.pl output on other types change?

One of the testers on this list reported that two COMMIT_LOG_LONG_LINE 
reports disappeared. That should not have happened, right?

I had a look at the checkpatch.pl output for commit 0a2bd55c194a ("dm 
integrity: document allow_discard option").

I think the reported line is wrong here.

Also, the line number for other cases have changed.

Generally, the line number should point to the line where the error really 
happens.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

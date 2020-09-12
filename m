Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A8DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 19:38:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2032087C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 19:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="F713V4WO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2032087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 92D1787440;
	Sat, 12 Sep 2020 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KkXG7uJ69gBU; Sat, 12 Sep 2020 19:38:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BA73872D7;
	Sat, 12 Sep 2020 19:37:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAEA4C0052;
	Sat, 12 Sep 2020 19:37:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 773A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6084D872BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 19:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEjmm06aGw1o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 19:37:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1CBAB872BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7094152D48;
 Sat, 12 Sep 2020 21:37:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7-Px674-Wzs; Sat, 12 Sep 2020 21:37:53 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599939473; bh=26JfZebe9VRSw5ixNVqnZDqPOaHr4pznAQM/FZxuugw=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=F713V4WO19lR3aWPZ+qsCyBwm5yBDz6bJcd8HtPTvidNjTLyp6SOpVyd713ehaQjj
 IYluR1Ctv6vFg5zxdp0mj7DLqTHMOw4VC1OI+cNMeIIntUR8lEPkoH8KsDeRkPoF0d
 zCDvtMdyq9ZeicMxDc5sVhzKT1XEZFkayLPURMjbJgvcfLAemc913M+yYf1HKKelPW
 LTJWcNukUZiylvuw+Wwvqfb/q/IISs+oyDZkILGsv0F4p8tKt0bsA24hLENid4YPdt
 y4wKNjajBJSAO+CsYTkRUY9wrvEBrQjFvzn7r8wOQVapKaqOgys2LqnHxa3ZAOuqSQ
 /yt4Cr9mruW9A==
Date: Sat, 12 Sep 2020 19:37:51 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
References: <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
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

September 12, 2020 9:09 PM, "Ayush" <ayush@disroot.org> wrote:

> I am re-evaluating my output and will give you a analysis of all commits
> which are getting affected by my patch.
> It will take time to run checkpatch.pl again on those commits, so I will
> share as soon as it's finished.

I fixed my script used for analysis and re-evaluated the affect of my patch.

I have made a list of commits which are fixed with this patch, It can be found here:

https://gist.githubusercontent.com/eldraco19/e7bf729b04cf6e2eee6ec52785b318d4/raw/74e13760fe01deee3285a1ec047ea0ac036cae76/commit_report.txt


Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

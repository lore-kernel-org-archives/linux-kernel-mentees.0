Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3009AC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:43:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8C62074A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8C62074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3FD5E2033E;
	Sat, 17 Oct 2020 16:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gm8W06jzC2d; Sat, 17 Oct 2020 16:43:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BAC5E20198;
	Sat, 17 Oct 2020 16:43:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A08BDC0052;
	Sat, 17 Oct 2020 16:43:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2ABC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1FCB12033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zotlVRR9MeAo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:42:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0028.hostedemail.com
 [216.40.44.28])
 by silver.osuosl.org (Postfix) with ESMTPS id 07E1C20198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:42:58 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id E0EEB1813B4E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:33:14 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id CC53C181D303A;
 Sat, 17 Oct 2020 16:33:12 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wren05_0307b2027227
X-Filterd-Recvd-Size: 1291
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Sat, 17 Oct 2020 16:33:11 +0000 (UTC)
Message-ID: <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 09:33:10 -0700
In-Reply-To: <20201017162732.152351-1-dwaipayanray1@gmail.com>
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sat, 2020-10-17 at 21:57 +0530, Dwaipayan Ray wrote:
> Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> moved the repeated word test to check for more file types. But after
> this, if checkpatch.pl is run on MAINTAINERS, it generates several
> new warnings of the type:

NAK.

Slow down and test before you send more patch versions.

> +				next if (index(" \t.,;?!", $end_char) == -1);

what does this do?


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

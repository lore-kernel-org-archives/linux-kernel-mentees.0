Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB958C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 19:37:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B812208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 19:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B812208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 742FB8594B;
	Mon,  5 Oct 2020 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t433h9_4S8H3; Mon,  5 Oct 2020 19:37:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E04E8592F;
	Mon,  5 Oct 2020 19:37:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09597C016F;
	Mon,  5 Oct 2020 19:37:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F99FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 53F6E204F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qACONkDw1VG8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:37:43 +0000 (UTC)
X-Greylist: delayed 11:31:49 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0043.hostedemail.com
 [216.40.44.43])
 by silver.osuosl.org (Postfix) with ESMTPS id DF1DA2046C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:37:42 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id AB946800B50A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 19:37:41 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 1CF3B182CF669;
 Mon,  5 Oct 2020 19:37:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: cord20_3611d99271c0
X-Filterd-Recvd-Size: 1291
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon,  5 Oct 2020 19:37:37 +0000 (UTC)
Message-ID: <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 05 Oct 2020 12:37:35 -0700
In-Reply-To: <20201005192409.192317-1-dwaipayanray1@gmail.com>
References: <20201005192409.192317-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new warnings
 to author signoff checks.
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

On Tue, 2020-10-06 at 00:54 +0530, Dwaipayan Ray wrote:
> The author signed-off-by checks are currently very vague.
> Cases like same name or same address are not handled separately.

When you run tests for this, how many mismatches are
caused by name formatting changes like:

From: "Developer, J. Random" <jrd@bigcorp.com>
...
Signed-off-by: "J. Random Developer" <jrd@bigcorp.com>?

Should these differences generate a warning?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

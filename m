Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3DCC63697
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19D112072C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 17:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19D112072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6FFC1203DB;
	Mon, 23 Nov 2020 17:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vFwfkfyQnDf; Mon, 23 Nov 2020 17:33:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55AC82039C;
	Mon, 23 Nov 2020 17:33:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B9BAC0891;
	Mon, 23 Nov 2020 17:33:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F789C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C3FC8710B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 239PuRs1LSOx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:33:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1452C870EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:33:33 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id DE947837F24F;
 Mon, 23 Nov 2020 17:33:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: woman80_51130f927367
X-Filterd-Recvd-Size: 1792
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Nov 2020 17:33:30 +0000 (UTC)
Message-ID: <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, lukas.bulwahn@gmail.com
Date: Mon, 23 Nov 2020 09:33:29 -0800
In-Reply-To: <20201123172430.12854-1-yashsri421@gmail.com>
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
 <20201123172430.12854-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Mon, 2020-11-23 at 22:54 +0530, Aditya Srivastava wrote:
> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> styles.

I think this proposed change is unnecessary.
 
> This warning occurs because of incorrect use of signature tags,
> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> signature tags, which may seem correct, but are not standard:

Standards are useful, but standards are not constraints.

> 1) Requested-by (count: 48) => Suggested-by
> Rationale: In an open-source project, there are no 'requests', just
> 'suggestions' to convince a maintainer to accept your patch

There's nothing really wrong with some non-standard signatures.
And I think leaving humor like brown-paper-bag-by: is useful.

Just telling people that they are using a non-standard signature
I think is enough.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

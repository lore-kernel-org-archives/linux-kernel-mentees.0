Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42E8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 04:25:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644922076E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 04:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644922076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1DF4E2052F;
	Fri, 21 Aug 2020 04:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yq2TsRYoc90V; Fri, 21 Aug 2020 04:25:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 314E1227A3;
	Fri, 21 Aug 2020 04:25:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A6B0C0889;
	Fri, 21 Aug 2020 04:25:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02F94C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 04:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E452B227A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 04:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Far36oWtU9v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 04:25:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com
 [216.40.44.206])
 by silver.osuosl.org (Postfix) with ESMTPS id DCB622052F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 04:25:08 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id D43AA18026130
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 04:25:07 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 9DBFB173086C;
 Fri, 21 Aug 2020 04:25:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sheet48_5e1546627036
X-Filterd-Recvd-Size: 1931
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Fri, 21 Aug 2020 04:25:04 +0000 (UTC)
Message-ID: <9230a7f0b80b4a984f18c979ca3c703edd7d6f98.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Mrinal Pandey <mrinalmni@gmail.com>, apw@canonical.com, 
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org,  Linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 20 Aug 2020 21:25:03 -0700
In-Reply-To: <20200820045232.tmun7jlppeeesg4p@mrinalpandey>
References: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
 <alpine.DEB.2.21.2007300746330.13710@felia>
 <a2773089a844047407855f2da7bd72c2970d2e6b.camel@perches.com>
 <20200820045232.tmun7jlppeeesg4p@mrinalpandey>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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

On Thu, 2020-08-20 at 10:22 +0530, Mrinal Pandey wrote:
> On 20/07/30 12:31AM, Joe Perches wrote:
> > On Thu, 2020-07-30 at 07:58 +0200, Lukas Bulwahn wrote:
> > > Hi Joe,
> > > 
> > > did you see this quick fix to checkpatch.pl? Can you comment on the 
> > > commit and can we get a quick ack on that fix, please?
> > 
> > Yes, in a bit.
> > 
> > > General question on patches for ./scripts/checkpatch.pl:
> > > How do they travel to Linus?
> > 
> > Generally via Andrew Morton.
> > 
> > > Do you pick those patches and provide them to Andrew Morton?
> > > Or do you just ack them and we need to send them to Andrew Morton to get 
> > > them into mainline?
> > 
> > Generally, ack and forward.

https://lore.kernel.org/lkml/20200714032352.f476hanaj2dlmiot@mrinalpandey/

Andrew, can you pick up this patch please.

Thanks

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6DBEB64DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jun 2023 12:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C1240976;
	Mon, 19 Jun 2023 12:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89C1240976
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QAp6/Cl5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvBVg2QOnC3A; Mon, 19 Jun 2023 12:58:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5681A4099E;
	Mon, 19 Jun 2023 12:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5681A4099E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EAB1C007C;
	Mon, 19 Jun 2023 12:58:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2498EC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 12:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 503C8611B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 12:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 503C8611B8
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=QAp6/Cl5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnHW8jyWzmnu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 12:58:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9688760808
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9688760808
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 12:58:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7597360B4B;
 Mon, 19 Jun 2023 12:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899F4C433C8;
 Mon, 19 Jun 2023 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687179478;
 bh=lvQFynrSlluUDfKEQRaFguLfTs4F/l2Y7cwjnHAJVMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QAp6/Cl5pH0cVIqqLi8S/dSa6nxYS/1OV+34wN1Hn45/wZOgdGKjOWD8j1cmucpvc
 sMgV1vQG6OC1KjqPRE0Vm5OKgxbbkfQdmUemwUp7rey9/u6/kAg1CNWc05/3MhpgHh
 ByI6S1k3IGPNdDKShufq/kF6ss9imOB7wL3hjruM=
Date: Mon, 19 Jun 2023 14:57:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <2023061938-unbounded-unbent-e706@gregkh>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
Cc: Yogesh Hegde <yogi.kernel@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 dan.carpenter@linaro.org
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

On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> On 6/18/23 15:03, Yogesh Hegde wrote:
> > Rename variables in struct rtllib_device to avoid CamelCase which is not
> > accepted by checkpatch.
> > 
> > ---
> > v3: The driver is split into 2 modules, calling the functions directly which
> >      the v2 of the patchset does breaks compile. So reverting back to v1 of
> >      the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.
> > 
> > v2: Removed the variable and called the function directly instead of
> >      just renaming the variable as suggested by Greg Kroah-Hartman
> >      <gregkh@linuxfoundation.org>.
> > 
> > 
> > 
> > Yogesh Hegde (4):
> >    staging: rtl8192e: Rename variable SetWirelessMode
> >    staging: rtl8192e: Rename variable SetBWModeHandler
> >    staging: rtl8192e: Rename variable LeisurePSLeave
> >    staging: rtl8192e: Rename variable InitialGainHandler
> > 
> >   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
> >   drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
> >   drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
> >   drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
> >   drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
> >   drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
> >   drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
> >   7 files changed, 24 insertions(+), 24 deletions(-)
> > 
> This patch series alone is fine. But when my patch series ([PATCH 0/9]
> staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> fails as we change same lines. Will see what happens.

Yes, none of these apply :(

Yogesh, can you rebase this on my staging-next branch and resend?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=yCHA=53=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1161C2D0EC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 00:15:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B0820732
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Apr 2020 00:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNTPkNYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B0820732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5986086CE7;
	Sat, 11 Apr 2020 00:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F+NO9AwOYjAr; Sat, 11 Apr 2020 00:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D973E86C80;
	Sat, 11 Apr 2020 00:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9D4BC089F;
	Sat, 11 Apr 2020 00:15:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 247A0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B60321549
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bl3ImCn18mmV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:15:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7740D20336
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Apr 2020 00:15:42 +0000 (UTC)
Received: from localhost (mobile-166-170-220-109.mycingular.net
 [166.170.220.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF4EE20732;
 Sat, 11 Apr 2020 00:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586564142;
 bh=Kl9s9BnyTNpcAp1IVNmSOJM5TO27runV/kRanLCW4cI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=vNTPkNYBsKTgVKdtBvFEucoJsHoYzArGWMC0WgwmKz9aiXqimBIZ+o3AViWAJpnIt
 LwM80C8dPIMgXmqJv/ijoPOnWHRVoAne59ZIig7+EQiCoVpiy/yT0vTSHpE55pHVoq
 zExiulaTtNsjHW+jc7tpRTI3V/iiio2+qDYL8AGk=
Date: Fri, 10 Apr 2020 19:15:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200411001539.GA209636@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410124418.34640-1-vaibhavgupta40@gmail.com>
Cc: rjw@rjwysocki.net, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] ethernet: intel: e1000:
 Convert to dev_pm_ops
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

Hi Vaibhav,

Thanks for the patch.  Minor procedural nits:

1) Use "git log --oneline
drivers/net/ethernet/intel/e1000/e1000_main.c" and match the prefix to
the convention for the file.  The e1000-specific commits all start
with "e1000: "

2) The subject should say something about the overall goal and why we
want this, so "dev_pm_ops" is a little too low-level.  I like "Convert
to generic power management", e.g.,

  e1000: Convert to generic power management

When you eventually post this to netdev, I think you should post
several patches as a series, e.g., maybe all the Intel drivers
together.  In this case it's not because they depend on each other,
but because the patches will be similar and the same set of people
will review them, so it's convenient for them to look at them all at
once.

On Fri, Apr 10, 2020 at 06:14:19PM +0530, Vaibhav Gupta wrote:
> Convert the legacy callback .suspend() and .resume()
> to the generic ones.

This should mention "power management" somehow.  I think 77b84bb306fd
("xen-platform: Convert to generic power management") is a good
template (of course, since I wrote it :)).

I have other questions, so no need to repost this until we work
through those a little bit.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

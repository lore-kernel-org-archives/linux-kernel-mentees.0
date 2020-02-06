Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D08C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 14:01:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F6620659
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 14:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F6620659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 76F581FDAF;
	Thu,  6 Feb 2020 14:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6hcyDCTkUUt; Thu,  6 Feb 2020 14:00:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 770422001E;
	Thu,  6 Feb 2020 14:00:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61F27C1D81;
	Thu,  6 Feb 2020 14:00:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0A59C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 14:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C486D86849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 14:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k+fiQ-I-5UZl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 14:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 70D0786837
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 14:00:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,409,1574118000"; d="scan'208";a="434766993"
Received: from unknown (HELO hadrien) ([131.254.252.28])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 15:00:51 +0100
Date: Thu, 6 Feb 2020 15:00:51 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2002061500370.2189@hadrien>
References: <132f414d-397f-fb9a-ff6e-5360df827147@web.de>
 <f7da90d8cc0e609a2a81e7a041cc98afedb215b6.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Markus Elfring <Markus.Elfring@web.de>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 2/2] tests: Add test case
 for matching pointers to const pointers (and variants)
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



On Thu, 6 Feb 2020, Jaskaran Singh wrote:

> On Wed, 2020-02-05 at 19:55 +0100, Markus Elfring wrote:
> > Would you like to avoid any abbreviations in the patch subject?
> >
>
> I used abbreviations to keep the patch subject short but still clear.
>
> Would the following be a better subject?
>
> "tests: Add test case to match const pointer variants"

OK for me.

julia

>
> Cheers,
> Jaskaran.
>
> >
> > > These types would not match previously.
> >
> > I imagine that this information can be improved for a nicer patch
> > description,
> > can't it?
> >
> > Regards,
> > Markus
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

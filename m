Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809A7C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:59:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4103120730
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4103120730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E190087D65;
	Thu, 16 Jan 2020 10:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTKpE98t4z6j; Thu, 16 Jan 2020 10:59:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57E4F87D5E;
	Thu, 16 Jan 2020 10:59:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43C9EC1D81;
	Thu, 16 Jan 2020 10:59:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 404C8C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 381818485E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVe5JxgVvVpY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 967E084CE6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:59:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,326,1574118000"; d="scan'208";a="336027035"
Received: from roc044r.vpn.inria.fr ([128.93.183.44])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 11:59:29 +0100
Date: Thu, 16 Jan 2020 11:59:29 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161158440.3888@hadrien>
References: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
 <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1957031417-1579172369=:3888"
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Markus Elfring <Markus.Elfring@web.de>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH] parsing_c: Add space for
	tokens after *
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1957031417-1579172369=:3888
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> On Thu, 2020-01-16 at 11:40 +0100, Markus Elfring wrote:
> > > In certain cases, there is no space added after the Pointer type.
> >
> > Will such a pretty-printing detail matter also for the clarification
> > of
> > a topic like “Make change influence configurable for coding style
> > rules”?
> > https://github.com/coccinelle/coccinelle/issues/37
> >
>
> Not sure what you mean. If you mean to say that the result should
> conform to the Linux coding style (i.e. the result should be "const
> char * const * y" with spaces et al intact), that seems like something
> for a different patch, right? Whether you want Coccinelle to conform to
> Linux coding style or not, the space should be added either way.


The option --smpl-spacing should address this issue, by preservign the
spacing illustrated in the semantic patch.  I don't know if it does that
in this case.

julia

>
> Cheers,
> Jaskaran.
>
> > Regards,
> > Markus
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1957031417-1579172369=:3888
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1957031417-1579172369=:3888--

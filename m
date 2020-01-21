Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60741C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 10:43:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2918022522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 10:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2918022522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC455204D9;
	Tue, 21 Jan 2020 10:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDAVoNed1Ayx; Tue, 21 Jan 2020 10:43:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EAC8E204D0;
	Tue, 21 Jan 2020 10:43:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0977C0176;
	Tue, 21 Jan 2020 10:43:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFEB6C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 10:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9ED46844E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 10:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxr8KZ52An31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 10:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3753583664
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 10:43:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; d="scan'208";a="432354955"
Received: from 77-108-166-118.brightstar.limited (HELO hadrien)
 ([77.108.166.118])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 11:43:09 +0100
Date: Tue, 21 Jan 2020 10:43:08 +0000 (GMT)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7f56dadb-0fde-359c-2b88-f812b0858ac8@web.de>
Message-ID: <alpine.DEB.2.21.2001211042120.5988@hadrien>
References: <7f56dadb-0fde-359c-2b88-f812b0858ac8@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH v2 0/3] cocci: Improve
 management of macros before typedefs
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



On Tue, 21 Jan 2020, Markus Elfring wrote:

> > If <typedef> is a known typedef (such as u8 or *_t) then label <macro>
> > as a CppMacro. Subsequent cases will label <typedef> correctly as a
> > typedef ident.
> >
> > Also add bool to the list of known typedefs so that cases of
>
> Can a wording like the following be nicer for such a change description?
>
>   Label <macro> as a CppMacro if <typedef> is a known type definition
>   (such as u8 or *_t).
>   Subsequent cases will label <typedef> correctly as a type definition identifier.

Actually, there is a piece of important information that is missing in
both of these messages.  It would be nice to say "Subsequent cases will
continue to label...".

julia


>
>   Add bool also to the list of known type definition identifiers so that cases of
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

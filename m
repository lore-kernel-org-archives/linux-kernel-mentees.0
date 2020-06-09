Return-Path: <SRS0=f+/8=7W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0746C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Jun 2020 10:01:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 829B1207ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Jun 2020 10:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 829B1207ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5786387B85;
	Tue,  9 Jun 2020 10:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krsw8kr141Ic; Tue,  9 Jun 2020 10:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8890787804;
	Tue,  9 Jun 2020 10:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A6CBC0863;
	Tue,  9 Jun 2020 10:01:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7CF8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jun 2020 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D51286EAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jun 2020 10:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbF03iHyDCN7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jun 2020 10:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6158886E89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Jun 2020 10:01:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,491,1583190000"; d="scan'208";a="351033513"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 12:00:48 +0200
Date: Tue, 9 Jun 2020 12:00:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2006091200350.2516@hadrien>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 0/4] parsing_c: parser: Add
	end_attributes_opt rule
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



On Mon, 8 Jun 2020, Jaskaran Singh wrote:

> Patches for improving the C parsing of attributes[1] introduced a lot
> redundant code in the C parser. This patch series resolves this by adding
> a rule for optional end attributes and merging the redundant code
> together.

All are applied, thanks.

julia

>
> [1]
> [PATCH v2 00/25] cocci: Improve C parsing of attributes
> https://lore.kernel.org/cocci/20200528122428.4212-1-jaskaransingh7654321@gmail.com/
>
> Jaskaran Singh (4):
>       parsing_c: parser: Add end_attributes_opt rule
>       parsing_c: parser: Use end_attributes_opt in decl2
>       parsing_c: parser: Use end_attributes_opt in field_declaration
>       parsing_c: parser: Use end_attributes_opt in cpp_other
>
>  parser_c.mly |   96 +++++------------------------------------------------------
>  1 file changed, 9 insertions(+), 87 deletions(-)
>
>
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

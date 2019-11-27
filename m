Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42126C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 20:54:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2094A2086A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 20:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2094A2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 011AE20431;
	Wed, 27 Nov 2019 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZA0st9YYrCRh; Wed, 27 Nov 2019 20:54:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 49DE92040F;
	Wed, 27 Nov 2019 20:54:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B013C1DD5;
	Wed, 27 Nov 2019 20:54:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E39CC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 20:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1CF8D87D14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 20:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fn6k7vo-oSyh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 20:54:01 +0000 (UTC)
X-Greylist: delayed 00:10:06 by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5EE3A87CD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 20:54:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,250,1571695200"; d="scan'208";a="328269542"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 21:43:52 +0100
Date: Wed, 27 Nov 2019 21:43:52 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.1911272143410.2559@hadrien>
References: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 0/2] cocci: Fix continue
 statement of death and similar cases
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



--- Please note the new email address ---


On Wed, 27 Nov 2019, Jaskaran Singh wrote:

> The following patch series is for fixing the "continue statement of
> death" report here:
>
> https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06199.html
>
> Changes include removing circular references that cause the crash
> and adding a corresponding test case.

Applied, thanks.

julia

>
>  engine/transformation_c.ml         |    2 +-
>  tests/stmt_removed_and_added.c     |    8 ++++++++
>  tests/stmt_removed_and_added.cocci |    7 +++++++
>  tests/stmt_removed_and_added.res   |    8 ++++++++
>  4 files changed, 24 insertions(+), 1 deletion(-)
>
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

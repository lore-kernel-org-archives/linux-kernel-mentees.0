Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EA5C352A4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 20:26:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0EE2465D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 20:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0EE2465D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 176BE87CB8;
	Wed, 12 Feb 2020 20:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G66jx8SywXG2; Wed, 12 Feb 2020 20:26:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DF6587BDE;
	Wed, 12 Feb 2020 20:26:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 316F6C1D88;
	Wed, 12 Feb 2020 20:26:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 059A5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 20:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 018902045C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 20:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUg819P5sOil
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 20:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by silver.osuosl.org (Postfix) with ESMTPS id 7F5542041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 20:26:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,434,1574118000"; d="scan'208";a="338979728"
Received: from abo-105-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.105])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 21:26:29 +0100
Date: Wed, 12 Feb 2020 21:26:29 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2002122126000.2594@hadrien>
References: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v5 0/3] cocci: Align the C AST
 and Cocci AST for pointer
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

On Tue, 11 Feb 2020, Jaskaran Singh wrote:

> This series is to address the type matching problem in Coccinelle.
>
> Patch 1/3 is for aligning the C and Cocci AST so that
> pointer to const pointer and its variants can be matched.
>
> Patch 2/3 reflects the pretty printing changes made in
> 1/3 in the ptrconstptr test case. A space is added between
> the * and const.
>
> Patch 3/3 consists of a test case for matching a pointer to
> const pointer and its variants.

All applied, thanks.

julia

>
> Changes in v5:
> --------------
> - Remove unnecessary parantheses and return of unit in Patch 1/3.
> - Have the test case in Patch 3/3 conform more closely with the
>   Linux kernel coding style.
>
> Changes in v4:
> --------------
> - Fix coding style w/r/t placement of comment with List.iter and
>   the qualifier printing function.
>
> Changes in v3:
> --------------
> - Add a space between the * and qualifier in Patch 1/3.
> - Add Patch 2/3 to add a space between * and const in the test
>   case ptrconstptr.
>
> Changes in v2:
> --------------
> - Change body and subject of Patch 2/2 as per suggestion of Markus
>   Elfring.
>
> [PATCH v5 1/3] parsing_c: Align C AST and Cocci AST for pointer
> [PATCH v5 2/3] tests: Add space between * and const in
> [PATCH v5 3/3] tests: Add test case to match const pointer variants
>
>  parsing_c/parser_c.mly      |    4 ++--
>  parsing_c/pretty_print_c.ml |   15 ++++++++++-----
>  tests/constptr.c            |    7 +++++++
>  tests/constptr.cocci        |   19 +++++++++++++++++++
>  tests/constptr.res          |    7 +++++++
>  tests/ptrconstptr.res       |    2 +-
>  6 files changed, 46 insertions(+), 8 deletions(-)
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

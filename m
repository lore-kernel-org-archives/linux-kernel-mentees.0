Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE266C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 15:36:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E4F20748
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 15:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E4F20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5319A861F4;
	Thu, 16 Jan 2020 15:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVEDnf_gbkBX; Thu, 16 Jan 2020 15:36:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B0694861DE;
	Thu, 16 Jan 2020 15:36:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5ED8C1D82;
	Thu, 16 Jan 2020 15:36:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 817B3C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 15:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E40287E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 15:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2hnQB5Bo7fM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 15:36:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9760C87CFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 15:36:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,326,1574118000"; d="scan'208";a="336066506"
Received: from roc044r.vpn.inria.fr ([128.93.183.44])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 16:36:04 +0100
Date: Thu, 16 Jan 2020 16:36:04 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200116104448.15539-3-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161635500.3888@hadrien>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-3-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for *
	const *
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



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> Previously, a space would not be added after the * const. Add
> a test case for testing spacing with use of the type.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>

Applied, thanks.

julia

> ---
>  tests/ptrconstptr.c     | 3 +++
>  tests/ptrconstptr.cocci | 7 +++++++
>  tests/ptrconstptr.res   | 3 +++
>  3 files changed, 13 insertions(+)
>  create mode 100644 tests/ptrconstptr.c
>  create mode 100644 tests/ptrconstptr.cocci
>  create mode 100644 tests/ptrconstptr.res
>
> diff --git a/tests/ptrconstptr.c b/tests/ptrconstptr.c
> new file mode 100644
> index 00000000..a2a3cf71
> --- /dev/null
> +++ b/tests/ptrconstptr.c
> @@ -0,0 +1,3 @@
> +void main() {
> +	const char * const * x;
> +}
> diff --git a/tests/ptrconstptr.cocci b/tests/ptrconstptr.cocci
> new file mode 100644
> index 00000000..030bc024
> --- /dev/null
> +++ b/tests/ptrconstptr.cocci
> @@ -0,0 +1,7 @@
> +@@
> +type t;
> +@@
> +void main() {
> +-	t x;
> ++	t y;
> +}
> diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
> new file mode 100644
> index 00000000..f5b2210c
> --- /dev/null
> +++ b/tests/ptrconstptr.res
> @@ -0,0 +1,3 @@
> +void main() {
> +	const char *const *y;
> +}
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

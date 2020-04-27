Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0079C54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 17:31:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 907E8206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 17:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 907E8206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61939874F3;
	Mon, 27 Apr 2020 17:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8tKwFOdpJzZ; Mon, 27 Apr 2020 17:31:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3DBD86E88;
	Mon, 27 Apr 2020 17:31:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A365CC18DC;
	Mon, 27 Apr 2020 17:31:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A49FC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4E33220426
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ar91GKop2-y1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:31:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by silver.osuosl.org (Postfix) with ESMTPS id ACAFE21563
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 17:31:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347099725"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:31:39 +0200
Date: Mon, 27 Apr 2020 19:31:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-23-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271931170.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-23-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 22/23] tests: Add test case for
 removing parameter attributes
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



On Mon, 27 Apr 2020, Jaskaran Singh wrote:

> Add a test case for removing Parameter attributes. The test case checks
> correct removal of the attribute when it is:
>
> - before the parameter type.
> - after the parameter type and before the parameter identifier.
> - after the parameter identifier.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  tests/remove_param_attrs.c     | 11 +++++++++++
>  tests/remove_param_attrs.cocci | 13 +++++++++++++
>  tests/remove_param_attrs.res   | 11 +++++++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 tests/remove_param_attrs.c
>  create mode 100644 tests/remove_param_attrs.cocci
>  create mode 100644 tests/remove_param_attrs.res
>
> diff --git a/tests/remove_param_attrs.c b/tests/remove_param_attrs.c
> new file mode 100644
> index 00000000..8ec1ffde
> --- /dev/null
> +++ b/tests/remove_param_attrs.c
> @@ -0,0 +1,11 @@
> +int func1(int x, __nocast int y) {
> +	return 0;
> +}
> +
> +int func2(int x, int __nocast y) {
> +	return 0;
> +}
> +
> +int func3(int x, int y __nocast) {
> +	return 0;
> +}
> diff --git a/tests/remove_param_attrs.cocci b/tests/remove_param_attrs.cocci
> new file mode 100644
> index 00000000..43f5a204
> --- /dev/null
> +++ b/tests/remove_param_attrs.cocci
> @@ -0,0 +1,13 @@
> +@@
> +type T,U;
> +attribute name __nocast;
> +identifier x,y;
> +@@
> +
> +T x(
> +    ...,
> +    U y
> +-	__nocast

So the idea is that the attribute is removed no matter where it occurs?

julia

> +    ,
> +    ...
> +  ) {...}
> diff --git a/tests/remove_param_attrs.res b/tests/remove_param_attrs.res
> new file mode 100644
> index 00000000..3705e814
> --- /dev/null
> +++ b/tests/remove_param_attrs.res
> @@ -0,0 +1,11 @@
> +int func1(int x, int y) {
> +	return 0;
> +}
> +
> +int func2(int x, int y) {
> +	return 0;
> +}
> +
> +int func3(int x, int y) {
> +	return 0;
> +}
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

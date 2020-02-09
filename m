Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9A1C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 16:48:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B97A20714
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 16:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B97A20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D74FB8762E;
	Sun,  9 Feb 2020 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n66RtwrydapJ; Sun,  9 Feb 2020 16:48:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F70C87594;
	Sun,  9 Feb 2020 16:48:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46EEDC089F;
	Sun,  9 Feb 2020 16:48:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 780C0C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6D0B587594
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k+MPzR7SHxaq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:48:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1DD2887535
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 16:48:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,422,1574118000"; d="scan'208";a="435147247"
Received: from abo-105-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.105])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 17:48:26 +0100
Date: Sun, 9 Feb 2020 17:48:25 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200209153452.11837-4-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2002091747430.3430@hadrien>
References: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
 <20200209153452.11837-4-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org,
 cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH v4 3/3] tests: Add test case to
 match const pointer variants
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

On Sun, 9 Feb 2020, Jaskaran Singh wrote:

> Pointer to const pointer and its variants would not match previously.
> Add a test case for matching these types.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  tests/constptr.c     |  7 +++++++
>  tests/constptr.cocci | 19 +++++++++++++++++++
>  tests/constptr.res   |  7 +++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 tests/constptr.c
>  create mode 100644 tests/constptr.cocci
>  create mode 100644 tests/constptr.res
>
> diff --git a/tests/constptr.c b/tests/constptr.c
> new file mode 100644
> index 00000000..13fe064c
> --- /dev/null
> +++ b/tests/constptr.c
> @@ -0,0 +1,7 @@
> +int main()
> +{
> +	const char * const * id;
> +	const char * * const * id;
> +	const char * const * * id;
> +	const char * const id;

As far as I can see in the Linux kernel, there is no space between two *s,
and there is no space before an identifier.

julia

> +}
> diff --git a/tests/constptr.cocci b/tests/constptr.cocci
> new file mode 100644
> index 00000000..29f0aa96
> --- /dev/null
> +++ b/tests/constptr.cocci
> @@ -0,0 +1,19 @@
> +@ r0 @
> +identifier id;
> +@@
> +const char * const *
> +- id
> ++ id1
> +;
> +const char * * const *
> +- id
> ++ id2
> +;
> +const char * const * *
> +- id
> ++ id3
> +;
> +const char * const
> +- id
> ++ id4
> +;
> diff --git a/tests/constptr.res b/tests/constptr.res
> new file mode 100644
> index 00000000..0af4de9a
> --- /dev/null
> +++ b/tests/constptr.res
> @@ -0,0 +1,7 @@
> +int main()
> +{
> +	const char * const * id1;
> +	const char * * const * id2;
> +	const char * const * * id3;
> +	const char * const id4;
> +}
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

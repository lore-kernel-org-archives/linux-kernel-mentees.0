Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C81CD80AE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 11:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C288819BE;
	Tue, 10 Oct 2023 11:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C288819BE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lo18jUpa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgpF-acVb1lz; Tue, 10 Oct 2023 11:35:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3EF1819C8;
	Tue, 10 Oct 2023 11:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3EF1819C8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DE7AC0071;
	Tue, 10 Oct 2023 11:35:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D931C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22BAB405CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22BAB405CF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=lo18jUpa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhWkyQuHcK9O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:35:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41DFC40592
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 11:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41DFC40592
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 351F8CE1DA8;
 Tue, 10 Oct 2023 11:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AB1C433C8;
 Tue, 10 Oct 2023 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696937711;
 bh=Dgl0erwYB9qFKvNeOVGhClGJ2XJSfTqlW8vQXJ16jwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lo18jUpaQDYGWwjRo5pwiCs8yx9ipILrzsSMZQ0R0MKZzc6ICJSPpb+hEl5NdWk4K
 XoSQaYMpxaNs78W/9Vqy2uDV4djSIQUaE8o+k8DgbLH3Ze2Eu8AgM5LRcwXhDZsX2z
 g/o6YR/zmdh2S04QblPAcSQ879RY7ZPv2YrU0p6c=
Date: Tue, 10 Oct 2023 13:35:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
Message-ID: <2023101050-scuff-overstay-9b43@gregkh>
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, pbonzini@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 10, 2023 at 01:04:39PM +0300, Jos=E9 Pekkarinen wrote:
> There are bioses that doesn't allow to configure the
> number of asids allocated for SEV/SEV-ES, for those
> cases, the default behaviour allocates all the asids
> for SEV, leaving no room for SEV-ES to have some fun.

"fun"?

Also, please use the full 72 columns for your changelog.

> If the user request SEV-ES to be enabled, it will
> find the kernel just run out of resources and ignored
> user request. This following patch will address this
> issue by making the number of asids for SEV/SEV-ES
> configurable over kernel module parameters.
> =

> Signed-off-by: Jos=E9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  arch/x86/kvm/svm/sev.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 07756b7348ae..68a63b42d16a 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -51,9 +51,18 @@
>  static bool sev_enabled =3D true;
>  module_param_named(sev, sev_enabled, bool, 0444);
>  =

> +/* nr of asids requested for SEV */
> +static unsigned int requested_sev_asids;
> +module_param_named(sev_asids, requested_sev_asids, uint, 0444);
> +
>  /* enable/disable SEV-ES support */
>  static bool sev_es_enabled =3D true;
>  module_param_named(sev_es, sev_es_enabled, bool, 0444);
> +
> +/* nr of asids requested for SEV-ES */
> +static unsigned int requested_sev_es_asids;
> +module_param_named(sev_es_asids, requested_sev_asids, uint, 0444);

Why more module parameters?  Why can't this "just work" properly without
forcing a user to make manual changes?  This isn't the 1990's anymore.


> +
>  #else
>  #define sev_enabled false
>  #define sev_es_enabled false
> @@ -2194,6 +2203,11 @@ void __init sev_hardware_setup(void)
>  	if (!max_sev_asid)
>  		goto out;
>  =

> +	if (requested_sev_asids + requested_sev_es_asids > max_sev_asid) {
> +		pr_info("SEV asids requested more than available: %u ASIDs\n", max_sev=
_asid);

Why isn't this an error?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

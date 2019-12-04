Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB2EC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 19:57:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7734E2073B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 19:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="E7xM2G7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7734E2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vaga.pv.it
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B86E232D7;
	Wed,  4 Dec 2019 19:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJwTNffNbqpK; Wed,  4 Dec 2019 19:57:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D78FE232FA;
	Wed,  4 Dec 2019 19:57:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD467C18DD;
	Wed,  4 Dec 2019 19:57:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAE47C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA03986F85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzHPUhdDtlO0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 19:57:35 +0000 (UTC)
X-Greylist: delayed 00:08:22 by SQLgrey-1.7.6
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2BE086F7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 19:57:34 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 10E7DE80;
 Wed,  4 Dec 2019 20:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1575488947; x=1577303348; bh=yLYpeKqjnaOhnM2r4tIxV0b85RTS/6he0Mv
 6cNbwlEQ=; b=E7xM2G7nTnUPsnUVjbv7tOKoo3tPyTc6e6I/SW4owdScN5YvTzE
 RgQbQn9NCneyvA8BRrWgDgvFEE4uIQ5iHIgTM4CGXNYS4wbCmA4Lc965tkElJAbp
 OlWqGpdjGGtkHVyI0wnOOVQaEmkkhmKPI1kcZpse7eV2V51ZJeNDRT52lPpiSBdc
 xreJ7pgQFLswjrvyVtLEwfUJuFI2p7z1xnjo4w401kfzibw2xSMO48RxMF2l9Xpu
 H/R5CW0BZ9C8odUuNZYmp/MfeehT+XKIuxpnf9cIGujFEfDXy70pDAXyVRTKKu+N
 ma5C1dZ21jSjcLYlyhnv4k3rWcsddkmObNWGjC+guv9hbaYtdufkpbkQwkzeX8pH
 1C5pWi5JHAlU73M4O5s4JxpSfgClQNOk0j3xVHvCwWfktQOyAjaOu3wjql40Ranh
 LXYW4xP/fsB6gcssvpz022pefrMh/CcwNC8eRT5Wm8uZz9vL6U0Y99I2pysmDdVL
 9OT4ucRERsVPDJalYgndny83nYtYN0VruFdVdE06QflR/eTSBy7XjNZz+BhXwOHM
 4orugqieCP8CdkPH8dNBoom+9+2poBoKnYSCu0DVOQ9zuujuseQhZytmjadoPzQv
 wwsaHDFSf+Nl08apyHgqoLrUXLu4n8sSjr0r3yEV6fqdvs9q11yjBc20=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiCaJ7Unynau; Wed,  4 Dec 2019 20:49:07 +0100 (CET)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id C99D056F;
 Wed,  4 Dec 2019 20:49:07 +0100 (CET)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 6A5FF3B72;
 Wed,  4 Dec 2019 20:49:07 +0100 (CET)
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: madhuparnabhowmik04@gmail.com
Date: Wed, 04 Dec 2019 20:49:05 +0100
Message-ID: <4850753.A3onD7O4GF@harkonnen>
In-Reply-To: <20191204104554.9100-1-madhuparnabhowmik04@gmail.com>
References: <20191204104554.9100-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, mchehab@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] Documentation:
	kernel-hacking: hacking.rst: Change reference to document
	namespaces.rst to symbol-namespaces.rst
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

If you are interested there is a little discussion here about it

https://www.lkml.org/lkml/2019/11/22/1580

On Wednesday, December 4, 2019 11:45:54 AM CET madhuparnabhowmik04@gmail.com 
wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch fixes the following documentation build warning:
> Warning: Documentation/kernel-hacking/hacking.rst references
> a file that doesn't exist: Documentation/kbuild/namespaces.rst
> 
> According to the following patch:
> https://patchwork.kernel.org/patch/11178727/
> (doc: move namespaces.rst from kbuild/ to core-api/)
> 
> The file namespaces.rst was moved from kbuild to core-api
> and renamed to symbol-namespaces.rst.
> Therefore, this patch changes the reference to the document
> kbuild/namespaces.rst in hacking.rst to
> core-api/symbol-namespaces.rst
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  Documentation/kernel-hacking/hacking.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kernel-hacking/hacking.rst
> b/Documentation/kernel-hacking/hacking.rst index a3ddb213a5e1..d62aacb2822a
> 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -601,7 +601,7 @@ Defined in ``include/linux/export.h``
> 
>  This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
>  namespace. Symbol Namespaces are documented in
> -``Documentation/kbuild/namespaces.rst``.
> +``Documentation/core-api/symbol-namespaces.rst``.
> 
>  :c:func:`EXPORT_SYMBOL_NS_GPL()`
> 
>  --------------------------------
> @@ -610,7 +610,7 @@ Defined in ``include/linux/export.h``
> 
>  This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a
> symbol namespace. Symbol Namespaces are documented in
> -``Documentation/kbuild/namespaces.rst``.
> +``Documentation/core-api/symbol-namespaces.rst``.
> 
>  Routines and Conventions
>  ========================




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787F3D47B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Apr 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782377; cv=none; b=JesmFtCgJS9WT/Jw+CRQb5CJNQr0dx6YpM+jX4x9tmmuZx8x0wVaPOoWASXHvhdZakOWvl19lSa4DvfuHoKFLUb23BnY/PYqXGWWtxkRaKK/yjkp45chsSFeh24RbGYHEyeAZCJEYo351QUkgoirhFCQO72asGwA0Xh98ljU2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782377; c=relaxed/simple;
	bh=vzCTLudpF4C01RWtxD6HaTmInReorM3mZfiuLXhUbls=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EqglFD7LoQWKlKMYIumtAjF79BEhhuPlJnF0RNJhuUR0l9rSKbXJmlJTzs55q2uBSNDjS1DyTBTTf6iDdfONWkvcLgQcbEnqEYuYYaqw9mrwMSnXYjasKbZlaOcSlNaiQFCmaXjPg0+ikt0xLrAikXacrCsZQJCEcyZ20nx38T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VL370Xbd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VL370Xbd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327AB42021
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Apr 2026 14:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.493
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89GfCE-Z7mdW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2026 14:39:35 +0000 (UTC)
X-Greylist: delayed 370 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 21 Apr 2026 14:39:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FC7842018
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linux.dev
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC7842018
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VL370Xbd
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.215.58.189; helo=out-189.mta1.migadu.com; envelope-from=luka.gejak@linux.dev; receiver=<UNKNOWN> 
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0FC7842018
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Apr 2026 14:39:34 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776782000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9d+Zf4HN1ZVE9Pso1ZaDrVaSQboLdNoIcrritVKuxDg=;
	b=VL370XbdxPajJb7/FRmX2ZBqK76HHL/kQ6Uyl+4CYipra3PmPs9RgstBiGc2eE8KqoUj5f
	LTrj+3jp/lFimMhCYIsLhzYm0XUheZmoJBH0acqz6+rXcUh7mg8pRVGdaWdxInBeTjd2WO
	Dxt56hbP31S4SQqneBxIi3LY0VZS1Kc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:33:08 +0200
Message-Id: <DHYWNCY622RH.J9Z0VTVKXYX1@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <skhan@linuxfoundation.org>, <me@brighamcampbell.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused offset in phase 2
 _BlockWrite()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Robertus Diawan Chris" <robertusdchris@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260420044651.164450-1-robertusdchris@gmail.com>
In-Reply-To: <20260420044651.164450-1-robertusdchris@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 20, 2026 at 6:46 AM CEST, Robertus Diawan Chris wrote:
> Commit c1314fe4d28f ("staging: rtl8723bs: remove all RT_TRACE logs
> in hal/ and os_dep/") removed the unnecessary RT_TRACE logs in hal/
> and os_dep/ files, but left the variable "offset" in the Phase 2
> _BlockWrite() function unused, so delete it.
>
> This is reported by Coverity Scan with CID 1408950 as UNUSED_VALUE.
>
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e794fe3caf9d..988829d5f3c3 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -68,8 +68,6 @@ static int _BlockWrite(struct adapter *padapter, void *=
buffer, u32 buffSize)
> =20
>  	/* 3 Phase #2 */
>  	if (remainSize_p1) {
> -		offset =3D blockCount_p1 * blockSize_p1;
> -
>  		blockCount_p2 =3D remainSize_p1/blockSize_p2;
>  		remainSize_p2 =3D remainSize_p1%blockSize_p2;
>  	}

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak

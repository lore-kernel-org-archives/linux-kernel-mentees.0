Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79DBC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 04:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BF5784CED;
	Thu,  2 Nov 2023 04:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BF5784CED
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTwbS13f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M045sYsFNP-k; Thu,  2 Nov 2023 04:20:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 669DD84CB6;
	Thu,  2 Nov 2023 04:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 669DD84CB6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BFB0C0039;
	Thu,  2 Nov 2023 04:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1258C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B62E70597
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B62E70597
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=BTwbS13f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLgU7R1z7h5R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:20:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F011570596
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 04:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F011570596
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DD1F60C21;
 Thu,  2 Nov 2023 04:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0672C433C8;
 Thu,  2 Nov 2023 04:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698898845;
 bh=txrJlBB0Uz613TnTKBLK7e9nihyZmtdDBI+sCpPNnt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTwbS13fGaAJLxnc4pi0VX3VLVMDZ6et4pCX3CHqbAEMybAfp4b4JDBjGpZjP+i3n
 MTUkffkYFeq8gurYFgsV0/qfMuHG5TtKjO+fm5tRUJyQSMeLFzskbBj3N4AZB4Z2Uc
 kpiO2oZylgD5+j+hs4zmzG/7hID905PbDMgqnV+Sph+gWvOPtsU03jgCKR4Ns43sPI
 86UXEdfJLdStgL8VhdFxWpLjCuEVNlff1PBNEe7JPQ1dee93BNFrqzuA4iptWi+FiA
 QI/uYpZZT75IOm1xJIeAZK83IwFNEfg3RIf7uU6/iopudX10OAlsfbAn1sEdtd8EQV
 nqfc/bAFy2YIg==
Date: Wed, 1 Nov 2023 21:20:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Subject: Re: [PATCH 0/7] crypto: Proper Initialization of `struct
 skcipher_walk` in x86 Glue Files
Message-ID: <20231102042043.GD1498@sol.localdomain>
References: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB3PR10MB683562E7BD2DC73A48BEA3C8E8A6A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Cc: x86@kernel.org, herbert@gondor.apana.org.au, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de,
 linux-crypto@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

Hi Yuran,

On Thu, Nov 02, 2023 at 09:34:08AM +0530, Yuran Pereira wrote:
> In multiple `*_encrypt`, `*_crypt`, `*_decrypt` functions within the x86/crypto
> glue files, the `skcipher_walk` structs being used are not properly initialized
> prior their usage which can lead to undefined behaviour if the `flags` field of
> this structure were to contain junk values at the time of its usage.
> 
> This patch series ensures that instances of `struct skcipher_walk` are correctly
> initialized across different x86/crypto glue files.
> 
> Yuran Pereira (7):
>   crypto: Fixes uninitialized skcipher_walk use in sm4_aesni_avx_glue
>   crypto: Fixes uninitialized skcipher_walk use in des3_ede_glue
>   crypto: Fixes uninitialized skcipher_walk use in chacha_glue
>   crypto: Fixes uninitialized skcipher_walk use in aesni-intel_glue
>   crypto: Fixes uninitialized skcipher_walk use in aria_aesni_avx2_glue
>   crypto: Fixes uninitialized skcipher_walk use in aria_aesni_avx_glue
>   crypto: Fixes uninitialized skcipher_walk use in aria_gfni_avx512_glue

Updating all callers of skcipher_walk_virt() seems like the wrong approach.
Shouldn't skcipher_walk_virt() be fixed to initialize the flags to 0 instead?

Also, does this fix affect any behavior, or is it just to fix a KMSAN warning?
It needs to be fixed either way, but it's helpful to understand the effect of
the fix so that people can decide whether it needs to be backported or not.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

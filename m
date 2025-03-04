Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A60E24C064
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106841; cv=none; b=nryEfE839GrQVTc3KGjRWXO5/qSvR+4A2F+KL1tdUs4oa1uwfpkM5eqPoT0sNgswcHcTXoyAz1PDhy9wXbKb8GGkZxM/r6QUpgf3v9TgynXPjIYbSD/pOItfIIWy8hB9RyYY3LDPYnMK+xJ5N/1Re33dho72AXTHUVaDn1jzyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106841; c=relaxed/simple;
	bh=0NFhIHUSIXLQ1IERnVrz79OxkFLXeS/HqU9Qitji2q0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j2wYwnoIkOE9iT6ko4S/4STPvqZ7sNEREgo5o8k5fXth63AjeuxYKH3WuRNopc1E2h3oJ6NqOGSjrsxCGNby5P1wn8ZpTfHkpreiQs+l94sQgyrgZko7Lr3jK/se3vYcs0dtzpiKVCBSzBrBAA6wn78TNi5lZNMUM+ALKxMsBsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CqpFpRab; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CqpFpRab"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACDEB4032E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 16:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRcF7HaNdf1y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Mar 2025 16:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6DFF40026
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6DFF40026
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=CqpFpRab
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E6DFF40026
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  4 Mar 2025 16:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF3484105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1741106305; bh=GNXSsU+nJrWFy0zOEQmbq0fVDqKBxRTGtxEH/aS4AaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CqpFpRabFcZkVlHkdXF5u0TnXe5vmPQDD5+hgy/Ut8ryHvW2EFjp8PbrVuGfAAg8f
	 JFhAOCqoHadLBKNSfX7xKNQAHQC0Il2Hqw96j2IBTwG/KAwYtI3hIBbsZsZSxk65S8
	 actAD2/JcXNLiulR8WtVK+Qu9gKQ15cR3TXAy4rWJ2rVst8/v96ZFsGzpz0JO+SKQN
	 B/LuliWECXn0y8Q/bKt50TGrUztHAvnC2T89LRRhYPRq0pXo+mgjnBOw+jKKF+13ON
	 NhHI/LMZsiyxFFxuEOY+Y2KWdyh5pKhlGSFFl0MfCHbtb6Rc6gtNAw0U1v5kddpuJZ
	 SS7Ul0z4311Mw==
Received: from localhost (unknown [73.243.92.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF3484105F;
	Tue,  4 Mar 2025 16:38:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: gshahrouzi@gmail.com, linux-kernel@vger.kernel.org
Cc: trivial@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/arch/arm64: Fix spelling in amu.rst
In-Reply-To: <67bd05b5.c80a0220.205997.19df@mx.google.com>
References: <67bd05b5.c80a0220.205997.19df@mx.google.com>
Date: Tue, 04 Mar 2025 09:38:23 -0700
Message-ID: <87cyeweoow.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

gshahrouzi@gmail.com writes:

>>From 748db76c8e9f6e5906be0033dcdec9bb5749b303 Mon Sep 17 00:00:00 2001
> From: Gabriel <gshahrouzi@gmail.com>
> Date: Mon, 24 Feb 2025 18:09:26 -0500
> Subject: [PATCH] Docs/arch/arm64: Fix spelling in amu.rst
>
> Change though to through.
>
> Signed-off-by: Gabriel <gshahrouzi@gmail.com>
> ---
>  Documentation/arch/arm64/amu.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/arm64/amu.rst b/Documentation/arch/arm64/amu.rst
> index 01f2de2b0450..ac1b3f0e211d 100644
> --- a/Documentation/arch/arm64/amu.rst
> +++ b/Documentation/arch/arm64/amu.rst
> @@ -80,7 +80,7 @@ bypass the setting of AMUSERENR_EL0 to trap accesses from EL0 (userspace) to
>  EL1 (kernel). Therefore, firmware should still ensure accesses to AMU registers
>  are not trapped in EL2/EL3.
>  
> -The fixed counters of AMUv1 are accessible though the following system
> +The fixed counters of AMUv1 are accessible through the following system
>  register definitions:

Applied, thanks.

jon

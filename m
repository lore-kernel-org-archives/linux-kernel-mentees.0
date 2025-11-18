Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1035A93E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482438; cv=none; b=sw2bOlDwpAvGf1Dzd4+Hml5s1XwjDkFF5UPx+KWICqskzA7pg/i/03SEIlqGE1GygldbzWbt04oa+DrSendqap7KXk5z6lh4J/8uLk4rkJV7fX/CBdzP4F0te5R0laQmnjZ4zqG8kjusiDSj6yF+xuUbIWiKDLMrOVwS+6yJ+hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482438; c=relaxed/simple;
	bh=ZErJ1stbDGIyZGoBgeEkPvnY9cCeOZujnAfcZxubxw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rk25iGGZpIKtxHT66lKOnC67Md+w8Tap9bzSdGnL78aRCgQTdIgcPGTm3iXPyPDCv6qgUdpCmdy+8KjMRQePZ9/1gcDPnxtLW0Oyob3KIaIl3Sb/M8FeSeAjFlcHxmiaUSq/z7Ch+WA3mcXiANBKPlqxhTyKzxHN06kJCltE1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U0fXHzTy; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U0fXHzTy"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72F340D37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAqSqRI5Q2v5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Nov 2025 16:13:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90DFD40D14
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90DFD40D14
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=U0fXHzTy
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 90DFD40D14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 16:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 729FA40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763482434; bh=z/ptu/328X76JEIHZbrfyQlPMFmoz2Zdf92tUTm1rp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U0fXHzTy4PUuTgHcgK9tpgm0NBtfFY7RrK8t4KG2Af9VWaFUcxOlCcQFbXfazoQZR
	 +MeBZgilUsXeLZMZuR1RKfsxsOVHQPejqYminbIF01RLpDLmEQ5aOnZz5YJ32XvPub
	 rcMWMXWxwRRlsRZQwvlmc+Wt28YY6CSEF98/Lsas6wne2b7Ul9vzNkIKNnh4HJyWG5
	 xF7RXGsOvuZfzr8cPi1u6jBD6GbDpvIIAl3HHgyKytJ+cc/7mJ8aYrpT8RShGmmNQz
	 O3kRLh0qSyY16C+WNJGLAn/8a4WI0wKtI7CfHnrqAatWlTZjuaktBRTacIdZ6Bekay
	 ROBsUvk+ladpg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 729FA40C42;
	Tue, 18 Nov 2025 16:13:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Ankit Khushwaha
 <ankitkhushwaha.linux@gmail.com>
Subject: Re: [PATCH] docs: parse-headers.rst: Fix a typo
In-Reply-To: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
References: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
Date: Tue, 18 Nov 2025 09:13:53 -0700
Message-ID: <87ikf75nem.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> writes:

> Replace "vantage" with "advantage" in the description of userspace API
> cross-references.
>
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
>  Documentation/doc-guide/parse-headers.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
> index bd34a6d00ca9..a7bb01ff04eb 100644
> --- a/Documentation/doc-guide/parse-headers.rst
> +++ b/Documentation/doc-guide/parse-headers.rst
> @@ -5,7 +5,7 @@ Including uAPI header files
>  Sometimes, it is useful to include header files and C example codes in
>  order to describe the userspace API and to generate cross-references
>  between the code and the documentation. Adding cross-references for
> -userspace API files has an additional vantage: Sphinx will generate warnings
> +userspace API files has an additional advantage: Sphinx will generate warnings
>  if a symbol is not found at the documentation. That helps to keep the

Applied, thanks.

jon

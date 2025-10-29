Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C48278156
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755270; cv=none; b=ci5hKZrNegtMad6Y1oeggXVa1I8mv+rUWJx0Yirvb9eZNvhOvfT8cWJGp2qWWDsoecXGWc53EwKmdUkGSQy7mGZm8yd/GyvE9FCYIYjgXF9vEzCwG99wad9em6h8eFGWVX38D5Roncmn9BSPRPui9oLh/O5hcEXqDpt4HgZkodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755270; c=relaxed/simple;
	bh=ItsQFA6gHB0B+bH4phqSUxOq4pDY0347EnzmcFg1V68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZTIDjOFJXkI6+O+NeXlVbRs83PR3j6F1fwRfon7+X2BDBoQMoWlm7vhewK+KVRO0NB5BFm2LJ1JvMOVZKXKPW/pnvZMVCeB0MS+l+XLm4wrHK4psgQhkQyNYZZKlILpT/PCjLn5ZvhakL7O+24Z5LvBzrWTXvHvlcee61Nx9tIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WReRaWhr; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WReRaWhr"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D8960AE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 16:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7uBUEh6_QJU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 16:27:47 +0000 (UTC)
X-Greylist: delayed 535 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 29 Oct 2025 16:27:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E24FB606EE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E24FB606EE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=WReRaWhr
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E24FB606EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 16:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8076E406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1761754729; bh=fipKxuWbGOwA/hJdR+OnXvH3NJNssstojmnRmDx0+gc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WReRaWhr0I/tIRElpLUw8GYU+7drG+ZGue7M5nGQqjJEr83utz/O9qv6fcoA5cPkM
	 OyKgpzZA3HqK7TW3NDpOXU7AfoKYSDg+RoyAl/l0CX04z0VtCHF8MqyaFJzZqsHOTO
	 OqDWaRzMnmRADf7EqWlrfRytX3cq+79HE1P8oV7fnpkNkYwLm9bU/H6I1PZ0lef/6U
	 IN9ZmqONAjFTEqk2BD4yccB6M5jmpqf7OaSMVfM21veuadhwR/OUeZpANYZGEwIYWJ
	 Tuma5YRc564Hsz0XRrJR5u340unoRUr+gnJNV77x8GIEMhmvnqmcOgLdbQbfpNbXiU
	 JYX0S5k2C4YPA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8076E406FB;
	Wed, 29 Oct 2025 16:18:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 bhanuseshukumar@gmail.com
Subject: Re: [PATCH] docs: Makefile: Sort Documentation targets
 case-insensitively in make help
In-Reply-To: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
References: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
Date: Wed, 29 Oct 2025 10:18:48 -0600
Message-ID: <874irhr89j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com> writes:

> Avoid case-sensitive sorting when listing Documentation targets in make help.
> Previously, targets like PCI and RCU appeared ahead of others due to uppercase
> names.
>
> Normalize casing during _SPHINXDIRS generation to ensure consistent and
> intuitive ordering.
>
> Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Notes
>  - Patch is tested with make help command.
>  - Verified case-insensitive sorting.
>
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 3609cb86137b..00c81e7947a9 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -23,7 +23,7 @@ SPHINXOPTS    =
>  SPHINXDIRS    = .
>  DOCS_THEME    =
>  DOCS_CSS      =
> -_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
> +_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
>  SPHINX_CONF   = conf.py
>  PAPER         =
>  BUILDDIR      = $(obj)/output

I'm unconvinced that the extra complexity is really needed ... but I
went to apply it anyway.  Unfortunately, this patch doesn't apply to
docs-next.

Thanks,

jon

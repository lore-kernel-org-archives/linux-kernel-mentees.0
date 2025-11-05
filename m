Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923F34404A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367590; cv=none; b=pJv0lW4qh1eCN3ytD0tdubI8DtJDNbJM2yCLt8n3F73NNtjMw10zxMFiHdGYhB0uycoTwHH9l7rK/JeuH6fCNKBXKzCbOpPKmaPCoCzEWaRJFLXg2ZrBCpgT7dxsBuInIqSIW3qV1A7slKD5bKGVYlHXrMsZHJ8aYHizWODlXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367590; c=relaxed/simple;
	bh=PDY638TJ+NHvA7DQ+tycVynkF22b465WmyEXQFIoKEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DLSfj3az1yEBxVTlhPjPkjfHW3orcs8iTXZmgOujdv1nzN2RZFXd7LEmFESKnLV6MGv4rZnoIkHvsSdGQV8Wu4duJyjR3accq0kn+hACnY+M1yt8QegU3eBLAlim1KPgOvTdyLSYkivTQTcw8wJySkBmAfZE3wHzNx9kaMrmdRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nSKPff3N; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nSKPff3N"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB1740116
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 18:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w23vLMAEJkne for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 18:33:07 +0000 (UTC)
X-Greylist: delayed 378 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 05 Nov 2025 18:33:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F4DA41202
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4DA41202
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=nSKPff3N
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F4DA41202
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 18:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 871A840AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1762367208; bh=y6wHClrjLpszceIMsNVguTMUWHJ4Ch2ZaKXmo+sISz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nSKPff3NhYcUtQm1/4/ae2kGVnkZBSmCsDhAHEzkAiCXdOl2/6fdxiRSUCJfKflDk
	 ZPk/AhseyPQ00P//ZSG/hL/cEkQubzUl0r/x1VITVJyx+W+FxCPdyQ4rdvHp5e+R99
	 1OHy9k6AOjXzKb0FbKFQTL7NIRMoa/beZTwEsRHdwZA93BmEgDXOdmb8gLyBSI19LH
	 /uu5YxB83plCupYTR9SWthmmRx3fnTaoSbBzrDodv1MhfBd1oWEFdXz/lxBSQS38Fy
	 zJfiz90OchAekaYNOsV6dOTXRouVtSplgfg9uVv/zAyva9zMk+lBwW4LuM+b91x3PR
	 L9mbxZUnU8KbA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 871A840AFB;
	Wed,  5 Nov 2025 18:26:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, bhanuseshukumar@gmail.com
Subject: Re: [PATCH v2] docs: Makefile: Sort Documentation targets
 case-insensitively in make help
In-Reply-To: <20251104061723.16629-1-bhanuseshukumar@gmail.com>
References: <20251104061723.16629-1-bhanuseshukumar@gmail.com>
Date: Wed, 05 Nov 2025 11:26:47 -0700
Message-ID: <87bjlg72u0.fsf@trenco.lwn.net>
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
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  V1-V2 changes
>  - Rebased on to commit 27600b51fbc8 ("MAINTAINERS: extend DOCUMENTATION SCRIPTS to the full directories")
>    in docs-next.
>  - Link to V1: https://lore.kernel.org/lkml/20251015012922.19467-1-bhanuseshukumar@gmail.com/

Applied, thanks.

jon

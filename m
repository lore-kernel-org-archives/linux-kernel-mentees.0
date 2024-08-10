Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC00158546
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723301179; cv=none; b=PhyKjpqbwOjyoC+NttU/kWhA5hgbfFNJGl3Hr6O4fxVAOhtKN7mJzTrSJbIyYRGQWbkxHckeViR2P4rRSb1m4b1JquC/BNeEWPHzqtF7ou2bPNbLVjhwz/ANKnId6I1DHDaoRyOErB3dMX27vhRrWnevYY/V+h4ihC0ITRlQLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723301179; c=relaxed/simple;
	bh=lzHil6Qwan2T/SFedUXURTFzXLXrrYCBaQGtSTWh73U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TEFKJBsRyvxjZVoov0PfXHaIb/TlqSjH+tte6VsbRz+t/tIHDXV//MQIFF3x2Z2UDHhOy6EPJ5zxxwqFH2MXss4psHV92mI/W8jwvw7Cj85qtM7YZpcO5pATKs1Efddjr9jV13Oe9Z+WhoGPEihrxEMpASYNxCJEtn0dHx/5ZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k0LhWTl0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k0LhWTl0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C204135F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 14:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdfPzifiOpFJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Aug 2024 14:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1220B41351
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1220B41351
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=k0LhWTl0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1220B41351
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BD5D8418B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1723301169; bh=lzHil6Qwan2T/SFedUXURTFzXLXrrYCBaQGtSTWh73U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k0LhWTl07PptyoJ/9LeGGbytdQdy0jpFORA6gFCMihgitB1W2kibv6CUBXU4ctJUr
	 MmtYcUQPqhgWPk+QvHJVK2zmpHSyTNLP+Zq/b7OzYlyFdR/xtARlKushHkfEXVNBl9
	 M9Ga9BgCOTtP97q2ps2YYXqEvIdo0PgV8AdZmz20s8dYgPB46+H12cv0L7GSnhmnAW
	 RXrmm52ROOXB/3PKjq3FDC9D+0V7ZfyDbHX18PiqRDko74Zn7t/1IFqyGIgrHeyYIS
	 A/x28fBdF61dn+xU2aBHW3cBilw891pvSAJV6arLtqsGzmYOK1CDSdPx2pbgubpZ5q
	 O3N8Yh+7NhOMQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BD5D8418B1;
	Sat, 10 Aug 2024 14:46:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,
 Bjorn Helgaas
 <bhelgaas@google.com>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Sergio =?utf-8?Q?Gonz?=
 =?utf-8?Q?=C3=A1lez?= Collado
 <sergio.collado@gmail.com>
Subject: Re: [PATCH v3] docs/sp_SP: Add translation for scheduler/sched-bwc.rst
In-Reply-To: <20240810100955.14901-1-sergio.collado@gmail.com>
References: <20240810100955.14901-1-sergio.collado@gmail.com>
Date: Sat, 10 Aug 2024 08:46:08 -0600
Message-ID: <87le14bfm7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com> writes:

> Translate Documentation/scheduler/sched-bwc.rst into Spanish.
>
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> ---
> v1 -> v2 typos corrected
> ---
> v2 -> v3 typos corrected

Thanks for working to improve our docs but ... if you find yourself
sending three versions in less than 30 minutes, that is perhaps a sign
that it would be good to slow down just a bit and be a little more
careful.

Thanks,

jon

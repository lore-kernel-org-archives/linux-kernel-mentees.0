Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373013DDCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724707993; cv=none; b=h0P+l9z42bhZwZ6ighCrWvz8Qvx7KEp9s3nB63gwszJDssWqCIZViimG7KiywzD0KVAnI9Hsjj/0F9Oe7PPx4t0JyupUMa7JVFN+/keTV9eCh0HQBuCY1gxpza/2rqShimwOHzFvAvONHfwnrnb47MYAP9ZG0KUVRQf3ZEATqsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724707993; c=relaxed/simple;
	bh=rxaiCu02QBShSy2WmXGw6/bGsdHHxsBZRgpyAUKZLoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=joSeTSrZcjsYDl6GoAT70tqAJJc9r2/6ckiAYmrh5Ei9a+gc0feClOhTKqPlxiC+loVL+Jo6THq6z9cUvrq/O+YfkNyUdG0Cc681L4P0VYzOXvlR8RK8t2HKdhnkdh5oQtGTure8i34EO8tkTiKqCAm5t/m/seNsOCVC03oK6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MgdQZ1D7; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MgdQZ1D7"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA4F60643
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 21:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eitaQtJFAncJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 21:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4099A60727
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4099A60727
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=MgdQZ1D7
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4099A60727
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 21:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 111C141AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1724707984; bh=YtaBziYY/ptBg8RxKGKKAElm8QgPcdw/na53MiL5j+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MgdQZ1D70yS+Ndu+hRAQv4NAAucDqNEXhRrYm2azUy8O+TYN/eoGYI6kWI+is1naT
	 9qqleALnT9hYdrotd+WCl5TzN6DihTRjv+MubPNYsVhJWSEJ50mo8PoiyVoI18LyG8
	 LU2iq4XiffWyjIgko61lAONqVxkHjKZdzIjbVs/OymTMvqf247LrbwN4tArHapLprS
	 oldVaHPDz0BQl29OrpAdGZX64+RobrVGCzwXwFn2bLjyr+7zuEFS2u3Qe//TUEiO05
	 Et0fpxQC6RInmvNshYAiyzSI/+/5Tl36AUECJvJhonsRb/2QEfU4suF3e9krtyodNf
	 1U18alTRXYyGA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 111C141AB9;
	Mon, 26 Aug 2024 21:33:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,
 Carlos Bilbao
 <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Sergio =?utf-8?Q?Gonz?=
 =?utf-8?Q?=C3=A1lez?= Collado
 <sergio.collado@gmail.com>
Subject: Re: [PATCH v3] docs/sp_Sp: Add translation to spanish of the
 documentation related to EEVDF
In-Reply-To: <20240824095402.7706-1-sergio.collado@gmail.com>
References: <20240824095402.7706-1-sergio.collado@gmail.com>
Date: Mon, 26 Aug 2024 15:33:03 -0600
Message-ID: <87a5gz6kc0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com> writes:

> Translate Documentation/scheduler/sched-eevdf.rst to Spanish.
>
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> ---
>  v1 -> v2: corrected the commit message
> ---
>  v2 -> v3: corrected typos
> ---
>  .../translations/sp_SP/scheduler/index.rst    |  1 +
>  .../sp_SP/scheduler/sched-design-CFS.rst      |  8 +--
>  .../sp_SP/scheduler/sched-eevdf.rst           | 58 +++++++++++++++++++
>  3 files changed, 63 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/sp_SP/scheduler/sched-eevd=
f.rst

This file adds a new docs-build warning:

> Documentation/translations/sp_SP/scheduler/sched-eevdf.rst:4: WARNING: un=
defined label: 'sched_eevdf'

I went ahead and fixed it with this change:

-:Original: :ref:`Documentation/scheduler/sched-eevdf.rst <sched_eevdf>`
+:Original: Documentation/scheduler/sched-eevdf.rst

But I *really* wish I didn't have to find and fix such things...

jon

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A63156E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323214; cv=none; b=b/2yXoYsB/ukumPydl63sW0DW541Z9CcPRKPW2CNSswB1MEsLb0Y4mMMgcXu1PGgVtf6vDi7bIYWTUZ9bUrTTSWX+9cN/R3GY5tkpBmqMAYe+X68Y8/UK2AHE2An1rap1X7M0VWzpPj6A8kZLh22eGXpol5KpUlV/i3wnE+D06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323214; c=relaxed/simple;
	bh=ydEKflDOj5PrICcHyjRMmVQw/oFNuhMHmHCSdva7xRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I+stXfIfDlihVpTwlJTMLWD3HDMpVKgZy53E3U7YU3nKJQWtqQxKyvNj0Qw0/aoiYuQyWakKm6XUbM9Sf4aFI/9+tH+zipVYcTim7EpEp4USygVvItky8gVPttzXSf/NxH/PuAPRxvWl9xb0TTrlwhsjH/wBaabCyrgt4ZXh2/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=R3IlIP1V; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="R3IlIP1V"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9E24030D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 17:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSVZa2IEJM0D for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Oct 2024 17:46:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90187402F3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90187402F3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=R3IlIP1V
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 90187402F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  7 Oct 2024 17:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1237442B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728323205; bh=QSvvjs6UH5sL67koCBe6p+EInqHQJWIsplo9r8KQsw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R3IlIP1V08NXxd92HW0GBZ9/UFQjak0X8TYHrfJw/rZkDmPvDsK/JmL6MMjgXP/6l
	 oeAtd0qNHOTJfN7ghVzAXZuM+kiuJ9kWORuhdmJuS0OQh3Gm7IEfVQvaQzIzjTcWXm
	 /V5Ar4u1cnRff0MRh9r82/CKSVzgu/wnQgjoPLNxY3xEg5oV5yOYFpZiCkxn2tBese
	 LtDtaMJhpHRVN6KG3UhB9oEXPA5UnbYWiknllTsLvlb9rqlhXcVK4x009zbRfUk8XN
	 c28AqNMeY5C4UNTyqa+CAhNx5R0fr07gmpn0BDD2tydTnL+6chh91Sl2N4Wtnz4ViU
	 +d5g10y+nVlsg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1237442B38;
	Mon,  7 Oct 2024 17:46:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,
 Bjorn Helgaas
 <bhelgaas@google.com>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 Ricardo.marliere@suse.com, Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado
 <sergio.collado@gmail.com>
Subject: Re: [PATCH v4] docs/sp_SP: Add translation for scheduler/sched-bwc.rst
In-Reply-To: <20240912171144.15398-1-sergio.collado@gmail.com>
References: <20240912171144.15398-1-sergio.collado@gmail.com>
Date: Mon, 07 Oct 2024 11:46:44 -0600
Message-ID: <874j5niz5n.fsf@trenco.lwn.net>
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
> Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
> ---
> v1 -> v2: initial patch
> ---
> v2 -> v3: failed patch
> ---
> v3 -> v4: corrected reviews
> ---
>  .../translations/sp_SP/scheduler/index.rst    |   1 +
>  .../sp_SP/scheduler/sched-bwc.rst             | 287 ++++++++++++++++++
>  2 files changed, 288 insertions(+)
>  create mode 100644 Documentation/translations/sp_SP/scheduler/sched-bwc.=
rst

Applied, thanks.

jon

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C751DDC0F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065457; cv=none; b=SRhtAYvAopW6HUQ/w95/LpUqVGrjfKW0yqNAH07vG82oYzjKrLggNyyXUKpD3xjFxfVvzhMheRvliPLu4KPzi445rw7VXpR22hgsOYGC5sxyO75NpYyut0cs1jU2pwMToKkn1hIBA/tSbfJ80yN0wt+VWNEFyJAsSl7kEmEghv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065457; c=relaxed/simple;
	bh=JWZrSlYHDkFAJCg8PmG33o9HsHzGP5MCt7w7d3F9CZY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tviuNUN/2B4m751PV79xo4r6EbV/OEh5jGTyg3blB9VjciNm95YOi6hzL4SCyPRhvHkL55K353YW3mXiQwr1N9WvJro9NE8PlBIS70ASTc6IbeJt1mJfOqcz5WCqppzq61w4QjG7fQYqwS2tmI6WbMdOtGsihbO79FfeAUDBBFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=I/YlVLFI; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="I/YlVLFI"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D282606BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 09:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.203
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-CdnLPrzWrl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 09:17:35 +0000 (UTC)
X-Greylist: delayed 1318 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 16 Jun 2025 09:17:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B680A605AA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B680A605AA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=I/YlVLFI
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=<UNKNOWN> 
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B680A605AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JWZrSlYHDkFAJCg8PmG33o9HsHzGP5MCt7w7d3F9CZY=;
	t=1750065454; x=1751275054; b=I/YlVLFINMmoayE6yZ0rENRZ74ElFMWf6dytK1UYYH3hhRc
	s7iMwSTHeKOUT10LccDIWMzPGZTGk3Vs0dnc61DKtiQLNhWrz4H/zxdb+A8Oug9/Q6fx2GURZtDr7
	SdUkY4iOWaG1yKhW9qTL6jYe7w4d1LFtxP89B5COb2d7Py4xUPBr8zqN9mjOZJwMu80QeTTaQumkR
	+eAXblKK1KhnDSxDuq1EtR5RgJFMdBvE+zaRinXP/ubG+36drUDH4D+d239UvbEnQon5rl8t+WsSP
	ZQG80S9DsCthelD+Ls0A3a6Ns2Ztxn97/sjJydiRqSBaOKKZvtJkIvdI4lGgmc2w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uR5cp-0000000Byso-3xEU;
	Mon, 16 Jun 2025 10:55:32 +0200
Message-ID: <138684ee550d027a96d7b9d515b84921637eae57.camel@sipsolutions.net>
Subject: Re: [BUG] wifi: iwlwifi driver does not detect the card in Linux
 6.16
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryan Chung <seokwoo.chung130@gmail.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org
Date: Mon, 16 Jun 2025 10:55:31 +0200
In-Reply-To: <CAB1jyqw5RzeC4bT0oXEZ4fC2hcLj65sokW8gt=bp6=1d511D_g@mail.gmail.com>
References: 
	<CAB1jyqw5RzeC4bT0oXEZ4fC2hcLj65sokW8gt=bp6=1d511D_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-06-16 at 16:26 +0900, Ryan Chung wrote:
> I also checked the bottom configs and they seemed to be set correctly.
> CONFIG_IWLWIFI=3Dm
> CONFIG_IWLMVM=3Dm
>=20
> Below are some additional information:
> - Network controller [0280]: Intel Corporation Device [8086:a840] (rev 10=
)
> - I was able to find my card (A840/00E4) in drv.c

There's a bug with the recognition of these devices, please set
CONFIG_IWLMLD as a workaround for now.

We'll also have a patch to fix this, but looks like it's not on the way
yet.

johannes

Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95A1DFD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Jan 2025 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737238274; cv=none; b=ZZqj2X9HCGSRj8v6iw+67WWVIA1KqEDktlYrovugk05J24tVTFVA7L2wOG9yKxY+0LMazFx2s49p3kdQ31QYeH9IudFBqDqPZO+Ym0h6hSsldtfJyTHgyVOFgCntWpbKOapGHdFsSoHqFM9n19LMEUCZV9M1pRLSaIpbbhI02ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737238274; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=WiYd4rcmz3k0ZCcRQ2i/qlJeHbsIulgijF/oli/CylA1q5sCNRmdY5Zr6cB7Wi9m2ghTcLueYv2FtbrJKAEO2hSCfluRLFsod0/bdkBBS/b82Nb8Bs3XH5ycUfbJMQHncbKLfKE0G6LL2Aq3TtdwmWe7dkalixSJfunRA8wmbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=S3OUGEbm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=waWi3ivz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="S3OUGEbm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="waWi3ivz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5972A83BA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Jan 2025 22:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymUUP0ZClpst for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2025 22:11:11 +0000 (UTC)
X-Greylist: delayed 352 seconds by postgrey-1.37 at util1.osuosl.org; Sat, 18 Jan 2025 22:11:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D798983BB7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D798983BB7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm2 header.b=S3OUGEbm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=waWi3ivz
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=flowejam@fastmail.com; receiver=<UNKNOWN> 
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D798983BB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Jan 2025 22:11:10 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 491DF11400EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Jan 2025 17:05:17 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-01.internal (MEProxy); Sat, 18 Jan 2025 17:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1737237917; x=1737324317; bh=47DEQpj8HB
	Sa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=S3OUGEbmlFcjsCJ7l/pqKBGmTp
	9ujPWE+X3jtEzQnVxY3F6aZqDwIdZcVyGd+1MHWQuaIphHyzbqh9onF9clNt2ZZZ
	FR7e4yj+95SwF+FlFPUG1LNeAXVO27Xc4gjIhuatRFdvf/0ZPTRTV9xA6Tdo4rjH
	f9Re/gknOlyLB3E9+5bvJVtb64vZIUb5nr0YQANbhpTZWky2A3nFlcg0X5OK7UWj
	6o6pk0bM6pIrmzpZUheHxVcQjtMlFdS8Mc62rRFwHgJhzJGGmZEspv7YfG1skfwl
	e0ykWzjmMMZJwW44GPB3FduZMFgXmZacM6p8El1sosNOpn/xAyuIro9Y0Bqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1737237917; x=1737324317; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJW
	ZG3hSuFU=; b=waWi3ivzkW2lPeba6SwEiIF8FQvJdxYZfcv8LLS76Jd47RFU+62
	Hny2jD5JpTsy94uKOQ9H+TH3OgIt9YnqPNaLnQKZuFX9DtNPOuO/KI8RmMqrut4Q
	TrsGNqNNsgqNg+K2x6Mt58ZDZq7yQEH6G+hGlZIRsJLHLcrrG/uGIkW++CbvAqut
	vBN4yX/HNj/wk0cqqE1afMeJqO49B6pIHeNda01i5Lgd0JVHJuE3HjLXL8g8wnap
	t6IW0Mt4E15HIyoB+vRNagsgsXL5aP6+3RejnsKJL3HooYIDSL334gm3vlhLQmqS
	3+4O4/gYxKT5SyD/RN/PgWs3A73F0U23j+A==
X-ME-Sender: <xms:nCWMZwEYJGGMEn2q8LXfjahxlxBAafHCBJOW8OSixNPr6_AGiG1pGQ>
    <xme:nCWMZ5U60RBiwpA1DB9ccwCBHYn5xLVCwD4qKqAjUM67ZItZjkSASBV7DaxUN1i-0
    AP7441nskEn4H-Qvdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecugfhmphhthicusghoug
    ihucdlhedtmdenucfjughrpefoggffhffvkffutgfgsehtjeertdertddtnecuhfhrohhm
    peflrghmvghsuceofhhlohifvghjrghmsehfrghsthhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepheffteeuleefheehhfeuheelvdelfefhvdevheevjeelueevffdttefh
    gffggfejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhlohifvghjrghmsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvg
    hnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:nSWMZ6IndFJxTPbkcdyizce_wkgMWUGeirj90msvWS0Y7Embepf69Q>
    <xmx:nSWMZyHYS8Gipen_eobknkaWbuwDlos6O8-qDTdU_KTBWmYZAa4jZw>
    <xmx:nSWMZ2VwKIpH4Nr_vEG0tUC5CRZwTJjE1fok5KqXsoLpWIWTw2OCqw>
    <xmx:nSWMZ1M1NdyGH029zadp9T7KkQVlKpJ8PF6DX2_JWeLIZvOkhRenqQ>
    <xmx:nSWMZ_fWTUaa4KLu_p8Tg8zqoPWf9QBgCdCgGxyVuVvYwP85mDQPjFt3>
Feedback-ID: i539946f5:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DD33F18A006B; Sat, 18 Jan 2025 17:05:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 14:04:52 -0800
From: James <flowejam@fastmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Message-Id: <3634249f-7911-46f1-9c7a-4c6d59ef8121@app.fastmail.com>
Subject: Subscribe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


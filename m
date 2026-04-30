Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC62C2346
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 30 Apr 2026 05:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777525336; cv=none; b=VqhVYTCiCy2UHS53DM7Tt9kqXV8ZAP3pCfNnnivQ7M0VCnHeAdTuMT19qVujUb1cU2HKKQZI/83KTmfgHSsLWtHfvvjcK8EZ9Ggd2K+godDSZfNejABBj+8Br8LWEmcdfHcy09LmiKYBVoi1d8YBuhoUMwyPNuve0JaqzEiKObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777525336; c=relaxed/simple;
	bh=TR4+KWCOdo2siZsIgVHMmzJqyS1W6LHST1zWivtIu6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAH2U2m9PpnbenHuB/pgx2qZBJpsHWfPAs/Uujx+Is1ShbHU6JJjEmwGbMrksGJ4cumgKXQDhEqcBpkF3TE58lDoLTVaycdq7pqUDTnDjwqB0krkcHxmaZhoHF+MhasooogKGpk2q6MQyU0d1EyRNIEGschySrD9if/xcxBvsEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=e4e75wZd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oyEXV7v4; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="e4e75wZd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oyEXV7v4"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5BC8A1D00052;
	Thu, 30 Apr 2026 01:02:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 01:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1777525333; x=1777611733; bh=ipm6n9HA+PFykpbkIG4t3
	dXePSJNkvoPGsvwrwTmGXU=; b=e4e75wZd+50jtWZWe0Hizxyf4c3KZC3ZoH6IX
	JvKd/q6hawXxBFu9kzNVjWrHjB9C/nG0bZfsNbGSV6hJAdOxRU6y3Rxx3mbR/pJS
	hf5A4EabARB7qLE3ATfRvn8gONeVcbb1EnwwCXKp2Qpu/1gue58cgRLyEKTascPm
	Zwt6UgWVadyUUHsJLww/xIJgBiFOE94QvmtAbRT6YrovpqU7zlQIKwc89blaoEJq
	esU2TE9OzaGjQc9N0TpG8y0467hvg7LWToWhZkBucGOfhLPc3u3HxXGh2TAbZvF2
	zJVQ0CsEEHAi/G1NhbqUpTdDyaDrPntnLtW9mKoibsSDgKhIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777525333; x=1777611733; bh=ipm6n9HA+PFykpbkIG4t3dXePSJNkvoPGsv
	wrwTmGXU=; b=oyEXV7v4RrNLwgLR37H4agsoSqQgeQrjmrhTpjQseLq9fpW98Bi
	4WDFpUnjbQOd4XMR+dWqMwzuoRyWmhPC1NR0O1gjn6Sx4W/dOZPMxyvBYCT6f/T/
	5OX6ZyxInYaHaaXawPwjEhz5FcOiQy4lFLiAeohe03ECxgt8vqLNHIPWYj3LFqaf
	qZ1ckhjLc2RB/tRebczvJZ2aN2AOK83Bxi3y70D538MRyH8ZBRnnp6oqihXulOu6
	DA4NrNVgXDbMY6iSkABmSDGUNyXsNiOs3qWUa7OQfGk58kR0n75tnK5Bb6ApctHM
	2PM4nJXdAXh4gxbWYKo8DzIJEggECkQt7kg==
X-ME-Sender: <xms:VOLyaR_1cgBb-Kjwlky8nEm3DB5BERLw6oJn0uyLsTPHgCg3nRjpeg>
    <xme:VOLyadIvkgVZNBW27ZLHjGGX91XOUcSJeQltR1QT-Mvls2bC7VYdNLDag4vp6LMM8
    u-ReVbe2MX-qRtdkNCJK1y_PpX8zYkoN3C9Z_wkYTXNAJt54bXPE8Y>
X-ME-Received: <xmr:VOLyacYQSxxZOIsVb5rH8Vu82-Cv-L-35EKST9JMKeWYfDhiKFu1HNKvRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekieegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomheplfgvohhnghhinhcujggvohcuoehjvghonhhgihhnrdihvghosehluhgr
    sggvrhhrhidrtghomheqnecuggftrfgrthhtvghrnhepieevfeejhfeileefgefhheettd
    ehheehueeuhedttdegtedvieehteeigfefueeinecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepjhgvohhnghhinhdrhigvoheslhhurggsvghrrh
    ihrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtohepjhgvohhnghhinhdrhigvoheslhhurggsvghrrhihrdgtohhm
X-ME-Proxy: <xmx:VeLyafKLWpCxqMXLMBOTJYDect00QwAwhXYyB8DJHVQFzH8Sbk7X1A>
    <xmx:VeLyaaB9whmkcZdlgfL3yLbTZO24dF-3-NG_Ek6pejawF9warbu8QA>
    <xmx:VeLyaUq-vk623Tvg5x-Gm1A8xm-uM_Wc4eG2guTJa8mpZFywVop69w>
    <xmx:VeLyaViLOOzfIH90bL89CxxNlD_N4UtnUUqUCtu5zVa3LGRUwM5A1Q>
    <xmx:VeLyaf2ZbMNmff24iUgzIHDfZpRcGu52Ls4ct6wB4n93Zh0o5skv7gAF>
Feedback-ID: i372e487a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Apr 2026 01:02:11 -0400 (EDT)
From: Jeongin Yeo <jeongin.yeo@luaberry.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Jeongin Yeo <jeongin.yeo@luaberry.com>
Subject: [PATCH] Makefile: Add EXTRAVERSION for LKMP Summer 2026
Date: Thu, 30 Apr 2026 05:01:43 +0000
Message-ID: <20260430050204.5083-1-jeongin.yeo@luaberry.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add EXTRAVERSION for the LKMP Basic kernel skills task.

Signed-off-by: Jeongin Yeo <jeongin.yeo@luaberry.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e27c91ea56fcf..3c1f8c4a3bdb1 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc1-jeongin-yeo-LKMP
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.43.0


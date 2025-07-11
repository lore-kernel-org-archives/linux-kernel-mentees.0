Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9EA95C
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 11 Jul 2025 03:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752202926; cv=none; b=Hn10ncn6ffIjGXG/w4m4/E9+oZmxPo7imkh+BzyJDMMJndXu8W0YgQdyPtad1oK5BXB6D7wdVTKo6SX2YzaQFZaY/Iaw34tNOdWhP5ldjxwfN/tjKg1wahIqWJzfdzlxlLNGuMcuWBA6HHKvbRds7I1EOynBaklLCaxeZNeoVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752202926; c=relaxed/simple;
	bh=LGWAtyXrM2PxxMeZprVLJBwaxJToCaYtQ/uTGw3d918=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEGmLwYIfgPZfqCYpTLVV2buc62ifY/OCRCyA41qLeziM+L2BiNrtzUBjcJXSqtFbRBde3mngxA0BDP0Wm/veeaUkvDU5QIYE5Mb3UNS4cNDhQOrxIzppYdM0Vsj5KnMddi5YTlESmalkG786GEys2/38O0ywJMEIIS7WvJbnKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=SKIsQ21G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="SKIsQ21G"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so21285835ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752202924; x=1752807724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
        b=SKIsQ21GX8itjJOUNJtAe5Zwz1rmrny9kwVJbpK9skaj13PjG2dNj2mbv+h4Or3Fg+
         ws4U/eyJ7r3DOkOmeQ2aFOHAU8Zp1jfbLjESHccGwFaPjeWQ98ywVA6TMAMMG9uTGr2p
         gFUwsme7sj1EOWLekvHhzH2gMZ5CIMwRVUVtoc1G8fOFbJRtt8XbRu7QwnpEpDu2lw4c
         dmKD7DDj4pqH2SAWWZNvpXZi14AcDKLtHX/aFpdy9WU8blRvKKGxWbZZHqbSyve23zQE
         AX/1acJoqGAlm0G+lb7WYGyuIl2smhhO44/leeLY9kyWoazWjdqv5NvzIaUorGBG0V0K
         G+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202924; x=1752807724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
        b=wBuXVaGlEaDbHUvi+UktValJqCYdy96U6MwNfjz+4XcSGLbemf/vaSkDbEwYA3KOOd
         V75RiIJGpsuVlssIdzTS0O76voLNf4viLdyKkbxVoZdoaftWdSekLCvtfgyKwHc1kt/f
         MrMN68YzIMdq+54WRhJehxCkyo795vsBNnw6FYi2TYxZLv88jzpMB/omSr+4DBp2B8NE
         8JGrNmNDPwYH0kVvl/Vz+Y9kYB0UABKP9RiBYSx3m2wj/q4GCBUWguDHu4ecOWtVBxFU
         Qt/Z2dOCfhKuMgJCpQ4ZPC0DO/tZYz1aJGchMkf+j337S770ZsPuePC9OT6dUnAC4zXb
         TL3w==
X-Forwarded-Encrypted: i=1; AJvYcCWN+77siyK6aTfDbiR4QZP89LHeoENorNLdkXiw4TWl7L9goq8yHFo3fQJkYjEbti1BMX6W3AORACmFc93xNGTpwuLBvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcUeK6lqqZXoJSGptgGhp4n4wwEkNKmr2I5po8ZL+FWnenCgw7
	eluKqLrAJ84CO7Wh2nLKkPaZpLoDqIA7SIDbnjljCcLKtYl/Sa+9bPfMA97q7Znm8ug=
X-Gm-Gg: ASbGncs3BVG68B+PHEpTE4nxIhPFpowj48wKhdseWqRpauYi8Y7oY7Xo8R8UqRk+TIk
	HuMH/Ng0a3GXs7qEO/+F/biaNOC6y5WuNBiFd7JNt00QMvQT2O3tWUQVo4m9O2ueEVzL/pxJpkw
	KcNiOXzWcalZ6ddUv56RVDKilMLCQsi30Mo7G2GezafSfHXtaP2Ngb7yisjxogOKTf4NoWP2ruY
	JsS2pQ2MNBispc6CB52rjPjHivnmi3sQsfngOW92K40gHlonFg+1FrfuDho2cufNo0KHRgcbAfr
	jePSS3ysVB5FDllGILknsDDubbbCc8+neK3nTeOV53cjqEb+vizaNNxslmAJzSTUtS2uysYrQsK
	ZPgIK/ZlVznfZJuLDTenvQbu7UY1dpUViBb3umQefW4pdVj0WmL4CoQ==
X-Google-Smtp-Source: AGHT+IG3BdlUocDPxEIVRsXKPoLXrNsAE7NpPAv9kznyZrwFjv8MOOYM3yOY/fwUdxGzEatLzBzkSw==
X-Received: by 2002:a17:903:f87:b0:223:619e:71da with SMTP id d9443c01a7336-23dee28523bmr21809105ad.49.1752202924535;
        Thu, 10 Jul 2025 20:02:04 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42ad25dsm34219115ad.64.2025.07.10.20.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:02:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH RESEND] drm: docs: Fix typo in introduction.rst
Date: Thu, 10 Jul 2025 21:01:57 -0600
Message-ID: <20250711030157.124778-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in Documentation/gpu/introduction.rst

Link: https://lore.kernel.org/all/20250620180258.132160-1-me@brighamcampbell.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

This patch has received no response as of June 20th. If it's
unacceptable for whatever reason, please let me know and I'll drop it.
This is the only typo I happened across while reading the document. I
scanned it for more typos when I prepared this patch, but found none.

 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0


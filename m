Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A81274FFE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309693; cv=none; b=YC47yrGuOZ6Wao0jU65h3nJ0M9MHRTCzMKdPlS/7lhuY1JNBRKZVZ5CZu2McgRO00FcJP4/NZPc9ExzsKm+vm9uTjTP99f0zokabcDBqUiMuaHtqjGMoo1FbS9+zkAPPMdJ58Zi27i0e/AGAdfCB6muoeRbStfzuPLGW3WrT4aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309693; c=relaxed/simple;
	bh=cHh/cHIF2ix4T1MbAz3cbtmZwsbFRKUVOa1sotAMdYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQHu1eRsJ1bFbMJXfZ7LTqMqTI+ODoJGwgrm5Sa8XUipnNj4uV+aso90O2Pv7lROxKypkcjhem9tLNFJ2kt7G1jt32/DpMAPetvPknz4P/OH+CJX3IQWC1R9pkadIC38Esy93v14HlCF9WbJZvgsI68xh0vm5FCscDnmwKh20Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkC+6WAa; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkC+6WAa"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412F040881
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KcnPUGcpdfa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 09:08:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A47D54021C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A47D54021C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GkC+6WAa
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A47D54021C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 09:08:10 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso5528796a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309690; x=1759914490; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=GkC+6WAaUG6p+s67oDVpQhqM3RWzqb7T07UHkJeJMKNxEwq2HeLoCDIFoRLDa9WvCP
         OnC2U96FKbnrUBOP4ScHNJAwFzj0YexlMFTRK+hVfMj9/zjPxrGBlIQ3JcZTxV36eA5F
         OS1X1gCD3Tyaw9QXWaFhgxl3fYg9jla+Jcdnz9fEJ4CJ2XpIuPa4ubr3AwQSZLPp0v2h
         LNiZ+N011h2VXVy/Ho/EnIBzaXAZGhhLR5Th7ZL1vYIwh/JIFboe4tXWpJU6+li1+QCz
         o88LKgmq9VE6AqCW0RGUIqNp3dtApfZaTq50RaQ4QHFIHiKSM6dxSLMCp5xw1dZKt7qc
         RVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309690; x=1759914490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=Zwy1lhCUyhAq25Tn1JyRs5WrcdfXwFIRjG2RY5n+uzoSATbxcZm8NkPEXMkumIcZpp
         zMr/9MDne1F89IhEyqUNoneAEvC0nI3TIgJ/7ZxMOxaghoRbJra3JnK2DLD7L0rinfUQ
         P9w3GWVtXChGp5oHVUnkpcMNr6jfgI9bwvHRCm38XLyKG2DvRAh4tmAchDcNUDyz02/N
         AwivZCOvLsYYiJK1ltdcSsC7hnHek9L2ynVLXCdrWQhWBoP+RpVe4axBtdGwJtaWvjwt
         /WKTLd/rRKeaFPSPxDAoYq+CSYYsXrBtQc10ihQwViCH5EqWLjXl62iqJ82+/lufscIP
         1XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXagiNbsrLIzfEGYjsigyn3mGl03TwfDaI9YGmtNIPCRXONmbWR1IL9A2iJpAcBkvaRaCcR/ZiIrv93q5YvrZR/sSfSlA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw/3mPRaTdCXpK8McJxN0I3YnSgd4Sb/ySt/V4xSEBxSQYTbfdM
	rZr5Rd/70gS+J6sixKw7SHxODx/cygdd0B5qr6ZqLfwAADXLOJezJvQB
X-Gm-Gg: ASbGncsPfgHOLs9oThf0oyZ/fe+RFvbtWfC5SpO/CnbFt9qDWo1/fFQUU/EqsXkkH28
	jenO9LbSfL3GTfUh2P4AE9BlPIpWF8WDkgvlqzuDZrwwGM6Azfp6hwxJrHdTEx3Y4xnr9ImGDZ2
	iEnDVIcdq9SD68o/Bj2qiPrIy3TtJtl9olmxmZLohoKHlJCqglikgnWfM90DLJZFNFo7Wr5QUTs
	dFEBM6LyMNakogndn4LM2p1eUQzbQ8WKmFTeeFpMmbXVz9KxkHXAZZOyAT49B82++fHQvzYLe9J
	iOwURGYOredIYZDwdRslb4ojbm1fLtRgD6IU5Z/4O/eUWz2eS2L426f4W4Tp6A4Z+DHLhSq84tz
	Nx0U0EStJ9TbQI3sKfaH3OX4MedwRmdW/j//yojgjr3iRyIHJth2tWLdYI83CH7mnWQEennUihw
	==
X-Google-Smtp-Source: AGHT+IHCAXG1BqEfze3gHRwn6lpXtkf7tuj30SDlHiLv3IUP0y93ub/ofCCeyp+nvvaX5lId2eVgIA==
X-Received: by 2002:a17:90b:4f85:b0:336:b60f:3935 with SMTP id 98e67ed59e1d1-339a6f08820mr2965105a91.23.1759309689779;
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55741e6sm15477230a12.29.2025.10.01.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] ALSA: emu10k1: Fix typo in docs
Date: Wed,  1 Oct 2025 14:37:57 +0530
Message-Id: <20251001090757.45991-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

interally => internally

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No change in functionality intended.
 Documentation/sound/cards/emu-mixer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/cards/emu-mixer.rst b/Documentation/sound/cards/emu-mixer.rst
index d87a6338d3d8..edcedada4c96 100644
--- a/Documentation/sound/cards/emu-mixer.rst
+++ b/Documentation/sound/cards/emu-mixer.rst
@@ -66,7 +66,7 @@ FX-bus
 
 name='Clock Source',index=0
 ---------------------------
-This control allows switching the word clock between interally generated
+This control allows switching the word clock between internally generated
 44.1 or 48 kHz, or a number of external sources.
 
 Note: the sources for the 1616 CardBus card are unclear. Please report your
-- 
2.34.1


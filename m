Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC142AA5
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739638523; cv=none; b=tCwMe55CeMVMb/Ga4RJabGL0zCm/zW3DwcQwFagBHQsA1tin3kZIHuMApNU2jrMoo9LSoweI4tDV58tSB3ikmOjrES2u+O3OrVDj8WiW/1s3kEg5IhddjhU7+le841Qsxs/mzlwyq7IU0+rxdAHITrw2hR8upuDaW99lVcyltAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739638523; c=relaxed/simple;
	bh=uy5cH16JsX4JeqEfRAx/FFIcMBDLoTmq8s1tlKdmEhc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N3fsLbd/tglMF2sVWnGUsVFpgBzzrja3AOtGCB/ueODL61zUlumnCAvc9WAh2HHCElyyRql5XQQJVjBUoEny5yxZE6VxZRaTRVEHT9AIGEYBU6NVLulgotk0DXMDZO78AcqBHlIgXFnbm1Fax3KzaG0kNyGVUScqr4Q71Tyzjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd5nUqHd; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd5nUqHd"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3df03d786so1260990b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 15 Feb 2025 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739638521; x=1740243321; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fFgotg9MMog9YPyVCTVdN/A41r7u9eJzo/q5sMJJgW8=;
        b=Dd5nUqHdx+BsldExhZQMmIz4iwkhUx9eXf06b8BxRbZ3Sg1HlHRZ6pdh5hfLdOlOD1
         3HH/Zfb/lH5jyi3AjzNJien9ZIWrbWsXc5rpJjTAbSa9oV4XAz+YbvKt49V9MwRdZzEJ
         rOvDUetsRfF+Y2lCfu1BdVqe6uvEkRTdHSoWzabZTOVhTRrCv7dvDQTdWr507EHhTq2n
         +uAHlu7N7vETXhxi3x2XWsCCSnlTrA5GGE5Yr3WPUvUwXqmwpGYr/yJnv62zOTnJuYG9
         HsQImZzdX1syBq1FXIa52G7U0c/Lr4g+ZGqVLKkxbhfidb5Wgrg9XpQ4lkkPfcMSmLoT
         GXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739638521; x=1740243321;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFgotg9MMog9YPyVCTVdN/A41r7u9eJzo/q5sMJJgW8=;
        b=qlgorBWvGH0PM8VYJ1st2R1EUtFale4J9V6t3sqI2DHb6Th73XA46U2cLAINy5k9aT
         E4tUIiGJdRHk+wPqnzbMh55m7Fl1Ni9Oqm9A0VT3GTIYBUBeVYcPDc3LMgDCPTj/hnA6
         hY1hfLFSA540GEWZzealX9LGnM4oBAH2PN7/wqFMxy+G2ZPGms0Aai3m3RZl3Fr3qNxF
         OZCBTtEeWtdLpoEKUOwBXJvA+FVWn8xeld0v1mIwWXaMa3XhVpJ+SHMbz+wWH9FVJF1G
         JQal0L8AcE8VNF2460R9d/FoqM9KvwduBxglphl4Nvdn5Y0lxtU+uelNfZIQLGZ0kjJm
         4BFA==
X-Gm-Message-State: AOJu0YyeTpCEq8yQcyFlbvwzVUfIi/vAai59TFmtL9R5ECUUnWVh05Tc
	5/My0Dzvehby28nhZe3Vm3lAUuUqmaKd3ehpvT1pMAoqQpoIVMtGzdxHzUpuDReLRK9kZyQyuKM
	xJaXtsxorrj2j9YwZIbs+U7Q8qnk=
X-Gm-Gg: ASbGncs6tbrpBN5iE2VjbFTGqBqo6uW+dCTtJruj9R3eiA1to4+obdbR7bLvnl3LzXa
	vTd3uw0RKV32EXuubY7F1V2g9nvxyG6LFz8M7j4Pwaivj+M6QL3yTT/JSB9jue8+SNNCPK0k=
X-Google-Smtp-Source: AGHT+IGCeHqx4n/KP1WhydFUl06V5Mg/NgGju0fYq3OQFHyEYALKBBy4copQaMnqdqXEmQIOL1jxBiT1Y15BV84/x5Q=
X-Received: by 2002:a05:6808:4496:b0:3f3:b657:cad0 with SMTP id
 5614622812f47-3f3eb0a42d4mr2338650b6e.4.1739638521092; Sat, 15 Feb 2025
 08:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sat, 15 Feb 2025 22:25:08 +0530
X-Gm-Features: AWEUYZlnpn4Mw298NiG2Y9osPZ8n71VgEmJmjCOVRfOFQySR_9VyTWgb3KziY7g
Message-ID: <CAO9wTFjW3i7C8wQEJ3kjdNMwQurs_bmAw8JN3rbsLVDuPFQ0mQ@mail.gmail.com>
Subject: [PATCH] Documentation/mm: Fix spelling mistake
To: akpm@linux-foundation.org, skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

The word watermark was misspelled as "watemark" in the balance.rst
file. This commit corrects the spelling error.
Signed-off-by: Suchit <suchitkarunakaran@gmail.com>
---
 Documentation/mm/balance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/balance.rst b/Documentation/mm/balance.rst
index abaa78561..c4962c89a 100644
--- a/Documentation/mm/balance.rst
+++ b/Documentation/mm/balance.rst
@@ -81,7 +81,7 @@ Page stealing from process memory and shm is done if
stealing the page would
 alleviate memory pressure on any zone in the page's node that has fallen below
 its watermark.

-watemark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd: These
+watermark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd: These
 are per-zone fields, used to determine when a zone needs to be balanced. When
 the number of pages falls below watermark[WMARK_MIN], the hysteric field
 low_on_memory gets set. This stays set till the number of free pages becomes
-- 
2.48.1

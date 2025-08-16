Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE621D3E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 08:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755332702; cv=none; b=k7MPkGDn6R0nm0bWmfTbpOGAvCqcwnvNAXYq7Y5IVGgOZVnCLTY6wCW1S2fRXtW8f4MH2RQ4wTCOAkfgPgZrQmq8RWTnqZ7Vk0gO4wqA81A3hiXE0c1RMGZDu90cEDrpeuoAa/CDJqh5aNMzwanKY17F0k3TtJlaog3aFgztQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755332702; c=relaxed/simple;
	bh=HcspPniQ+/a9UgjFb44d/Qy83pFsOwoD+mG4yuju6Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ojPE7Nohqm0XzcYGTWDkyHCXrPEkmdOP6XZfpiP7ALE0kRl6hqMd9pPpH14zAMbI327WWQOlEuDJTFqwQnVUKLElBwz8BWKnu6KepgPeEbJ9RAoJQfrDTs33437q1R1SjxsTNIt/CXB79eClL5e1yeDo5h9PlcFwbcjbJvVNDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpFx1G8q; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpFx1G8q"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130C4813EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 08:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJE0bT5a0KSa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Aug 2025 08:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5922D8132E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5922D8132E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NpFx1G8q
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5922D8132E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 08:25:00 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24458242b33so24692965ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755332699; x=1755937499; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+vKmcBx4tFOUtnevR3o1xCot+6PtJYfeGLB/iWk5Rc=;
        b=NpFx1G8qvHu4igbx66UKmW9W0ddLKXJ/4T4B9YgC+TgcvjNHZujIgJUrSGwJ7t5A7Z
         jdpvRhwlhDffG33VZ4pcU92RZ/PRC+nz2zcuUefmJsDA7Jwll+3ceu1F3jrP1G3g0qIy
         gHkMnfyVFTSfRQa7nw1P7uIxAk25U7mblFxF2NDbPY6N34m1GBPTHTKbyeYBIwqOzaTR
         Mi+O//Zy2jXPgrkLKfQ9HbcQs1hpzDfglOudANB+HPNJCwM31peEk2cXsGwPq6ikOMQc
         WTroi9MjDWN0DRVm2Z7nXPv51OoW/yKYdPpdwgWZZsmgm0mhkbkEH1YTr1lvTOAagiaj
         r+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755332699; x=1755937499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+vKmcBx4tFOUtnevR3o1xCot+6PtJYfeGLB/iWk5Rc=;
        b=RMfsVcYacMsVNfSCcA7v42S6owMbO81CKb9XSiNShEXz8uaKEQzf4l9xWWJyRlbcRF
         qGSlJTYyWwxwZdIM5BDrhWwteFm+QVmTnzYtEPvstQG1vGX0vUM5qW5v9WVp5gS10OWY
         08QS+l0/GEYf9kv3sAXB6K1qEXuGjErmR2oTLY54DBfT+1jrQyKWtPgpRvMiZIgeOfgQ
         MtG/D3hOLClF0v7Ju0/s8Pv0akftteaz+fIVnOM95xOHPmgjPSchFC1j8YsWrNkOc9u2
         wt5SXm9mC60WaD82ln0FP0darRFNTFK/fJMZm1FOvsWDwDr0ZoX7BbUIubKpxt1YCvdY
         kbiw==
X-Forwarded-Encrypted: i=1; AJvYcCXK4X5FlwpA8lKX2ZUtnXKgX1fw30oMLm9GfpGm/vdQ1FNvXyW3PapU0vKM+MPztBofbLW3Ep4rUYEHfxbCO75cV5HdNQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzB+nTY/f9fXInEudURaHgKOe/YOXhQJmK7kqiWCDTZSPctfbT8
	3eIlI7f2P0Zl7QNPuJjzwght3lB9W6F09m/1cLbQtfQof3KQes5cTTvf
X-Gm-Gg: ASbGncuiS1gujO11fov0+jUG3l3N2yVw5xJZr2dGDnJBhwqKFAO3xghpXFTtzWxf5oA
	OcdSI4rfnTWVpIp+fw7uXDC4sBQcQfn6mpVxM0fzCOzkbnaNXSEDsc5WU/NsSgY04pUfisUsKeC
	yUOm0nM7kc0h9hXSPzfMweCBcztKCJTnzvkbBnzAVBXmp9RGRyVs9zG97Hd/kTGsx1yhQfrTW3v
	tEFtS/xtA2dZKvjIGpRmL6Q1aTAyKSVQT19EDItVSsJpndquDmpKtVxSRcufarAI6jtjYQm+KNA
	YmNByZPe8D3Bg26m0BwXpaOBafDG83jA6QeVo4aDMXENrTft3bnLMgh6BMycalB5+AtZTDAuG8e
	OiZmY+g7qXAsFr4W9YrEc854wmMbYmz/AKkQQmiOpWKkoPvcjyIU=
X-Google-Smtp-Source: AGHT+IHSsawcaEevMuafLD78BTfCUbWtLwXteWH92g1FBSOzZMWiz7OQWkZkplda+BqNoCgweUMSvw==
X-Received: by 2002:a17:902:cf03:b0:23f:fde7:efef with SMTP id d9443c01a7336-2446d8c5ae8mr75631885ad.30.1755332699445;
        Sat, 16 Aug 2025 01:24:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:7bc9:450f:9942:9f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330f8309asm6228514a91.4.2025.08.16.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:24:58 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: corbet@lwn.net
Cc: rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH v3] kernel-parameters: fix kernel-doc warning
Date: Sat, 16 Aug 2025 01:24:52 -0700
Message-Id: <20250816082452.219009-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Fix kernel-doc warning in kernel-parameters.txt

WARNING: Possible repeated word: 'is'

```
[command]
./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.txt

[output]
WARNING: Possible repeated word: 'is'
+            The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."

total: 0 errors, 1 warnings, 0 checks, 8339 lines checked
```

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf..302145870 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7506,7 +7506,7 @@
 			Set a trigger on top of a specific event, with an optional
 			filter.
 
-			The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."
+			The format is "trace_trigger=<event>.<trigger>[ if <filter>],..."
 			Where more than one trigger may be specified that are comma deliminated.
 
 			For example:
-- 
2.25.1


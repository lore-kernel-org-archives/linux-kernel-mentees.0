Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9AA1DE4C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 19:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755370903; cv=none; b=lhQshXEADtC1sKgNgwHYtCsXCspjMLHsbka22xYC5PchTeJz0fgX6J2ohPdaImLPXtPR3R751uf1lg9I00COsv2qgdkoCCncVvDSErIBjxP8NtOaMQU/DPqDx3Trs0lYKUpMn9bXJtkp5WtlmMr5THB5QNsS1KW7esdFWhXsZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755370903; c=relaxed/simple;
	bh=NMHQWek6hJCAFu2VRXW9YhQZ3hluLQdp9qccjoE3vCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4ouNyOqXwU6/fU1GXH8t7mb2q9jjl7hXfrDkWu/hBJL/AY6VoZm/Y/hZZZ5luLUvUMLiRcbshhH3Tj8vAExuLZfChvIOCb62IHtUDilY0MljIQ4iBvWRuB8T7ovD5l/0nDJ3WP3iBQJUWTuB19BVsCJv3TG0YkEIyY/k6VvaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUpDu0HO; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUpDu0HO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 422B840AAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 19:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wifUQh-oKmJm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Aug 2025 19:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2482D40D64
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2482D40D64
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aUpDu0HO
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2482D40D64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 19:01:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so11309245e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755370899; x=1755975699; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge402z6OscbL8CU2G3ApWQ3/4su8++yMy2rU7voov5g=;
        b=aUpDu0HOjKNCUZdxnfvfIYjPruwAG9YQ/cpjclMNqnTzaDZ7OJmfQi1v53V1uScFih
         aDQ5mZWHHe6tMrY9zsOuAtFUIZgGbGPVNy/3D9TiWLmyYqY5F8Sph33z7Tgo+6lBgZ5J
         lDJ1dwuHFuIqmiswVqWmE4VTdtm7Z9kU1MLsD8wEDGggIaW8jNVoAlHl+YcYDXQNRxfK
         sr7qAXinzJyr+9pV80rQqfmej17J2jD10PNGA5pjQ+AXVUl3/KD1lR29dM0H7bMWUiDX
         iNeLRSKuo/n0k5sTznpT+hHgZfSvMeFrSBcDT/fb2moOwFB3wZdRoS8g7qYTZTxSnxs0
         iheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755370899; x=1755975699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge402z6OscbL8CU2G3ApWQ3/4su8++yMy2rU7voov5g=;
        b=juzxBKgAMKyCB+i/5kAJ7A6fqxvfIAjgr9l6f8MyXMy4ead/FqyybGlRh4aJ3FWDHQ
         fkwtPAVT5IzvHnwMuEOcgAkvMDp2OlbPN1fBUbNaqKsH+5oubGHR5qngF7TL0EE5reiz
         eZ1QTk6bjF+TTV80PDis9A/KhtzhBBxu8/q5VZi9cOqREyV8ImotArx13X1C0doqnsoc
         izxY5ixF0rR4UWHywkQAz0mkQzXRE0igT1e//Jh1Sx5p/QZEt3wXX5Y1MMr8mF7VJGoJ
         9OMEs18WKKGMwGDcQSOdSAUPLwFWNOBNEy78EkJ5VEEpxjOrHZ8YzIKmXjY6pokffm8p
         MoTg==
X-Forwarded-Encrypted: i=1; AJvYcCXzkRysMQtSmJRzJ/zbdZoLZd9D9vAqmMVTH/A2PnBKXuvb1wJV0kDJ1Ymu/hj7C1ri9LRKPp3pWxN2isyUQ9/DDoN4/Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxF7rfmbwrCtliktJFp6N3IHYuLMm9kGMq2dS2t39Qwn1om8RYy
	O9ZOqkHVzf+Y9jmsyGFxkRlpto3DVI71bQd+mNF1bEIWGmYJxnjDqSnQ
X-Gm-Gg: ASbGncs2fwSNcL5zvUAN9pFMNousK6LhqcRQTG6Tec5i3rUUxYIn5kmdOGNyikVEw2N
	RrNzMEPR9xoybnZRIUVliMMdWLOJwg2iZatBBX4Of66INRMxedq3rkQpYojN2XeNa4HG4DpkP5v
	1wJINz7nbBkR9CAW2byXQzPt1CYqaqPhSG1xehy45Xe4l8cthsV5ctgfNgvlVZwrJc0ysfVc8W4
	N6+MmsN3RcgCliRK2vOCott+356EbSOYXuFlRJHTCOVfSZdrOVXpkFSrUygsIJ2OR3ugtPP8qM/
	xruWT3S9wQP48z46+cMKHzAQdtMVmX2Nv3dDVmCrKcMOuLMwWl/ZjsYkyBl/N3Iu0dnAXvv09o6
	EKM00/wJfMrS7jlZEhSDVmTDjzsfpbe7r
X-Google-Smtp-Source: AGHT+IFtveIIDTcyJAnjHia9tIV1AvmirXxSlVv11WsL6hk8Z34okLiXhF2+XZpD6tAQX8TpSeCydQ==
X-Received: by 2002:a05:600c:154c:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45a217f1cf7mr59689355e9.4.1755370898887;
        Sat, 16 Aug 2025 12:01:38 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c96dasm6608999f8f.43.2025.08.16.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 12:01:38 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: tglx@linutronix.de,
	bp@alien8.de,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH] docs: Replace dead links to spectre side channel white papers
Date: Sat, 16 Aug 2025 22:00:28 +0300
Message-ID: <20250816190028.55573-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The papers are published by Intel, AMD and MIPS.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
The MIPS blog post is nowhere to be found on mips.com,
instead a link is placed to the last time the web archive
has crawled it.

 Documentation/admin-guide/hw-vuln/spectre.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentation/admin-guide/hw-vuln/spectre.rst
index 132e0bc6007e..991f12adef8d 100644
--- a/Documentation/admin-guide/hw-vuln/spectre.rst
+++ b/Documentation/admin-guide/hw-vuln/spectre.rst
@@ -664,7 +664,7 @@ Intel white papers:
 
 .. _spec_ref1:
 
-[1] `Intel analysis of speculative execution side channels <https://newsroom.intel.com/wp-content/uploads/sites/11/2018/01/Intel-Analysis-of-Speculative-Execution-Side-Channels.pdf>`_.
+[1] `Intel analysis of speculative execution side channels <https://www.intel.com/content/dam/www/public/us/en/documents/white-papers/analysis-of-speculative-execution-side-channels-white-paper.pdf>`_.
 
 .. _spec_ref2:
 
@@ -682,7 +682,7 @@ AMD white papers:
 
 .. _spec_ref5:
 
-[5] `AMD64 technology indirect branch control extension <https://developer.amd.com/wp-content/resources/Architecture_Guidelines_Update_Indirect_Branch_Control.pdf>`_.
+[5] `AMD64 technology indirect branch control extension <https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/white-papers/111006-architecture-guidelines-update-amd64-technology-indirect-branch-control-extension.pdf>`_.
 
 .. _spec_ref6:
 
@@ -708,7 +708,7 @@ MIPS white paper:
 
 .. _spec_ref10:
 
-[10] `MIPS: response on speculative execution and side channel vulnerabilities <https://www.mips.com/blog/mips-response-on-speculative-execution-and-side-channel-vulnerabilities/>`_.
+[10] `MIPS: response on speculative execution and side channel vulnerabilities <https://web.archive.org/web/20220512003005if_/https://www.mips.com/blog/mips-response-on-speculative-execution-and-side-channel-vulnerabilities/>`_.
 
 Academic papers:
 
-- 
2.49.0


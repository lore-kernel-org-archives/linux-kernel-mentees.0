Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC13202C2B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755593452; cv=none; b=PHz7cmBbV42nvi+jqVLrP/rzQEOObA+uUVhufOZoB9GqtlVr1eIPJKeicZVLnR9VcSsXt06CXyqWk+c9kCtttsuKxNfDzJuMAlOIck8pWfoC4K2D8eHx65Fwxwel7wA0wZeT24kqGw4UJoQP0pcCMk4rTHTfBThHQzqtEx0mxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755593452; c=relaxed/simple;
	bh=DmkDwkjEVAiC0sDkPJg0pXkSVSJZJEeVV+GgiVYdIbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gu85cZMavu5DZc4m1TFhlj6YU3zOG64ISLlTjA0nG8gRl9v/W2pRBDYNnK8WpRTBGDgZGpDwbpM8DIwK7M/ZjDzPwGLLREIkMiJnDVCKUgoCBQ4GxLTaaDo+7mhe+BTxKTmB53VU4MuEWUF04umcSrfnbTn4Nh5ankMli1854iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkh2GG63; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkh2GG63"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6AE40903
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhEO1H6rcOve for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 08:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1A9A4085F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1A9A4085F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fkh2GG63
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E1A9A4085F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 08:50:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b9dc56a7a3so646742f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 01:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755593448; x=1756198248; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppSRiVRqts44ynE+tjD/tC5x7x1c70mZiRK8wzwb5ZI=;
        b=fkh2GG63T9Zg+S9MMClY9mAxv/xyJDAT3iUZ830i8/TCdwwe3ow8osoZ4SbRabVCI/
         s9+mw0k8OHkNr8XSVvgJ8m6cVrQg5i4EixACfZZQOiXSHcG1W6DgXoUQZPFXhzgSvPFp
         cVTOCOQY+4qBinxaIHIXBjWNXj9SpN46BDHBuomC8qX0EiyNtEjn/208ac0HS1/G9sci
         sIPouo8XoRRO3VRulU+XXgYb309PTgYgWKceNk30mJi7no5wSo8hTWL05njk4dWFg8ku
         8vE1eRZVY5yAHG1mC50aJhYDn57TMYw4wL1qcNAgf3ns5yxXEXyXGyk/a2v9sy6XqlfD
         0x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593448; x=1756198248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppSRiVRqts44ynE+tjD/tC5x7x1c70mZiRK8wzwb5ZI=;
        b=R0iiJVyP/xUHhYa0BXc2Ag5xcymzvgpfMp1v18BSbUSeuCIsUtWyrB8GAdCe6HNQjU
         QJl6ABs2DB5g73iPqsZMZ2XsoT9W5E4/GQsrmgQgOd78AWE1OdHnL2l7WKhsBlVXtv26
         nMSzobIp+VZYL7HrmhVL18yq8PCKpR5gpeo4l4MQ0KfmNo1bJgB/B5/cw0IPTLreZy3e
         TvT2Ng9jcZLvez+58O1t/Bhu8eR5CKK0ZML5zszjHOh6HkSO04OsuHPERNMiZeAR4ymG
         pS3B4iqJQKOQkdKdL6OrnVZWfYSQExylSNTsnFmVeN6Bo9hg8NIbwkGRI6PcpMmBpWCn
         sv4g==
X-Gm-Message-State: AOJu0YxxYhzqcnTK27l+0Cn4vHcW4TEKwx1buc6RFID8EmFSaiF9xUHX
	TJTOy+aq3D6iIAdr7UCr8k8IN/wcPakgHweCGXx+TzI4LEuUkkGw9FKQ
X-Gm-Gg: ASbGncsQ3q1A3uwZwYO+arhFxR4n0panw0ERlrBgJnwvTiWcvy6FdWhK6GWJJkYjAmt
	+JkGM2bT5E2iOhp7n4HPXoimHtqtpCvYJXh6mgktLjbK+LtRuKPF5/iDEcqGtZb0nlIE3g3wwmC
	pELhrqI5ijz3giGZzen2HuXw1QE1eAxVZZ+ujaCZZnW+JFaOSdehSXBjIL3WrlhFRE07MDG+cPE
	Thi3iwCztlhz4A7pncye53Ui/Q47BJpFdG8+GjB5I400itpbuzI6PDMQJW+USBL3D3/k/s+dpOv
	moiHcDGpcJO9beyvq1ADD1iOtK+Uc2gouqqQa9OzH6qUrz8aWTdEbTlxV0t3C6sYK3iyZd0sWni
	qBVCqzkiZfVv40SWGOiOQ0ONqJw==
X-Google-Smtp-Source: AGHT+IENAMM40Jw4dEcSYO2Fhf9hmnZy96HLWA+f1XfiP1n2rwpiM7hAlE/XZF/W177VE+ht2KtknA==
X-Received: by 2002:a05:600c:821b:b0:458:a753:f3a1 with SMTP id 5b1f17b1804b1-45b4425f28bmr5609455e9.3.1755593447660;
        Tue, 19 Aug 2025 01:50:47 -0700 (PDT)
Received: from bhk ([41.231.66.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a983f7sm33587315e9.24.2025.08.19.01.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 01:50:47 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	mhiramat@kernel.org,
	rostedt@goodmis.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] docs: Corrected typo in trace/events
Date: Tue, 19 Aug 2025 09:49:00 +0100
Message-ID: <20250819085040.974388-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Changed 'Dyamically' to 'Dynamically' in trace/events.rst

under sections 7.1 and 7.3

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 Documentation/trace/events.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
index 2d88a2acacc0..18d112963dec 100644
--- a/Documentation/trace/events.rst
+++ b/Documentation/trace/events.rst
@@ -629,8 +629,8 @@ following:
   - tracing synthetic events from in-kernel code
   - the low-level "dynevent_cmd" API
 
-7.1 Dyamically creating synthetic event definitions
----------------------------------------------------
+7.1 Dynamically creating synthetic event definitions
+----------------------------------------------------
 
 There are a couple ways to create a new synthetic event from a kernel
 module or other kernel code.
@@ -944,8 +944,8 @@ Note that synth_event_trace_end() must be called at the end regardless
 of whether any of the add calls failed (say due to a bad field name
 being passed in).
 
-7.3 Dyamically creating kprobe and kretprobe event definitions
---------------------------------------------------------------
+7.3 Dynamically creating kprobe and kretprobe event definitions
+---------------------------------------------------------------
 
 To create a kprobe or kretprobe trace event from kernel code, the
 kprobe_event_gen_cmd_start() or kretprobe_event_gen_cmd_start()
-- 
2.50.1


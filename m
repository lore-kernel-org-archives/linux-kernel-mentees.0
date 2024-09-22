Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02D321D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727011910; cv=none; b=ZJWbXcsRdvOuqcP050dpIOCaQdLtPRdWB2InTLg8s9EMeRc47uLvdlecN3sVALI5VzizNvBml5ForrFx/cWs86BkCghsU5/Ze5hRrpacMi7AcuBvQ4Wldc9ejXhc5R3r5VZXJUCw9W77k2XdNgzZmH5pTpEpUUGAgXW1tvBeJ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727011910; c=relaxed/simple;
	bh=n1V31JdnsfrSdsVXN7bDlOoQ3BVtUu/IioetLfG4smc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZQEUD8j1s4b7rqpAXQKxvrshTqLrN9KnJeCdSID92NCVaDGhBmgyILCt841+NzL+aMoSWqr+SIP79nid/6NTFR+D8ggl5tLK17ujks0MQQiT2cvLWY4jg35dXVBxDi/Ta6Tq1GBFLqSzx8xVwzgWps2PuVEcCABO3qtQicCsmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdjhZlwy; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdjhZlwy"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED8E140553
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 13:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no2GZ2ekU2mU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Sep 2024 13:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1438940551
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1438940551
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TdjhZlwy
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1438940551
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 13:31:47 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-206aee40676so28637965ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727011906; x=1727616706; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FteN1NVxM87RoJV6pgBXiOh96b1d0IQZBxvTcTzb5no=;
        b=TdjhZlwyESpKeWzwnh7G38GRFjsMZ1MIZkBgJYdDzE2RYrmtPdmXYlPvx0k3r1SB9N
         AVtWGaFJb5ZGxLdWQaK9fDPr8dtEXrNqYXwg3TvhpQ8L6RFmWwxrhzADMeUPUZxelSdi
         J5fCDabamKnfSuyMCZzWAgvi0tR1XdwwPMPc764dVl3p3kLDdFu+v3DW5NWmfll8DzxA
         noCEJtB4DWecRq5w4sbvrsgshMhMpFajuMNtHhjH5VWGBugdJgoeFeEJEAVCfBckzdyJ
         y0kF2wQs5g0VbxP+popLVnSJjXLquvmGQFgOWIA2kfLivtPsJUPiUBVybI4wrdRJDW0E
         lSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727011906; x=1727616706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FteN1NVxM87RoJV6pgBXiOh96b1d0IQZBxvTcTzb5no=;
        b=Fz/BwvUSphc92wX+q0sP/gAKsxZRfMt8G4siLZGUE/uMDXW6K5T5+CmhnTvYxtinDv
         /jZ0VBmFr76xwLz+zn4gkI4pH1iuT5FQ+5i39tEdqn95EaU7eMtboAs9nsrewdOL2KnB
         AsfksbAmEplrlIHU1EH3euiEb5FVyRlcYc7CwIobTSIrnT1C0Rhgl72z1rc3CpRBYtwY
         DIDy8KwOhc/jrm3DgDTk/YFROf9rPyhCcYgtJXqcxVJ43m+jJrCOq/eLLvp9czyhxFcv
         azXcib+B34Ak+WH10JpSOn2QoYVfdBY6cqdxjVgR/GElqUrRxi4n8jtkCNgZZMrn5m02
         1azA==
X-Gm-Message-State: AOJu0YyGIotCttj5VEjjN0WCy0fAVi0xUyhIMxfx1Y/evN5m2X8GAeD5
	kJ0EWSy45E6fuED2AVDg0o4/Rhd9fc656JTrfrn8Mgp0hrgziHjYA60p38Sk
X-Google-Smtp-Source: AGHT+IHhgNAHLVFJ4uCDYFpKauQ1a4rjzI1C6yXb7CGQvMsulRV1fZT4i2gUEYjDvoot92MxL2WJaw==
X-Received: by 2002:a17:902:cecb:b0:207:6e51:41af with SMTP id d9443c01a7336-208d83fc79fmr135416405ad.43.1727011906111;
        Sun, 22 Sep 2024 06:31:46 -0700 (PDT)
Received: from 0x7f800001.hitronhub.home ([2407:4d00:3c04:81a0:f26f:1ad7:c7bb:baa7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207946d27dasm119972225ad.172.2024.09.22.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 06:31:45 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] trace doc: document the device_pm_callback events
Date: Sun, 22 Sep 2024 21:26:28 +0800
Message-ID: <20240922132636.34413-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the device_pm_callback_{start, end} events
under the "Subsystem Trace Points: power" section.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 Documentation/trace/events-power.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/trace/events-power.rst b/Documentation/trace/events-power.rst
index f45bf11fa88d..7031954f7ed3 100644
--- a/Documentation/trace/events-power.rst
+++ b/Documentation/trace/events-power.rst
@@ -102,3 +102,30 @@ And, there are events used for CPU latency QoS add/update/remove request.
   pm_qos_remove_request     "value=%d"
 
 The parameter is the value to be added/updated/removed.
+
+5. Device PM callback events
+============================
+The device PM callback events are placed right before and after an invocation of
+a device PM callback during a system-wide suspend/resume attempt.
+::
+
+  device_pm_callback_start     "%s %s, parent: %s, %s[%s]"
+  device_pm_callback_end       "%s %s, err=%d"
+
+The first two parameters in both events are the same. They are:
+
+  - The name of the driver.
+  - The device whose PM callbacks get called.
+
+For device_pm_callback_start, the rest of the parameters are:
+
+  - The parent device of the device (if any).
+  - Level in the power management hierarchy the callback belongs to (e.g. power
+    domain, type, class, bus, driver). Some stages (e.g. early, late, noirq)
+    will also be explicitly mentioned in this string.
+  - The ongoing PM event. You may find definitions of those events in the
+    PM_EVENT_* macros in include/linux/pm.h
+
+For device_pm_callback_end, the only remaining parameter is:
+
+  - The return value of the PM callback.
-- 
2.43.0


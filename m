Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB03186E40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764818750; cv=none; b=snvOjIsn8a5JWaflDbgLpUw31/VPRBxNuy+lmwjSRPp2QjYH8R9gxmcgQrY8Fo28GF1dRIehLPF/BLwPrZbnM847Moc75w9xVJLhN1cMNUjXNi8Vlz2WuJfvcfnSLRyy3eZxD/6Nw+rvwbIazDYcy1nKWo7huVWU0ta/OFiXedo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764818750; c=relaxed/simple;
	bh=I/7cxZP7PHzdLxWaX/VoNXA1nB8DuuZ3s1oSZkRF2JY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=owFQGKQilJL+qyNFV+4zFlPHQj6MkEOUtfd56UgqdN7/9kfjmLjZzr3GWgBCTM+7QbBBOYQABlZISI+yeXpkIgna4jnR2lovPzofSc+zay2roM+5z9xXkUK4xIUGfhHZqoTAhoCy1mLghmnFIHZ7S4XsEoWSAof1r256JWDPLJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3fh/D6y; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3fh/D6y"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C1B60E08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 03:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QddWxGdH6LH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 03:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE63160DF1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE63160DF1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L3fh/D6y
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BE63160DF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 03:25:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29812589890so6643625ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 19:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764818746; x=1765423546; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spK07RH9SB/e09bcGxV6H18ne9sRU+EARhuUPw4HRqA=;
        b=L3fh/D6ymhkOV481JACMrcc3V8Up9gv5z8VfPIPlEoMorme0/wLIIrnswL61l0gsnF
         Z4J3TRklP/mmT/Z3Zm+sL88KKOn7BNuDzuxqgmDHp/bY+Pyjcw1gXQxPbqS61T4Zhu78
         mXfpIxJZ0UDZGtTchd3fCC7HiLAqRJC+MclZQHgX7V5MMI8KpP9iF/Bgb6enbPSzOmzm
         qUdetnw+YLijvpvEc4std1qAfiKniXTYWBgMcrVb4JCPlZI2s6C0SR+NSqXM8vK+HIPN
         pxv5M3eHH90a3c3Sac9/l4EG4ctMApyRygzjoTEv7Y5LLxFEi8p50VnJZOOwK2H2TTNN
         bIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764818746; x=1765423546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spK07RH9SB/e09bcGxV6H18ne9sRU+EARhuUPw4HRqA=;
        b=YW8ygvZ9sE9WJdfPxJYbgeem/B3loj9rjjgWLBJ1zl3EcdqdbBUG+UTPXHr5zBL7FV
         aTLKuDvpTYaWmckYH+iGdiFAB84p0W+OGGBkhwvQpv0XxoLEBe6TjSSY4DKEVALyIywb
         9iqHNtW7gzOBCjUOJF7WPO8ZJihEvaLJDItUp5BOCwmrF/L5RPhbKVoKnc6EQHTBUk9t
         8t9xN5q5PKUlK7Thl2S14VJncKytWK+tStlouKvFUDWtmtJUg6vI4UnAxdmE9OgnImU3
         tEWbBdJ1Px1BgP52G2NJ8XE2wvWdgkMbeJHeALEkWzdhgGbume5ow+XeDE/i5q1h/Drp
         WxJg==
X-Gm-Message-State: AOJu0YwIPCq+qx0bqh6kY/ZgWDzOb3ArnATma6pET6okQLsoMP/exC6a
	WAIEiuRArG6ODHWmqV6/+eFvqYtqCNVswAbQjn/tvcZTqjvC/1TEAnhUiHjcxf5m
X-Gm-Gg: ASbGnctTfWLrz2LZJaAAa+mW5dAq30x0tMyOr1JGUIwsUvHAd/s90EUiBX428BzwysZ
	3viIK7qNTA3L0e68mxaPAPnzzkxPJ2acLTZkGF6c/1h/wTCbh+FuYRZHl8O/dmyiCovyfBEQDu6
	CZnuQCycuiDAcUFdSQF/4m9XS+3Bml1RZ77s5/SSfxjiA2DAyheD9/TVe0Rd73PSe/fIUdB9RHB
	p1bpul+IX202BUorc0psz5J9Ezrkupmzye/uKLe3qC6GFkdnBlg3vjNXfcG3VYkOzgiFJNQ4F1k
	FHPdHDF7hqhOayBKAGRdE9eqqMr5CaMwdE6S6diHJnlDF62uBY7qk+IsfSeyfUFooh7uf6YBSL+
	mpHAKlXuB6vzsn0APZG0GTWVz45fMexf3wVJWM9B1/OzlKzQR+/1rxLaf3ZvZXHCW9X9XQgL4Fe
	8pSd2NiKbYTwj7qwIZmL0=
X-Google-Smtp-Source: AGHT+IExoyiKStk6FlBW0on3Vp6H6eKbj5VCku2/JVbKZj2lvzdBE784/x0jxPXK1wTtwNEmlSM77Q==
X-Received: by 2002:a17:903:13c7:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-29d68482cdamr60414585ad.49.1764818746475;
        Wed, 03 Dec 2025 19:25:46 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f01csm3112725ad.48.2025.12.03.19.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:25:45 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	rostedt@goodmis.org,
	namcao@linutronix.de,
	gmonaco@redhat.com,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	bagasdotme@gmail.com,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] Documentation/rv: Fix dead link to monitor_synthesis.rst
Date: Thu,  4 Dec 2025 08:54:52 +0530
Message-Id: <20251204032452.9523-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
commit f40a7c06020709
("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
v3:
- use a 14 character commit hash
- unwrap Code Blocks so that the references can be linked
v2:
- Use proper commit SHA reference syntax

 Documentation/trace/rv/da_monitor_instrumentation.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b57811..9eff38a4ad1f 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -162,10 +162,10 @@ For example, from the wip sample model::
 
 The probes then need to be detached at the disable phase.
 
-[1] The wip model is presented in::
+[1] The wip model is presented in:
 
   Documentation/trace/rv/deterministic_automata.rst
 
-The wip monitor is presented in::
+The wip monitor is presented in:
 
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst
-- 
2.34.1

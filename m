Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF11EBA19
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 22:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747175570; cv=none; b=A8e1dRSVq1kOjjdVV1a6noSSAoPoLQDBOKQqFtekbmcuMGnHG3bcZDUX3oaxR516oIbbS9TKBL4ifkJmOM7qzOSVHEhuy7PwONLRPZMum9+8SBrTTN6u2AX6lMJHQTP/3HQ0ulyz4/nHCq/Oz1uXkwFkUEpUHCU6BXiXrBWBYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747175570; c=relaxed/simple;
	bh=+3XGKK5tSVsAG22kTR01LPisOgKQ8LKsZXwmHszxcxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eLobgYen1R1Dq5P5gvURBuPHGs5U/OBq8hzoYz+PlhyDM2l9+Pv95h866d86p2Gw0GLrlm1zkksH+tpXGoMbpfOJqo9r9BeCQC3DkdrLD/4REkiXw/Mi0x1As7vJtHo84TM9SK+D+Xxvi7lqqztvSiBQS8S+QnDUULr5NtwzyQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4A52Nrd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4A52Nrd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b3f62d1aso758507f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747175567; x=1747780367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOO3+D38PGP2XKKbxPd24Ou4JSZM80XieSsvghMwa6E=;
        b=Z4A52NrdYeUATp6Eok+w6q4zb/tkaORdo1Qzjf1s+LNzZil78GKwjrLcGsFIkInH0Z
         dY9CAFyLDC+azVWviiNIrfJ75DKbD58NFv1xdInkevjxlrGJwuo/xrjmmJxtaFzMj8xH
         QkOjVtg8q5WPAMxDRE7qmf064RyF6f2NsOjfoi4Atv1VWmUdbemENhAMmJVpggM3DibY
         jlD9RNlJtEyoAXTQGVZdoCxUixdMqtu+p2ZiQb1HYqK2/J+uihslru67tQkTmjq8WrDd
         owVFf2JMKFj9QqLhftq3hQJgHgyl+hSeXEC7ysjco3yDZ6aj3RukJ4LuQIBFaW5/ciVY
         Gf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747175567; x=1747780367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOO3+D38PGP2XKKbxPd24Ou4JSZM80XieSsvghMwa6E=;
        b=vB+1RBhMmchNGwrnhZBXzM9PXGvqn2TXzRAhJc+zR+3OYEIeqeJg3e5XP685WUtuc3
         q0wnxvNpe6mnxRKbYw6M0Sqc0bwfkiF8EnzMj4Dzhk1pNH70r7usbB4A4Kba6CrwMGx4
         yRtnRy4t/uPdRzbzjvqVIqdfVoMhH48VcnRM5cU+RtBgeBJgrmtYOjoHOizcCXff43vY
         A4+WCsBAcJAYl4YLtn3nExm+V8yAC013dLoO6noAFyIP2GVbK+0he4isSeaSJFEmi+ZI
         FugKRFM804xA6rMBZwgovcr2hGNct3pH1mWiJGpQ4Rm9u4Yicv/eovd5oC+QGPk/vUcc
         LoHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfKxOjD6leks2SPYYdIjbSlgiWwg4ZYfLLPYnUJFJqdwnXQgZ+tmOTwJtuwul7ekpie1Rq+7gp1SThAlgx6zXHAYPxRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxyq3fnxfLrciG+6QsocQWw4XPJPiChJ94G0tLh5qR8OP+aFtWe
	B5giuqa2VMGr6/4RkO++RMwz3nlKVdN+Y5h9wrdpWHEaAbxWQBzJ
X-Gm-Gg: ASbGncuxNvlnf5SJ41Jmmo8eWkV5zrhQG/hSu2QXmUvBAjQ331MetvQNLhLIf6LllNS
	t55Pe7SySnAkWR5At18HRgYB/FCaLs9Obr2ALeGwySWBjBzbQuti5ga35lEHPB5UT4MniEC/V5U
	HuYY0SLAKVIHeKng1b8Y7wrDY6RWV2C7yZJFp8ZWjV2/kjSWS3OJSxE15I9LiTY90N41L0o0TSo
	9+AU6bKUHidC+ZqorByju+9h9Lo/6c2lxCb5UArLZdb/uLxLRXbaJO7CnDBAxzPqBHt4PL3AyLX
	IWT5hoj0plA9W94ymrqOtTAYKfZGK7T8GjbeVpIDFexQlSe4q99Sx7aOZgL5EDwiWzHOfQs3C08
	ZQ5fJQF7EKMMV
X-Google-Smtp-Source: AGHT+IFXJLpwx5PB9w07pxqndJCIjz+5sTL3g4V+/2gtwJv10YxYnXtbMmFVW1vbDCGtifs54FlzCA==
X-Received: by 2002:a05:600c:350e:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-442f2190f43mr2271575e9.6.1747175566477;
        Tue, 13 May 2025 15:32:46 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm3849195e9.8.2025.05.13.15.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 15:32:46 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: shuah@Kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
Subject: [PATCH] selftests: ir_decoder: Convert header comment to proper multi-line block
Date: Wed, 14 May 2025 01:32:42 +0300
Message-Id: <20250513223242.304716-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test file for the IR decoder used single-line  comments at the top
to document its purpose and licensing, which is inconsistent with the style
used throughout the Linux kernel.

in this patch i converted the file header to a proper multi-line comment block
(/*) that aligns with standard kernel practices. This improves
readability, consistency across selftests, and ensures the license and
documentation are clearly visible in a familiar format.

No functional changes have been made.

Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/ir/ir_loopback.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index f4a15cbdd5ea..2de4a6296f35 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -1,14 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
-// test ir decoder
-//
-// Copyright (C) 2018 Sean Young <sean@mess.org>
-
-// When sending LIRC_MODE_SCANCODE, the IR will be encoded. rc-loopback
-// will send this IR to the receiver side, where we try to read the decoded
-// IR. Decoding happens in a separate kernel thread, so we will need to
-// wait until that is scheduled, hence we use poll to check for read
-// readiness.
-
+/* Copyright (C) 2018 Sean Young <sean@mess.org>
+ * 
+ * Selftest for IR decoder 
+ *
+ *
+ * When sending LIRC_MODE_SCANCODE, the IR will be encoded. rc-loopback
+ * will send this IR to the receiver side, where we try to read the decoded
+ * IR. Decoding happens in a separate kernel thread, so we will need to
+ * wait until that is scheduled, hence we use poll to check for read
+ * readiness.
+*/
 #include <linux/lirc.h>
 #include <errno.h>
 #include <stdio.h>
-- 
2.25.1


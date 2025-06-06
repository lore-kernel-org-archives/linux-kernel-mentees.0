Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C93D1EF09D
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  6 Jun 2025 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749249620; cv=none; b=Lk4xxWBhIs/z5oZYB4r1R5zfNPyaizhuwCxcZ+/VeDhrpfqx3dYmkgvzDRVFZel/T3ZPchLnxgmZ90fRjUsZYB3MNqp5h+V2UtoGqn4cP4CutfNyaIhEMDSadRe16rG3aZCqw64dI9kxMa7xSQXDDZmuzvGjwJLRQ/Btq457JXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749249620; c=relaxed/simple;
	bh=Umf6aZ0L2/WBdq94G/QOnFxf54hsMxax8i4F49KC5fU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LeKU8fdwwnkv8hkVDL0+Pr8N7PuPiF4fQGzrkvzm4zA2YaHMbWZJQUvp+HmUmKDGWx3v0Ya9YZBGrgLxfa/euh62BjwERtiW+US0M/wcI0tEEJlAObEUOl4AXBKsdJfx1SpHKjF2JpZb0yTLUEYE9nrR9e1Q3gLE8Wc94V2E97w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsou+i6d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsou+i6d"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso409987f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 06 Jun 2025 15:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749249617; x=1749854417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXshBSIZNU4BeC4KDEJtIathlHJ2M2oUxcH/B0uC15o=;
        b=dsou+i6dbmHmgzZDTDU7l5JL3V1ERhgkeb9KyCbLbqQBs2ApsrI0o0QJ1nGT8qN2Ye
         w9FqR9u1f/9fHQzCqtNrphhRz4dxkufngrZ67YPQgMSNETpvUMD4Zb2CwMMe8SzO3ExT
         nqEfj9pFDXaCcZ4Nq8rHQV8DzX6SQ6RPhjjzIHXuyHQpXwHQy0HSAhbNBrBJOHx0Axdc
         Fq2Df3KyjiQKvWCZxyavVjIhNCCi3q/shqgHB0UOi0Uu8iX/TMslqh9vWiTqnfaMO7bl
         yuMyISMZIMiBXnloHlmB2RuzZyGK0mtIuCApnxtzgZ/of3vAt4QgPXWLFmXUaBGppz2p
         EMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749249617; x=1749854417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXshBSIZNU4BeC4KDEJtIathlHJ2M2oUxcH/B0uC15o=;
        b=YRBjUG6ncuPlqN1o9pMPgU6xxi970NF2ZiY6HZxRn3c+LcTmw+/S4VK/UvbE2PZzZ4
         W/ayZHl0kZ+f9rrCL8JIXbt8XwM4oVLPOaQLDQPg9oYyraQoYf7Fyqpd4acTIYYB5hD4
         aCvdiEVZsic0xH4kSZI0OE+58iMoiYmbO8rQmruHGp1BtEk/4lZhcKbdjfXoQtn2cUXe
         vs9za//iULiC9HpcOYsMXFa5v5I/trzv3mW0b97L6xRxShAAGs0lJADZw0dfWvBu1ngC
         BDifmUVODhQXwrPo6WQcd7PvEoe9eYQQgJy63e77sIMMuyyEqYkl9f1gKH98PtQsGnuv
         qPNA==
X-Gm-Message-State: AOJu0Yy/iBZyFjSSYEAQlrrVCSaHtvFlMSc83Iovc52yhAxLS0Erh0H8
	mfZDvzzNxcD8l07vgP7jxEvJfScVxAbHmVYk4vHFAatoSYc3WuB9V3qm
X-Gm-Gg: ASbGncuj/L/F5cFMl0zp7C6dyx6zdLw9Uc7ULdpXCNgzhSi7zWJdjI1c71i5BROENu4
	cUjHrjygqViJmIsDWJeMzZn634lXokZzEkiNoZ0TClD23tZXm/Ne/C6Qe8uHklo+gJOk0SbBn1r
	biRtukYpgEeHZ+Oa+GiXTFeaoU8vzhojBtdmVUE+3jsEvni9XJOCqAfSfLgBUg25zj/N9LUVz65
	T6l/3kSDS3o+46iFNg+6K1+7+p7of2RnCk3JIsQGrT+TYpF3niln5OSb9mb4StrFxYkLO0M1+N7
	7fA/VQHdE2tDk07u/Fh9f9Sed0iLYRf4pvCHFbQYv7C4/Wshg2e2ZMGg+Sawd05z8E2CrUUag4t
	Kv2HttUy3RuI=
X-Google-Smtp-Source: AGHT+IG2IOCjOeOs8sYspOVGNo6JXAP4dCv2MZ+rJKi1VOqe3yrtvfxYWbt/lxPo4/W3/HuTbHFpPw==
X-Received: by 2002:a05:6000:2281:b0:3a4:f7ae:77cd with SMTP id ffacd0b85a97d-3a53313110emr1363448f8f.1.1749249617020;
        Fri, 06 Jun 2025 15:40:17 -0700 (PDT)
Received: from localhost.localdomain ([41.34.150.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm2968132f8f.43.2025.06.06.15.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 15:40:16 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: skhan@linuxfoundation.org,
	shuah@kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: ir_decoder: Convert header comment to proper multi-line block
Date: Sat,  7 Jun 2025 01:39:14 +0300
Message-Id: <20250606223914.117449-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <65743e71-fc2c-4a04-b7f1-b977031a4fb8@linuxfoundation.org>
References: <65743e71-fc2c-4a04-b7f1-b977031a4fb8@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So, this is an updated version following
the right way of writing change logs while
making sure the signed-off-by mismatch is fixed.

The test file for the IR decoder used single-line comments
at the top to document its purpose and licensing,
which is inconsistent with the style used throughout the
Linux kernel.

In this patch i converted the file header to
a proper multi-line comment block
(/*) that aligns with standard kernel practices.
This improves readability, consistency across selftests,
and ensures the license and documentation are
clearly visible in a familiar format.

No functional changes have been made.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
Changes in v2:
- Fixed multiple trailing whitespace errors
- Fixed Signed-off-by mismatch
- Appropriate change log
 tools/testing/selftests/ir/ir_loopback.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index f4a15cbdd5ea..c94faa975630 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -1,14 +1,17 @@
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
+ * When sending LIRC_MODE_SCANCODE, the IR will be encoded.
+ * rc-loopback will send this IR to the receiver side,
+ * where we try to read the decoded IR.
+ * Decoding happens in a separate kernel thread,
+ * so we will need to wait until that is scheduled,
+ * hence we use poll to check for read
+ * readiness.
+ */
 #include <linux/lirc.h>
 #include <errno.h>
 #include <stdio.h>
-- 
2.25.1


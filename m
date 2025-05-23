Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496162DCBE7
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 02:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747967398; cv=none; b=iU34EiUC72m6h4Xtr1Ke7CzzLVTI/1LNDhXsbgV4xY9jcm8WGsBwAo7zYrWCsekOZy9Kypn1a/g+sU4UQHxc0b2x46imXLjk9vnwJUAD8sPIyaTlqOBHQGcP6GnCCYo5WjkGnBPprvQ0nFvYA3MIRyevY6dDI1d6kj8Beam29Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747967398; c=relaxed/simple;
	bh=/p5QOnAA5KJ7aDYcmscxs4NxE2/gHk0ljkfD71F1HIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A/F3DdmYqGNO4iaelvC9kg6DxygnPO5rwTCx9IPFFXlwQRxi95vn9S1s0IZx5x+L7Jyl2y2I6SUPR1Us/+4DglAyit6LsUaofCCuut/6uVcTIGb4qNDc1656ByMvN4ku36MZhJ5QP2ozSLevyn3Wrr9OYVlBCA4YsXL0bFOr6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Juj1IeT/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Juj1IeT/"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a362e099cfso1041019f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 19:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747967393; x=1748572193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLWLUox7Pkfq1ZKB7xdwPbjb4AeXZLvutu7IKPhQb5U=;
        b=Juj1IeT/BumrIEBSS8Uo32v07UBmYx43xF/vgrLi7Tp5cPoFIg77jS+PelOuntkO1A
         B+VYcAXXLjf9k1iZfwWUv2FoTtN6zTBUlGMsXgrLIkryuu4w1PGN/HHVwkRipL/J4Orj
         WMWAyehKyAdnAYzqeSRCBhZra/L9Tu/ljVJ4Yaok1VFVGKdMCzoSAVoaSzvP8FLxXkw3
         GUA1fNMlkguTkaiGrL70dadXYf6r6AMBl0oPPN2BFUo+MajNwBa60WguWXXiSVUq4Q/g
         Ulp4HG4Hyoq9MNIbuTZviEr5r9cmeTuVCrH4BybeFpADXTnhSsqUUVDByCt+D7a/HjF+
         Blxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747967393; x=1748572193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLWLUox7Pkfq1ZKB7xdwPbjb4AeXZLvutu7IKPhQb5U=;
        b=oNjI1YtIv9giCzrnrvUbF6R7ut7/KhPBEOMpOusu3yZ7jNSsDx9aw9gWSofevPAUKK
         SR/v1JA7FEe4tqt6kdhRYgGuTsNccwEp5nLET2pMxLt2NV1oH5EzddJa1n/jAapqidKa
         M7qnQq1QtRiwP+frpz/PwGHgzEiE50suapgxnDEZeYaGX24umhz+pyqS3QIfKCVmdTd0
         eFO2duf+0g+leVtMud0fn70OIgAH84earU88CMTzK+kSJFPPnlESVR8u1eYV8l9HfPV6
         ykyXvkDWZfEpRIgH3Rffeye8xrAgL5snumA2XIq1xFIOynhBmH+7B+mvyhLzvmga8jDr
         M8JA==
X-Forwarded-Encrypted: i=1; AJvYcCU84q9BpUBvU7n/5jc/Or6ZAknZV7fhglKWU8QYS5ZGnAJfI2H5TZzTD0KmRC7AAe/NbLDJTyZsh9GEHQkwzaCMvpzPQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBJ7hll16UwahxoNAIhexd9PaZ4tX+KmaSKk5HsgLNoXsrdcmS
	RVna1zDOgVLFi0nGX8pQUNQe7Z44hYTrLEa16y/rfK1ppdBAwWdnQVy0Jw4/Xy48
X-Gm-Gg: ASbGncubzCz3sJH++1Ub2fFWcQG0iHrYIIhUqQtZfBPJ43f5QEVU089VHq+B0jc19JO
	Aue6WvQxaycypmv93W7EDGJKVuz2jUGIoFTeGIb2wigY1JeD2y2GfCQXD4ogj41ctiVEc0nQWQI
	TKK/pKrhNW5jYCX8Np8jJiKavPrpeaK5bGwAK3xA674uYaziRuLP+3UqZwHqjfx3AhVTCNSjxYp
	X/eU2MwscaWORkxDIyHpDTTUvJpwNz1ceuP9UKH/27nYrj3/fOTf08NQY965HBbCgA9lWj+9IWu
	dyiEsCIEkrXt3Rl2p1J6pBRImyhGlInBAOcLcIe49R07nd6R6L4jeQXRV6Sdp5jL9C4rV1rNcPq
	m6d2JWmuPlPoe0Ib+ddqP
X-Google-Smtp-Source: AGHT+IHyEqUJdsoBYcocerfxCARePAv6el2lDNDKFk5koxOH+XVrvNdVbjPzhqS1h5b0QcBiIvnHZw==
X-Received: by 2002:a05:6000:420b:b0:3a3:7769:4f8b with SMTP id ffacd0b85a97d-3a4c2e58654mr190445f8f.14.1747967393380;
        Thu, 22 May 2025 19:29:53 -0700 (PDT)
Received: from localhost.localdomain ([156.208.37.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5abaesm24983265f8f.39.2025.05.22.19.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 19:29:53 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] selftests: ir_decoder: Convert header comment to proper multi-line block
Date: Fri, 23 May 2025 05:29:49 +0300
Message-Id: <20250523022949.11688-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2- fixed multiple trailing whitespace errors and
the Signed-off-by mismatch

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


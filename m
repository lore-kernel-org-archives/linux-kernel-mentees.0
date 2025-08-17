Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D33153BE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755433399; cv=none; b=JLS8RNimFTElBd3LwntbVaJ1DnOuiRma/RNn31sdxMkG95378y+2co8bNKExnpkZra3GcTB0KnO5Sqla9pDwR9vsfe5Lp681oKdJHZI8J9TBi96SPqhF2hfV6sLFfQBPqlzcLr22htkMl2lcAo+8Mtmupwt18eohCANG22jxYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755433399; c=relaxed/simple;
	bh=bqpDX2SDIXlhN8MQzUWC/WnbQ5jomjq1f2mPkABk8uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MRyA393aLdZwb06lQH//Gu3Xn1OG5i2SlySBReZ8IAO4WFhnmArg24JEyopcqMb7jJPp08mRSf3o7KKgPGs/ESpVUwZIohGJ0qqjLBR6zx01uRmt4k/JZ45Fyum6xgJU6aC5exse9g4I6l24wIdxUEdbtv0xVslPjlZDuiNTW+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A10yz6Io; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A10yz6Io"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192D7418AD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 12:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxl13USQZpqV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 12:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23B3C41870
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B3C41870
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A10yz6Io
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23B3C41870
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 12:23:15 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb78ead12so473215466b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755433394; x=1756038194; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9bqoVd/VfswjfZfr61OSOYvd5RkFmqjwWdwSuEWLXo=;
        b=A10yz6Io350K78RwxQuyfMpSnPcJjaPBtgqeGG0Ucq0794MWpeOTQfRRnEaAhuQ7nb
         7vlEYdffcA5CyvIcJbffgaQsEF2xPNVCWxGE9EKXyv+2k3xnREIisICYYxHw5x4YLhVF
         qZu7d1cah2c6dLcB7t1ydqcW6zBBLkMEiK8gbO456UeFtNoBqWyHX5uwXOxGWNVQyecR
         uI79KgCD46B0Hss80SchYFpQR25ygKISD6B73N16QJaoE9KGh08H+Zl7MhfAnnieCjm3
         hEM/XhUDUUbdku9+R+Ng5vZNF+JHbeeCxzQR8Is29lFovogt49MLxS6R0pI2HeYuktdV
         0uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755433394; x=1756038194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9bqoVd/VfswjfZfr61OSOYvd5RkFmqjwWdwSuEWLXo=;
        b=s7F3WEoSaFuN6N+JerftGxwCe+4g8dml1K6S+uHpUTjZwhrNxscz61Wifz25go1jx3
         vrSpmVqHt1kJF3iLQ+5RVTaWKRTKayV0ND0ysJC9Sev7Q7SI3ZLZScFtRyAr1zY7H9L2
         7gtIyrj0ZhVlTgxccEDdtqdArnT4X8jdV/zDEawTgByBwejFi2/HDaM4DvbatPOH5Gwd
         DuWp+L/xcwcL06SdPbX5HDxdn6oUXRi9rJpkw3EB0VPxJJVWuXYFihBMnU0em4MbIrQq
         LBQsVDB7feDhsQo+ExVremHiC1bzfrRJizWse0GjcE5BP3ds0Djs1o62IQbvQ85CKMG4
         zo+g==
X-Forwarded-Encrypted: i=1; AJvYcCXhd6dd4aLwHe7joXE29vzFUGqQ1NZrxKqG4JK0HAWzoCEFZJ0rjupRX3/4N2VvSzQzXzQpzq3EeBGzo+7qxWNh9GBzBw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzc2lC0+P38bGO88Gt9E8m0TQOEdsjzGohA18UdJmQHxnHEdL3t
	RSAmoCfWfuBPVOTLzRDkLnmTgRExa+q1mzJSg5Y/Xh8G2xPBQ8dwvRkM
X-Gm-Gg: ASbGncuVG7K94PiFYdtH7Mue0Ot1don8hXWg19pMdiAAxZ0Ab66WNcCGIF/wT63WNqp
	KLNt7n9A/3zU0rMAd/DN8FHCwdq4tCWVE96BenkHPdOA/8H1BNRZDlL2demiV1zmLFVhBmePHTr
	G4aVmxALbR1tnzTVJRpxlQoCnqzSCWdFIwUpUrqpLoPyNeMYQbm6/E5+1GWfj11/TujugdCnk5v
	aoUIqpvGfxBwSaFeuIe6riIXno2TfA3vu3rLa7sbcRJQRTSPWGvPq+231ddFObv24OMbyOnJYXL
	F7fEmNYwH03qfTVDua9X0V8iz/tP4gdvoVe9CPmeNzZWIG2xkNxd5+d/hzbnjcRRUAgFGpotllp
	XZg2YUdtK2ygEb4riq35OisITVzzfOOj0Cms9yuWCV/o6mO+fCJMCzBIKtUVJznaT
X-Google-Smtp-Source: AGHT+IGbEeZYPHdWNdRKQvQcCOq8JRSYOHJUXF0T4G5ZyUGyNyAgyyoRMM5PwK2yUKfUYNv8RRcMPQ==
X-Received: by 2002:a17:907:a089:b0:af3:9676:e9ec with SMTP id a640c23a62f3a-afcdc288ec1mr713209066b.39.1755433393805;
        Sun, 17 Aug 2025 05:23:13 -0700 (PDT)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04e0c5sm586073566b.117.2025.08.17.05.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:23:13 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] kernel-parameters.rst: fix document warnings
Date: Sun, 17 Aug 2025 14:22:44 +0200
Message-Id: <20250817122244.26590-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fix two warnings in kernel-parameters.rst.

-> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
-> WARNING: Possible repeated word: 'that'

command: 
./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.rst


Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 39d0e7ff0965..445248787e77 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. _kernelparameters:
 
 The kernel's command-line parameters
@@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that that parameter will
+a trailing = on the name of any parameter states that parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5


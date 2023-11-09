Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A337175
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBvBEswV"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE765614C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE765614C0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WBvBEswV
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8zQn1BxlYnE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 21:20:46 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 085D4614BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 085D4614BB
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5a0dc313058so149962a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699564845; x=1700169645; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsvShR7q5/4puO4BbnmQ13+xfWAhOYuyw8hfh0n1j6s=;
        b=WBvBEswVHpdl8ylIGlR4Fv5kSP4JrMbVnfcZRXcoCgtxKTh9c9D5PTb6fpIRIYpovp
         I0q4t1mJsY9o0oCrkqGC3k+ESeMsvsT1crYnV5qWz3FmnXyz4A8XLUslt5zpKnZ/SAJD
         fQcnSvcEp9lQYa8rU1u0LrUbYCNUEGvBpJxR+I7GICFnaAgrlg4vsOdnp0LfWShnpVo3
         QAcxCYQtLzubHRbFCefqMbfbgcq0zRGVKXkpboXe64Ueayi1JMljgl/mow+soFx7IAAd
         tiaoumRz1RfCLb0anT+bqrm9Z1SHgMGVebqeevWEk8zpWpzOESJtyC2kf0jRjW/UPems
         pNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699564845; x=1700169645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsvShR7q5/4puO4BbnmQ13+xfWAhOYuyw8hfh0n1j6s=;
        b=hegEqnrnzuh5WRuhofMoqnOUyodnvmf/4oP8/mhInnwlqH83ibWxwd+iKNbmIY5puG
         CsPfx29yUEyZksKiYO33m67QJsOc59Cn1f8pbd2KJUr1jjLKdJNLJTY31Um1HBDzamH2
         exhNJVHNYkhn+T9mCcG1ZlBxI4Jqh1WLWbZUc/dcEs8qYy/b6iUfXhVG+zRk/4ghJ9lO
         glhU/XtXqIbztIkqYsuoSnbw/cP9h0VxJqVK/xYaoVy4KPvlB9VweuGGzX7ZOYY/tIaR
         krJYntae/MTWmP0P6x2+AfK/EfMF8PXm3Nw/gqp0y+8ntiq0X5pfhIls5ahnFWGLEouS
         A2Hw==
X-Gm-Message-State: AOJu0Yx09FoaXX4TSTpJh18KcsZZhQ4r1gtahryASQpWSr6fKIpbpOMF
	aiQvks5dK//BwptlnDJgEW4=
X-Google-Smtp-Source: AGHT+IFgm9s5BJ8A4WmpafDzV+inKywWIDHS3J5XE0Fqk/WXMqrelwI8cWkN8XKAAxeEdnzeibTwJg==
X-Received: by 2002:a05:6a20:431a:b0:13d:fff1:c672 with SMTP id h26-20020a056a20431a00b0013dfff1c672mr6814252pzk.4.1699564845270;
        Thu, 09 Nov 2023 13:20:45 -0800 (PST)
Received: from abhinav.. ([2402:3a80:196c:ea3:aee5:8832:917a:55b9])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b0026b3f76a063sm213769pjn.44.2023.11.09.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 13:20:44 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: tony.luck@intel.com,
	qiuxu.zhuo@intel.com,
	bp@alien8.de,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH] driver : edac Fix warning using plain integer as NULL
Date: Fri, 10 Nov 2023 02:50:29 +0530
Message-Id: <20231109212029.1454684-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse static analysis tools generate a warning with this message
"Using plain integer as NULL pointer". In this case this warning is
being shown because we are trying to initialize  pointer to NULL using
integer value 0.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 drivers/edac/i7core_edac.c |  2 +-
 drivers/edac/sb_edac.c     | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 23d25724bae4..08bf20c60111 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -376,7 +376,7 @@ static const struct pci_id_table pci_dev_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_i7core_nehalem),
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_lynnfield),
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_i7core_westmere),
-	{0,}			/* 0 terminated list. */
+	{NULL,}			/* 0 terminated list. */
 };
 
 /*
diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 0c779a0326b6..a3f50a66de33 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -439,7 +439,7 @@ static const struct pci_id_descr pci_dev_descr_sbridge[] = {
 
 static const struct pci_id_table pci_dev_descr_sbridge_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_sbridge, ARRAY_SIZE(pci_dev_descr_sbridge), 1, SANDY_BRIDGE),
-	{0,}			/* 0 terminated list. */
+	{NULL,}			/* 0 terminated list. */
 };
 
 /* This changes depending if 1HA or 2HA:
@@ -505,7 +505,7 @@ static const struct pci_id_descr pci_dev_descr_ibridge[] = {
 
 static const struct pci_id_table pci_dev_descr_ibridge_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_ibridge, 12, 2, IVY_BRIDGE),
-	{0,}			/* 0 terminated list. */
+	{NULL,}			/* 0 terminated list. */
 };
 
 /* Haswell support */
@@ -576,7 +576,7 @@ static const struct pci_id_descr pci_dev_descr_haswell[] = {
 
 static const struct pci_id_table pci_dev_descr_haswell_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_haswell, 13, 2, HASWELL),
-	{0,}			/* 0 terminated list. */
+	{NULL,}			/* 0 terminated list. */
 };
 
 /* Knight's Landing Support */
@@ -620,7 +620,7 @@ static const struct pci_id_descr pci_dev_descr_knl[] = {
 
 static const struct pci_id_table pci_dev_descr_knl_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_knl, ARRAY_SIZE(pci_dev_descr_knl), 1, KNIGHTS_LANDING),
-	{0,}
+	{NULL,}
 };
 
 /*
@@ -686,7 +686,7 @@ static const struct pci_id_descr pci_dev_descr_broadwell[] = {
 
 static const struct pci_id_table pci_dev_descr_broadwell_table[] = {
 	PCI_ID_TABLE_ENTRY(pci_dev_descr_broadwell, 10, 2, BROADWELL),
-	{0,}			/* 0 terminated list. */
+	{NULL,}			/* 0 terminated list. */
 };
 
 
-- 
2.39.2


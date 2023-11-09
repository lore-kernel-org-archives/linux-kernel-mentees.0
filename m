Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69D374EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTjWfSjB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4528B833C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4528B833C6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XTjWfSjB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbeYmDXf9Dim
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 21:22:12 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8E628833A8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E628833A8
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6bcef66f9caso300034b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 13:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699564932; x=1700169732; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsvShR7q5/4puO4BbnmQ13+xfWAhOYuyw8hfh0n1j6s=;
        b=XTjWfSjBr551MtLmhZB1Uvty9D3bb+YS7GNgPh2dKy0WK3NVCuz5pYl3yYj8zWTf5e
         6PlaY0sqCsaBniFGd4HXCqdyx1ZXAFeMAFygOvKLq8WG3KRhK0wsKVi2YJayh68IDxl4
         94zeUWLeAcWUZBClijFcKZWd6hXGvYeKkOl1wGEtbx5TYmezef26fz7mT332r2fKW6II
         j6RbpJOFQm0xAUbr8c9ZocARXJROWEBblar/oNu/w9Hs6a7k5RdDkEijl/OzfYhg3G9f
         R+ck9/3o4Ora4NVL94F3oBSgOV/cbAiIlzdBdWK3iArHUD7UN4tmXTod8yNORvEActK1
         xi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699564932; x=1700169732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsvShR7q5/4puO4BbnmQ13+xfWAhOYuyw8hfh0n1j6s=;
        b=BErsTZnYmw/n/6rS/ws5Mm90ABV5nFPmoD3k5gId7H76rZNcs/y6mN4xBLhYQdzUQl
         Z/MezHDnpilaKbnSZdXWeeTf5soCgfsYtRaP8SrCAZ1axWtwaans4LO1T3kUpL9mCTF3
         oWFh1Z4Pe8f7+S2xfNsmOwVMKEgtWMCcPliRw44+BmevO0NFaOQL3gDNt1oRgs8sRajk
         aB5nTQgseVGCdO7cfbmtQMpL35x3w/PvAxaiUqvbXWEYVK9kg3vegNPZNJOI+16qCMdz
         IzVrkl0p/YzQFZzAhqq6qQtk09JVtYJBLjU/3uRKjI7BfbekBITpwJ1gTS5oq+3i/rNL
         npkQ==
X-Gm-Message-State: AOJu0Yx389w4sxHuvIdfkAxxzTyE85XK3ceD7bH9+Q/sjxJVnYCaBZmG
	LXJy028RHyH8ipNefVY68so=
X-Google-Smtp-Source: AGHT+IHvE/Tj6YL2R7oWzgCsSiWW0ZECdbesF+CSMBXb/FGlg4VeXbmCo+Mt4qdyXbf+h2M2Oz76IQ==
X-Received: by 2002:a05:6a21:3293:b0:16c:b514:a4bc with SMTP id yt19-20020a056a21329300b0016cb514a4bcmr6964603pzb.4.1699564931925;
        Thu, 09 Nov 2023 13:22:11 -0800 (PST)
Received: from abhinav.. ([2402:3a80:196c:ea3:aee5:8832:917a:55b9])
        by smtp.gmail.com with ESMTPSA id bk11-20020a17090b080b00b002807ec010e3sm249653pjb.48.2023.11.09.13.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 13:22:11 -0800 (PST)
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
Subject: [PATCH] driver : edac : Fix warning using plain integer as NULL
Date: Fri, 10 Nov 2023 02:51:57 +0530
Message-Id: <20231109212157.1454726-1-singhabhinav9051571833@gmail.com>
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


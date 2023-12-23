Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC228F5B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbnRu80F"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352B942207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 09:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352B942207
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nbnRu80F
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1MmUjpOJYwZ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 09:15:31 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 678F942201
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 09:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678F942201
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35fe8a4b311so3361775ab.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703322930; x=1703927730; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqU4At89cLX9pipG5dJk4yhFSAyDFeGlPgFtPpbBGJM=;
        b=nbnRu80FNz+rvErIR8r10JuUJDqJX8mbS7Y3vjkZQRKbBpUEoPHEa1prKItNZ+RAcP
         7hx+M7uSjwL6LsazTCp/cIvA1jzvla5hNZfBd8Dt4yREM13ZgNIjz0wz31OX/+7MCHwa
         ojBKH+1w2ebhurDpEEkKk8nVDqrasha7FTFyT5bIdbyFCGhEJ6fybB1LB6SGQrFN1fnu
         cl3vbZXaHiRlk4YMEZRA9xGYPx/yNODcH6VE0bnoJSfxst2uwegKERLRofjxh/YZ6cCg
         bh/FfmohMYZINqM51hNvZSbSBP0DS+9NoDrgAAUo+AVwK0QZcJxhZ26sL/C8Bs4Rfv0R
         AYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703322930; x=1703927730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqU4At89cLX9pipG5dJk4yhFSAyDFeGlPgFtPpbBGJM=;
        b=Ml2CS0nVSvQsaBvKJkad0GgtBzj7eqEVltEtDq+OPaInjkHR+eO89KFV8gwlZBWz5v
         ka33I81C5eQ8vnpd/DiUQhYbKWewr3bJ41oztSo5P2wvGxTKBrwc+nDJn+VNoYjvaKJU
         1DeUgshaEqFPUDIswjU+AYs56kFTFqaEFBkiMcA76PrsSDZMRMbja8GoAYx13LB7rfBo
         A6An61yUoubr2Hc8rGi4n+wWydRE/RUfu1kRR5pOcKyiCfYHqqz/+Isiuv8JWaiI6ule
         NKWGNduNIW5N0etsuiVGwy7LFPxyurstt6Ng2rfmE59xzUP3olY7qWxLQjj+GYNNAPXG
         NY4A==
X-Gm-Message-State: AOJu0YxrtoAc0GyqGkKm7yzPpwO+2TL90XdgzH9v+wedW9xZIrbcnYh5
	Nao4dSIGXhg2uu0Z3KCrN7w=
X-Google-Smtp-Source: AGHT+IGYqnq6An6iJM9CoXnlhddaGq6k5UXUB0u+ZIzGyEqqwpf89ybQ9Sp/R+KHDStSKxfSMQIumQ==
X-Received: by 2002:a05:6e02:1be5:b0:35d:59a2:1281 with SMTP id y5-20020a056e021be500b0035d59a21281mr3730843ilv.45.1703322930322;
        Sat, 23 Dec 2023 01:15:30 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001d365153d09sm4711179pld.184.2023.12.23.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 01:15:29 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/binary/src: Fix spelling mistake in binary.c
Date: Sat, 23 Dec 2023 15:00:21 +0545
Message-Id: <20231223091521.85467-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in runtime/binary/src as below:

'''
./runtime/binary/src/binary.c:537: spcification ==> specification
'''
This patch fixes thisspelling mistake.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 0f3729e55e14..130662f8e768 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -534,7 +534,7 @@ ia_css_binary_uninit(void) {
 static int
 binary_grid_deci_factor_log2(int width, int height)
 {
-	/* 3A/Shading decimation factor spcification (at August 2008)
+	/* 3A/Shading decimation factor specification (at August 2008)
 	 * ------------------------------------------------------------------
 	 * [Image Width (BQ)] [Decimation Factor (BQ)] [Resulting grid cells]
 	 * 1280 ?c             32                       40 ?c
-- 
2.39.2 (Apple Git-143)


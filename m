Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552E446B83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GibRfANS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE0E640260
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 16:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE0E640260
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GibRfANS
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LZEg3DtZ2oC
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 17 Dec 2023 16:55:19 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F40FE4025D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 16:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40FE4025D
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6d5af8674d5so133582b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 08:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702832118; x=1703436918; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKsWRncfuCPQDnZgbnpk1pj6VXWzGGiRXpku/betyaY=;
        b=GibRfANSSxzfJQ380OvjSfmh2mvAAZ3DpQE623g59HT3OSsgtxEJLuie4her3YSQLx
         a4k26/SyNcTG+i2EwVxg/6Jm7HH9q3+UaGpdSMYWrsi2epa1T1g0HQFhDE6rwFJnzt71
         S8lUfVGIBAJMyW0/T7GDv/xg6MAluV7GBVeyuZIBI8gB67cJWg2bqq97IjwaAv/togxB
         w7N9TvesK2HcD5BT2qp2eT3qt7ZzOGgyS3OU0jCLmXjxK1p0x/tg6lCEIGIi2kiKUtxh
         rf9T0vQ8eb7aw32Gbk1ABY3bI2odUrrKZ3acVBpPHM+2FiFVhxIDzVADsvrDyGiuxsdb
         xfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702832118; x=1703436918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKsWRncfuCPQDnZgbnpk1pj6VXWzGGiRXpku/betyaY=;
        b=rPwOhZXjWjvbVQyrPsgjJ4oEJr5hoxB5+rzMsyeajars9uzHagDL60cYIjs6SXImN6
         yNPQrVxxwsT8VFWICtxz3ML1Mm/1g7Se/w9GGkt5ExefWBgFMqm9ld/n2QTyvNew4FcL
         4myJO/Mmnf63CkEFIzOqAw9Wsg+0DOI3IVW3vgql27KePgtq1HuX20xJ8PyEjAAH4UVy
         BKhC0uoSXH+piyy9UaJ7nTs4Q1sxMKrKnVLZSJYBYIPlV/40hhbZiSMxcwoGRMU0hGE4
         SOdViLY61wZgN2xjD9hycvrsLrJneh/KXuWSzSco4MSDUZ1kXWUUI6nfU0HAgmqR+2oS
         1gyQ==
X-Gm-Message-State: AOJu0Yw/VvE2FNKkiB73lC68IQK/KlI37qIiQcZPA78aI45oBgXrs1Cz
	MlXLSq6gMyn9m0NZBR2Cyw8=
X-Google-Smtp-Source: AGHT+IElv+rw7sIJijJRD+OdyZtfVrQkm1+LOYAXSc4i+0RHL3+E7jluDilGz3cyuXwh9uqgyEvdkQ==
X-Received: by 2002:a17:90a:1c09:b0:28b:2219:e78f with SMTP id s9-20020a17090a1c0900b0028b2219e78fmr1758461pjs.78.1702832118124;
        Sun, 17 Dec 2023 08:55:18 -0800 (PST)
Received: from ubuntu.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id pb7-20020a17090b3c0700b0028aea6c24bcsm4705292pjb.53.2023.12.17.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 08:55:17 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: rtl8712: Fixes spelling mistake in rtl871x_mp_phy_regdef.h
Date: Sun, 17 Dec 2023 16:54:43 +0000
Message-Id: <20231217165444.448133-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported spelling error 
in rtl871x_mp_phy_regdef.h as below:

'''
WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
#129:
#define rFPGA0_XA_LSSIReadBack          0x8a0   /* Tranceiver LSSI Readback */
                                                   ^^^^^^^^^^
'''

This patch corrects a spelling error,
changing "Tranceiver" to "Transceiver."

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h b/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
index a08c5d2f59e3..bb9f83d58225 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
+++ b/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
@@ -126,7 +126,7 @@
 #define	rFPGA0_AnalogParameter3		0x888	/* Useless now */
 #define	rFPGA0_AnalogParameter4		0x88c
 
-#define	rFPGA0_XA_LSSIReadBack		0x8a0	/* Tranceiver LSSI Readback */
+#define	rFPGA0_XA_LSSIReadBack		0x8a0	/* Transceiver LSSI Readback */
 #define	rFPGA0_XB_LSSIReadBack		0x8a4
 #define	rFPGA0_XC_LSSIReadBack		0x8a8
 #define	rFPGA0_XD_LSSIReadBack		0x8ac
-- 
2.34.1


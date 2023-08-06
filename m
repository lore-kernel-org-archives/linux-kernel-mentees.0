Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD29DC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AB5760EF1;
	Sun,  6 Aug 2023 13:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AB5760EF1
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KJNEXom/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIT-npRqLWHe; Sun,  6 Aug 2023 13:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3FBB760E15;
	Sun,  6 Aug 2023 13:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FBB760E15
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13221C0072;
	Sun,  6 Aug 2023 13:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7A4CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7AC34035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7AC34035E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KJNEXom/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJjen2dwbzJ4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:05:25 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF01040457
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF01040457
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bbbbb77b38so22209665ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691327124; x=1691931924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EvTReqZSJkc02HzacPqVscfNFgT5VLe0HhEZsYvR07E=;
 b=KJNEXom/9DpXIOQPuYilti5TYkD4xBePA3M3UWwHcxKjv+F8d0HKbmOSZMlkwzivjr
 4sUYrFh5jJgrhwCiqHcWtg0ZScaWbN9MfKDlBnweW5eLD30bQtkSVsKVpE457DXO/i1m
 pBJSyNaQmkoXvcqAIU4bcfQfCcbCH/apRco5xQ4qArA4vSu1r+7NG8VH1P963qm2Alql
 +abm0bLXnsM9LjOu0X/ZYzGiU1bmHSzZnhc4gDpha+cpl1W6YX/CTwNRF3uwDrMmaBTL
 QIq4jwe27p1DPSA5gDS1ElO+RyFaKjEqpoR7pE/q3dFv9tCRhrJX9jgdUTMAO+Xfudys
 nldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691327124; x=1691931924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EvTReqZSJkc02HzacPqVscfNFgT5VLe0HhEZsYvR07E=;
 b=O/O2pRbFifP3SHB9pz24Aczit4zW/frj9b6LnkYC3SggLeytp9yPh95wWhafUINYMJ
 MXF8T3lHvRXUH8UBa5vELayTrFMJ4ixkk9OUVvOUyShrZsXpJvWsKon9iFCdt9awcJ6C
 snB6X7N3mz2Wq/byboo5FumEyeUTVMeC/JYpQnRM30QJSZgIFCOCw/1RRQCul5f7lIUZ
 bcNGksXCLxQ7tIW+h5fJAHGA4/qKS5ln9FkqKaPBCC5ElGgWn7ATv2wVCy5XOHgc9SkD
 1eY3yShgQ1Rg5hhRgvfnKchHzpIL7+TquSRlQGyAQfabZEEsND07xerZPzyan0GwZDTa
 F8IQ==
X-Gm-Message-State: AOJu0Yw3MPHx/BzrIynln8J0B+CsM34KNsj4Mofu3Xv0HoG+6Sji4VQX
 Dvm2zsBx0NTVa1/0hAJalFM=
X-Google-Smtp-Source: AGHT+IGz61GEXpe5dVF3GTw1ZmWbo2a6fJ2/cStkVKPUCxobTRaLVTD9qceSLuAB+BTCdMCbnfaSfQ==
X-Received: by 2002:a17:902:c20c:b0:1b8:a277:4b5b with SMTP id
 12-20020a170902c20c00b001b8a2774b5bmr5484026pll.7.1691327124306; 
 Sun, 06 Aug 2023 06:05:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:3a2a:ee75:10eb:7534])
 by smtp.gmail.com with ESMTPSA id
 jd9-20020a170903260900b001bb54abfc07sm4886383plb.252.2023.08.06.06.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 06:05:23 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: shubhrajyoti.datta@amd.com, sai.krishna.potthuri@amd.com,
 james.morse@arm.com, mchehab@kernel.org, rric@kernel.org, bp@alien8.de,
 tony.luck@intel.com, michal.simek@amd.com
Subject: [PATCH v1] drivers: edac: zynqmp_edac: Updates return value check
Date: Sun,  6 Aug 2023 18:35:14 +0530
Message-Id: <20230806130514.159102-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-edac@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Updating the check of return value from edac_debugfs_create_dir
to use IS_ERR.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 drivers/edac/zynqmp_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
index ac7d1e0b324c..cefbbafb945e 100644
--- a/drivers/edac/zynqmp_edac.c
+++ b/drivers/edac/zynqmp_edac.c
@@ -351,7 +351,7 @@ static void setup_debugfs(struct edac_device_ctl_info *edac_dev)
 	struct edac_priv *priv = edac_dev->pvt_info;
 
 	priv->debugfs_dir = edac_debugfs_create_dir("ocm");
-	if (!priv->debugfs_dir)
+	if (IS_ERR(priv->debugfs_dir))
 		return;
 
 	edac_debugfs_create_x32("inject_fault_count", 0644, priv->debugfs_dir,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

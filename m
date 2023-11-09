Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4538DEE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEsuZfkl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF73614BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDF73614BA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TEsuZfkl
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2PYZQW8dX6m
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 21:51:05 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3A28B614A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 21:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A28B614A3
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6bf20d466cdso302827b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 13:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699566664; x=1700171464; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L3szXkniAOBIgjKGY87jgy200/6D2pD1Gf60eUObSNU=;
        b=TEsuZfkl5gYr9hnR9ZrZHiwv1+YgR7joCoN3/47wL+/oxMjx/73y3KJrOjfypwPljN
         cDQzUyqKfV4VjmSEhBJYx/P2Z3MSQ9feBupX7DJFU8mXUogI2Qx2V1bG8YbaRyOSuP29
         tR1jUWcp4xWBwl3eH7NUjUu3vgs3FTedNvpiXTf9CLa6EaPAm43yqiwXSdYM+1iqkTfY
         dchCpWeRwkj1+QK1WYW/WibTG1JI7Jp5fKVUfxOafs/5KKe4zM52vPHZ7NEhYbQ3pdp8
         lTieRy+ECcfKCgR00Noequ30f7kAo6x1X/Xa95aEfHCBquAtlYNxK+Hz3H4g00pOVCMp
         /VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699566664; x=1700171464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3szXkniAOBIgjKGY87jgy200/6D2pD1Gf60eUObSNU=;
        b=cgG0iu0/gum9EC2gnpzZyOHgJC8HLzR5Zv+ao1GcFYAFh6LlE9Ktn9q3kul53EGP8T
         VHczn205dCblNUqgzJxAI2NjH7GDSMC2FEoCtNKwSrVfxFbfMjtqsXA8Au3M3dMeH40+
         8yadd2mjXzcdhOlrOT4Dl0jgtTVYTEPV3d8yKZ2qhS6NrJcSq10QGIiXDd+K2Lk48XNO
         BN3POf+kwf3N3EUtyiFkFK1MFQoatQgzZ8UF7Qgz0D0+ihxicqiBCI2ewC20LmY7q8X2
         AGFcQCenOhsllSPlQNsJZzZakE1aOazLThfg7FHJ1EqrBvtAC8yoHJz15Bh4EBfBtrIK
         V9cA==
X-Gm-Message-State: AOJu0YxkpgAnqT6noPpi40nrveNMizdHa4N2YWrw/1CP9MncER1eHoWu
	QTIAkRX8EtjwEVMmFVrZ8WwxR1FGUs+Lwg==
X-Google-Smtp-Source: AGHT+IEd0buHmeHhN+KsS1tLtsAX++VUah6xMKe0RHbXybUhB6qDxOkFThOVGQgMY3hx2V0ze4Bgpw==
X-Received: by 2002:a05:6a21:7892:b0:163:57ba:2ad4 with SMTP id bf18-20020a056a21789200b0016357ba2ad4mr7216517pzc.2.1699566664076;
        Thu, 09 Nov 2023 13:51:04 -0800 (PST)
Received: from abhinav.. ([2402:3a80:196c:ea3:dae1:648f:ab89:4dd0])
        by smtp.gmail.com with ESMTPSA id x20-20020aa784d4000000b006bb5ff51177sm11214827pfn.194.2023.11.09.13.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 13:51:03 -0800 (PST)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: oliver@neukum.org,
	aliakc@web.de,
	lenehan@twibble.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: [PATCH] driver: scsi: Fix warning using plain integer as NULL
Date: Fri, 10 Nov 2023 03:20:49 +0530
Message-Id: <20231109215049.1466431-1-singhabhinav9051571833@gmail.com>
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
 drivers/scsi/dc395x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index c8e86f8a631e..d108a86e196e 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -1366,7 +1366,7 @@ static u8 start_scsi(struct AdapterCtlBlk* acb, struct DeviceCtlBlk* dcb,
 			"command while another command (0x%p) is active.",
 			srb->cmd,
 			acb->active_dcb->active_srb ?
-			    acb->active_dcb->active_srb->cmd : 0);
+			    acb->active_dcb->active_srb->cmd : NULL);
 		return 1;
 	}
 	if (DC395x_read16(acb, TRM_S1040_SCSI_STATUS) & SCSIINTERRUPT) {
-- 
2.39.2


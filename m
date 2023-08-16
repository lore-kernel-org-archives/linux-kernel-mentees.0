Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EEAC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 08:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4320340193;
	Wed, 16 Aug 2023 08:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4320340193
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EXuOgcs5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcOZ9KpsM_5A; Wed, 16 Aug 2023 08:50:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 42B94403C7;
	Wed, 16 Aug 2023 08:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B94403C7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10B5AC0071;
	Wed, 16 Aug 2023 08:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DED6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 08:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 465B241F77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 08:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 465B241F77
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EXuOgcs5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3xWmvjdmu6K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 08:50:15 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FA7741F75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 08:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA7741F75
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6887bc25e6bso544283b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692175815; x=1692780615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3eRsINPgpxkvQxXZIsw3b1mbCLVjAw0qj7X5Yoa2AdQ=;
 b=EXuOgcs5leGr6lrNtouluD66V/+g+wcjBC8VncFDX/z5oSxbNv8lniPRWgcIkIU517
 kvY+gOuyUDYz4FHfXQjNnB2cn/1wibvt3Ofh80i8/X8O2o4B6pH/cYaLPWV1gOHVKBSs
 mMLPvEPtnNrxskvrQxm3MyjqQ2irEf4xYQKipJfWHj8FrgiwJ3OacVkezSC2BTtLA3PG
 +dcxy9sh/sTk6FPldqdXkAWheOLRAF6WO7eVV2EoVIyYBKTCaMRx1aVGyKDzBe+5aMvX
 +5K2JkAmIeeEclgzYDSxrLEM3hPxXHvPgyHK7ebXfDRcd+br+o33G+k0TK52Ts8PWQoY
 gR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692175815; x=1692780615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3eRsINPgpxkvQxXZIsw3b1mbCLVjAw0qj7X5Yoa2AdQ=;
 b=cgVWG4ssDEO60moqTu5JJ2YxE8ib+W9aekzX4hzUU5YzoEBoWqmLsVeiUZ8z1re8PL
 gR9/MN9VEjB0n1GdboKpM0GKaLOH+UPyqHBNR5mqLINKZV3QF5vhG22taVcGyI4rUyGm
 J3U5925gd5IeKs5DLnCS18QGuPFOAVzfXFuemcjJ9e2uqVNEgMk+jaXl14USLw42ooNG
 J00QGzW4FQGSZ/hSOLdcKNwamYy4NcKl4Snvh9oxCkGznDp5qS72fgO8G/fnL02Dxz4R
 WRaqiSmC1Kf7trUOisS+EBWMcSybujxlQh8y4IlOGAtkeWf+iwmGJObP3wdIv20yg+A0
 V8jA==
X-Gm-Message-State: AOJu0Yx4iSMDbqH4XHiX+KIaUaIgcl5945bD9qrtBIQwwXY791nL82kY
 nodMhTwnNxu5cHDUMWvKThI=
X-Google-Smtp-Source: AGHT+IEwBVEqGJfVVew3i80dbzb/4zO2dSuu0e4uG1Qf05xeb9utK3KlIXl5ZZBY604UBE7xJajVjw==
X-Received: by 2002:a05:6a20:734b:b0:137:8599:691e with SMTP id
 v11-20020a056a20734b00b001378599691emr1563784pzc.49.1692175814754; 
 Wed, 16 Aug 2023 01:50:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:40c2:100b:771e:e5ae:d854:9f75:d38f])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78008000000b00682669dc19bsm10529706pfi.201.2023.08.16.01.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 01:50:14 -0700 (PDT)
From: coolrrsh@gmail.com
To: james.smart@broadcom.com, ram.vegesna@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, rdunlap@infradead.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: sli4: Remove code duplication
Date: Wed, 16 Aug 2023 14:20:07 +0530
Message-Id: <20230816085007.10591-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions 
evaluates the same expression and gives same output. So removing the redundant 
code duplication to optimise the code.

This fixes warning such as:
drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible condition with no effect (if == else)

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/scsi/elx/libefc_sli/sli4.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/libefc_sli/sli4.c
index 8f96049f62dd..5e7fb110bc3f 100644
--- a/drivers/scsi/elx/libefc_sli/sli4.c
+++ b/drivers/scsi/elx/libefc_sli/sli4.c
@@ -2317,12 +2317,8 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *buf,
 		SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
 		bls->context_tag = cpu_to_le16(params->vpi);
 
-		if (params->s_id != U32_MAX)
-			bls->local_n_port_id_dword |=
-				cpu_to_le32(params->s_id & 0x00ffffff);
-		else
-			bls->local_n_port_id_dword |=
-				cpu_to_le32(params->s_id & 0x00ffffff);
+		bls->local_n_port_id_dword |=
+			cpu_to_le32(params->s_id & 0x00ffffff);
 
 		dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
 			       (params->d_id & SLI4_BLS_RSP_RID);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

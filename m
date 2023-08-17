Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB3EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 11:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C974E83EAD;
	Thu, 17 Aug 2023 11:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C974E83EAD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PsO2n5E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4sZ7Qa9ac4X; Thu, 17 Aug 2023 11:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C07B183EAB;
	Thu, 17 Aug 2023 11:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C07B183EAB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94DB1C0071;
	Thu, 17 Aug 2023 11:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC79CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F8A614EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F8A614EE
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PsO2n5E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SbWMT7H3lcv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:43:09 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 106E9614EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 106E9614EA
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso49118375ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692272588; x=1692877388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=45rLKFe/XGdWEKHKL/OvhqCh4xyXYRWTSCuP5teWtaA=;
 b=PsO2n5E3s0Nq8bo5r7Wbpoo97Bw4xVKOmW9g+n/5j1f96rtp8ah+m0dGMPO0tzt3d8
 WlyrW7jIxqqObwuKgO3Dy4mkQD+I4n091NzGIMmRqvRzewT1XDngW+7abAvyjbI0yKdu
 amyTa9kr/u50Vi8Zsiw6FnqmHZ1Uc6AEAzAZvsjqE/Qr9FU/7HMbWQS1Jj6TOck4/VD/
 BgZBIN4KI0VYY0m38b6WnMi6mbODbZ5tmdcV+3DfUswxbDIo2kDiTWrBK14IPCI9HmEO
 Am+L6pX/vxkCL0Gri+6eB2jFJYAUlhJQz9hQhqkmY+0qqJnZ4TRUVErPuQ4n21cahIZx
 aniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692272588; x=1692877388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=45rLKFe/XGdWEKHKL/OvhqCh4xyXYRWTSCuP5teWtaA=;
 b=dd43h+J7JdLex/D/BKHoBvflhYB/PWiy/Dp1UOe8sjsBVdFpxgpVLcHvB2L6D3Jl4s
 UAgJIlrfC75kTkIB0FKyHg4vxwDlBJSmxZs11PPQC6LVlVxHUU3lY2Qek5j0ydlUWA1y
 AcXjuHKmKHv08S98DE/HLBJtrO5dnnUlbZb+ZP81R1cncZOcyjmrd6A2jZQJKsviwqgD
 R8bsLFLkv5ybyKTjGusRsstZQEaFJrEo4+SOnWk5HCag6fCOaKLks1ftRaiOLt14txxp
 lgjIGaYFLuiXKezc/3IwwBvxLKSxyl4TV3O/wCcXmsr7EnsM0GgDggbvDWWKhdNGh+G3
 3WrQ==
X-Gm-Message-State: AOJu0YzslnDG9xFMKppyn2jmOLZtGFOXWqwGL8Agwkzad4DJftAGHfli
 MolNYKZCnxkAOpe1BWPcBB4=
X-Google-Smtp-Source: AGHT+IEW0RBHUjzorOFWrjg2otfzDibWdKDDtxIBhh0+8BxwA+o0wRWvCn53MdbaZnI7SyLeOBTsAg==
X-Received: by 2002:a17:902:db0e:b0:1bb:25bd:d091 with SMTP id
 m14-20020a170902db0e00b001bb25bdd091mr4862224plx.30.1692272588373; 
 Thu, 17 Aug 2023 04:43:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1016:aeca:454:68e4:51c8:d1cf])
 by smtp.gmail.com with ESMTPSA id
 iw12-20020a170903044c00b001bb9d6b1baasm14951767plb.198.2023.08.17.04.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 04:43:07 -0700 (PDT)
From: coolrrsh@gmail.com
To: james.smart@broadcom.com, ram.vegesna@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, rdunlap@infradead.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] scsi: sli4: Remove code duplication
Date: Thu, 17 Aug 2023 17:13:01 +0530
Message-Id: <20230817114301.17601-1-coolrrsh@gmail.com>
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
evaluates the same expression and gives same output. Also, params->s_id
shall not be equal to U32_MAX. Therefore removing the unused code.

This fixes coccinelle warning such as:
drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
condition with no effect (if == else)

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
v1->v2
Modified patch and the corrected the warnings using checkpatch.
v2->v3
Modified patch details keeping HW descriptor variable.

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

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9137C2FC14
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 10:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742B483CD3;
	Thu, 17 Aug 2023 10:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742B483CD3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OMZXTeKw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdSyBX8sznTK; Thu, 17 Aug 2023 10:38:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6CB6981EEE;
	Thu, 17 Aug 2023 10:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB6981EEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 483C2C0039;
	Thu, 17 Aug 2023 10:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18E44C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4E6442238
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E6442238
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OMZXTeKw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VxcHh_yfqkC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:37:59 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F4BC42161
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4BC42161
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bf078d5fb7so8308405ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 03:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692268678; x=1692873478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e8u6STTTo0IQbi3lQd+vgtiTbyFEHsVCA7HA0UeiZdw=;
 b=OMZXTeKwtW1HkrTRzX9/ceRnBHtM5YJ6w2M3N4KNUttvLDqZJeNUGjKnRFHkkkjJ7a
 4mWnKqvrd+W8U3GtAzJWdvpVjc/jxwVLPvnM2UjiYMXRfWk9T8va3JaUAvl1Cu/VJ6QH
 Qfgvuvrp7iWpEcCodll03rjut+S44okzhw/avRSBxNp2naDF46FNu6cXCLbD/XiJgFpl
 B+j4q4HhduNEz8/DyvzfsFD6xe8rM8WPhAH5j5djuIRt9J5E2dkDp8K9dK86MLjBmiN+
 E5/e2s0eeHTRVn4RrM5TKSp0YwTLkdYtZS7lJS0RDHSuJo52Gfp2IhpqjilIfrdpQfUK
 KVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692268678; x=1692873478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8u6STTTo0IQbi3lQd+vgtiTbyFEHsVCA7HA0UeiZdw=;
 b=KFmVfALv10d9Kwms+soxs1IDqR/yGqjpV3DnS4JPlbLjHpPeQFO7T5KUAdhqN4zjUO
 h3/r4PvCjPMTuw+R/bnAomVxd0iYAD3/8cOgt4bQnOEFHef3ppxcVGpo5lKUvdDGiSs7
 ogJr1XGsYYlXRwajIFpaUioYdRT+Xmg4nlEPM+W5myxit1aYRDt4w1YWGgHJTXe0LIOy
 DUt2A5st+5ie9h1l+pAU8E1qadrq7H0c+B8nxQOQgb7gIVZeglWjKGeVRntgXyFqClWU
 jUyZT+iydrimhs5CxNHsPzsFPS3EMcgU4/Mo8Q+/hG/LZR1heXQUJX0M2PBMfQZso14E
 cOpQ==
X-Gm-Message-State: AOJu0YxfrUoIf2N68qmOKSkrNMRr5uq34/291g9mOLq5VaIfJ3Q6b0KE
 1eLljxWJAVoSjQ0Msld6XrA=
X-Google-Smtp-Source: AGHT+IFpAGL5N3vaudEA7MH3XwrMMJeUBz6yL0NjKOczZnqyaaL5xXtsNl/eXPB/emWKCmX2nsxYvQ==
X-Received: by 2002:a17:902:cec5:b0:1bc:81f2:ddf0 with SMTP id
 d5-20020a170902cec500b001bc81f2ddf0mr5157403plg.67.1692268678398; 
 Thu, 17 Aug 2023 03:37:58 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1016:aeca:454:68e4:51c8:d1cf])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f7d100b001b87d3e845bsm14963467plw.149.2023.08.17.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 03:37:58 -0700 (PDT)
From: coolrrsh@gmail.com
To: james.smart@broadcom.com, ram.vegesna@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, rdunlap@infradead.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] scsi: sli4: Remove the buggy code
Date: Thu, 17 Aug 2023 16:07:51 +0530
Message-Id: <20230817103751.16350-1-coolrrsh@gmail.com>
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
evaluates the same expression and gives same output. Also the variable
bls->local_n_port_id_dword is not used anywhere. Therefore removing the 
redundant code.

This fixes coccinelle warning such as:
drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
condition with no effect (if == else)

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
v1->v2
Modified patch and verified with checkpatch.pl.

---
 drivers/scsi/elx/libefc_sli/sli4.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/libefc_sli/sli4.c
index 8f96049f62dd..af661b769464 100644
--- a/drivers/scsi/elx/libefc_sli/sli4.c
+++ b/drivers/scsi/elx/libefc_sli/sli4.c
@@ -2317,13 +2317,6 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *buf,
 		SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
 		bls->context_tag = cpu_to_le16(params->vpi);
 
-		if (params->s_id != U32_MAX)
-			bls->local_n_port_id_dword |=
-				cpu_to_le32(params->s_id & 0x00ffffff);
-		else
-			bls->local_n_port_id_dword |=
-				cpu_to_le32(params->s_id & 0x00ffffff);
-
 		dw_ridflags = (dw_ridflags & ~SLI4_BLS_RSP_RID) |
 			       (params->d_id & SLI4_BLS_RSP_RID);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

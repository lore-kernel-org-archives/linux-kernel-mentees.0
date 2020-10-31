Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA104C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F85C20702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ0DfP3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F85C20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC4DC2E0EA;
	Sat, 31 Oct 2020 15:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfT2oobYFWbE; Sat, 31 Oct 2020 15:06:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C43102E0E5;
	Sat, 31 Oct 2020 15:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B40CAC0859;
	Sat, 31 Oct 2020 15:06:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F2EAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F24BC870A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yogFbmbJCL1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C3F5986B9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:04 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id w5so4147065qvn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 08:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9xs1oNvMMX6kSZRMG/5Ry3mal8f/IuqjXrtdUz49RA=;
 b=aZ0DfP3CqDR5TiCjp32FqF8eY05acVf9ArKmw7EW9jMJEf7LcI+m28oBMvVdMHY8aN
 LTmJ9QzFA/9pgZsQstltNh7eQPQfL/p9pFU5BCWR/asEtv/QU9mCITECUqIPUctExteg
 j7GSSVtIjNTBPlfRlZa4ULSEaVc6L0vayvJ5ey2rXEDnv8wrttgOscIQMmbtuSgzxXdM
 +BPak9f1/N49T0V0Zp3tNgReMevSWJAWQLtwXDN0HYFI+PxDk88C8ifE0iHX7KWBSVL3
 XL7akWK1JAxOpKF6t9pNjZCzCbcv0Mt/16UzNyBUUTL0JXClS3TBK0HMMUwolhXpvxrx
 feNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9xs1oNvMMX6kSZRMG/5Ry3mal8f/IuqjXrtdUz49RA=;
 b=PHhBgjmYMP0HEZQwAWpNyVqHkqpDVpq9SW+ckBMnBEMwPORKurE9ZZ3eMD/12JyhVB
 ZDccWJwhkgbmq+25WEuq33jENBmLbmviJtpE9VLn9CLHlCEvFLvAaRgcn+YG5bPSqtRd
 KTJZfxCKHX6mH9bR0VXqxfa/Y/MwfCtrA0P8r/a7lQzbVSWH4/pFc7Qm0I1bu7cBtAai
 f/+Jz8qUyigAIwCBippRXZKRUeAq456Ivtfpz9HHAkigOmxadbJXkPR9IRtRn1UVWrn8
 3gu/vWZ89aiYaGHZPAn/WLVzfTkhmLNMsdyPBqYbs0Rx79Ad9Au9DpzFTbB42wry/+9D
 zdWA==
X-Gm-Message-State: AOAM530Tj2Z0zcMfUE9tRlJxqNjSCEEbV5Gp6ofAADxaa2kUvtiNf5Jg
 TcmK9kfzD+Ot5OkxWCm6Q5w=
X-Google-Smtp-Source: ABdhPJyz2FgtBhzVYdk3HEUQI0hlZKrE6nWvqcC3vCiSJ5wqKBNnN9XJriLmgjpOiLKlKQOf98f2Og==
X-Received: by 2002:ad4:42ae:: with SMTP id e14mr13792036qvr.44.1604156763906; 
 Sat, 31 Oct 2020 08:06:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:06:03 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Sat, 31 Oct 2020 12:05:47 -0300
Message-Id: <20201031150552.663598-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/6] media: vidtv: extract the
	initial CRC value to into a #define
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

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

The same constant (0xffffffff) is used in three different functions.

Extract it into a #define to avoid repetition.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 82cf67dd27c0..f2e25e68c085 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -31,6 +31,7 @@
 
 #define CRC_SIZE_IN_BYTES 4
 #define MAX_VERSION_NUM 32
+#define INITIAL_CRC 0xffffffff
 
 static const u32 CRC_LUT[256] = {
 	/* from libdvbv5 */
@@ -784,7 +785,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 	const u16 pat_pid = VIDTV_PAT_PID;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_pat_program *p = args.pat->program;
 
@@ -974,7 +975,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 {
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
@@ -1124,7 +1125,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 nbytes  = 0;
 	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
 
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
 	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

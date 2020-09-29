Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EBCC4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6797216C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7Jb0pMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6797216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C03886FB7;
	Tue, 29 Sep 2020 03:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fnLWp8lHiRV; Tue, 29 Sep 2020 03:26:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE8CF86FAE;
	Tue, 29 Sep 2020 03:26:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFF39C0891;
	Tue, 29 Sep 2020 03:26:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93474C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8959A859BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLUQZGWIn0y5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 04B5C858C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:36 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id z18so1618473qvp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNL+JIXJEkaTd9PqUlCjJsAHaPEKb5MgmMlSqxfrt/Q=;
 b=d7Jb0pMRJ6Mu6/iNZqXuhoefJjUkSrhyahenPRxDqAO1HvA231sPyjNFpbsrvcumja
 zXJLlyfiDtGHJrHavukLFo/gBFQ5j1kj3djbs8JiwTo5HTYaIVs7RI8I5QTzoTBXvnNG
 BlaX9PclaaXrtKLNeSIhXBQO/7haT30eYJvAr9BxhvKUvUxJxO4dRgZVpQbC5Lae8mYL
 TUIhyG1BYI2zN67lgDbPmFmdBTJ7jdVze18P8vZE25HvwtCcwVkQZU4kL3PFxXzUupbQ
 r9wjpsLW+jTygNBiQbhXqwJOf502BwdCQv7YxsNVekPcJ1ghBiRRvXzvX7FgWI12ETpo
 jCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNL+JIXJEkaTd9PqUlCjJsAHaPEKb5MgmMlSqxfrt/Q=;
 b=gw+opNtp1eD3zA4Pd5TNTnxkseavmijMkICulgm6BjlZ16FzOZRVC0KUg+gq9p9RpN
 bTSl7FEIkHvmwaUYtNbM2gNl8wrokd6LBbh7ZgvRzX6NwVXAfo2nnGyUC1sfI/T4daLr
 X43fJ/P/yEHKEWnbRueS/uDb/95SNLooj2DO0X//uP+/FvXl7QEuNQEel32pNOrSTN/O
 VVGrnxFOAtl2+0BG6TvHvB7sCKapVikHUj8r6sGpbtmohuK6DuY6aE8SAWgm07ML2w2O
 bC7L0IvkamIgR8rOxCl0qVJMkCvhGZSKEzqm5miTiwJtGmLUtie/6pp2o97RyKBeReSm
 5JJA==
X-Gm-Message-State: AOAM533FgwJBqa9urMLtaCefUgDUzPm2Zgn7wBgtGKsqlaclU6VXzOIb
 SxYkDjZ2DnVPPb6q5cVUN60=
X-Google-Smtp-Source: ABdhPJwwB0/KE7j2Zf+eBeNKBpGgEmc3dFw3ABr7bF9Zbo9+hRwQ2Ouy9oGVxwsPFibQb3HFuccanQ==
X-Received: by 2002:a0c:a085:: with SMTP id c5mr2774834qva.30.1601349994899;
 Mon, 28 Sep 2020 20:26:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 20:26:34 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Tue, 29 Sep 2020 00:26:20 -0300
Message-Id: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH WIP 1/6] media: vidtv: extract the
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
index 3151b300a91b..a24e84adc8ce 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -30,6 +30,7 @@
 
 #define CRC_SIZE_IN_BYTES 4
 #define MAX_VERSION_NUM 32
+#define INITIAL_CRC 0xffffffff
 
 static const u32 CRC_LUT[256] = {
 	/* from libdvbv5 */
@@ -794,7 +795,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
 	const u16 pat_pid = VIDTV_PAT_PID;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_pat_program *p = args.pat->program;
 
@@ -990,7 +991,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 {
 	/* the number of bytes written by this function */
 	u32 nbytes = 0;
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
@@ -1143,7 +1144,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 nbytes  = 0;
 	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
 
-	u32 crc = 0xffffffff;
+	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
 	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

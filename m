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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66EDC56202
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F24120709
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqy0RFY/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F24120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 371212E0EA;
	Sat, 31 Oct 2020 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zpWBr+LGPl9R; Sat, 31 Oct 2020 15:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 187912E0E8;
	Sat, 31 Oct 2020 15:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 074E9C0859;
	Sat, 31 Oct 2020 15:06:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AD0CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 23EE387243
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qARdNMM+MIhl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7DADA87214
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:14 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x20so7701082qkn.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMq/fNztpvR6n0lvwq5zHAzZev9KmjvO/2C4S+XGV2g=;
 b=sqy0RFY/MfeOPhhl6rIR6CG+D4m0Tf72yTGfCX4LITFhoJygziZP1epGUEkiheK2Lg
 vGOwjCJDpjOCnsLzyCgaQh0dV3avfK8uS5/RN8OUhrHSVI+HzIyGamHvf7ErqiW5yb8F
 ldidCKKLd1nlawbCaVFBV0CUsf8Ju0EkZxhxZvAFyobhozjHmRVdNiRRh3Hr31Q9AIpu
 cDFD8nTZFHfXmnJTRLkJYRdKZeQ6b6ameR62Nap4v9/vPROYzLhQYShhq4wgWyxfofNT
 w+iaRK6Dsy5hHkLFCOO8g3HWvRbJqhCPBfFNmWMB1gESx+Wuv7DNPQ8Ce3bsWyVsTOC4
 6Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMq/fNztpvR6n0lvwq5zHAzZev9KmjvO/2C4S+XGV2g=;
 b=P3onusHaQLAePAyKMidhWb7GkKQJ+90kF1ODw9hFh5uleNJd9DzSZAr4wIoYLaaGmo
 9aR8iI1naUNN52jYLaNHpFroJFvLx9T5cxoJ5UkRcghtMamBvhfewMHki7JrIQfegntq
 77slk9bsr86QjOVfN7ca6YEaYtdRc9pN7FOEfGTR3nIghpWdTOdqectLwT+SADxm7zIg
 DfAPWO4GANIF7++6SeIIxs7H7V7lNOoj/xAjeogGgzwdcAOchGnTjzLDmhE/Eand326a
 jDWdaL3TaS7A50MNV8eyrcOGtgeALuoTGZ1CCOmk9njARdRKBVSIMUEuhyhqTro4N6yL
 g7/g==
X-Gm-Message-State: AOAM530ksUTunCgBOV85JupGVk5QV0j5fBuOA+3DBGWwsU4+bFMRJ0OD
 Ze+nVODm+kmOpLhj4rXJCjg=
X-Google-Smtp-Source: ABdhPJyjTFJT+02XBYj2Z0l4NloJ0n9c5KIdCYNieyDIhWSq8Dr6YTJWriFSPA4/GGI4cheUHRJTmA==
X-Received: by 2002:ae9:e856:: with SMTP id a83mr6639664qkg.142.1604156773609; 
 Sat, 31 Oct 2020 08:06:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:06:13 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Sat, 31 Oct 2020 12:05:50 -0300
Message-Id: <20201031150552.663598-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 4/6] media: vidtv: psi: extract
	descriptor chaining code into a helper
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

The code to append a descriptor to the end of a chain is repeated
throughout the psi generator code. Extract it into its own helper
function to avoid cluttering.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 49 ++++++--------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index b0b476545d65..ad2957efa483 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -314,6 +314,16 @@ static u32 table_section_crc32_write_into(struct crc32_write_args args)
 	return nbytes;
 }
 
+static void vidtv_psi_desc_chain(struct vidtv_psi_desc *head, struct vidtv_psi_desc *desc)
+{
+	if (head) {
+		while (head->next)
+			head = head->next;
+
+		head->next = desc;
+	}
+}
+
 struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc *head,
 							   enum service_type service_type,
 							   char *service_name,
@@ -345,12 +355,7 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
 	if (provider_name && provider_name_len)
 		desc->provider_name = kstrdup(provider_name, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -376,13 +381,7 @@ struct vidtv_psi_desc_registration
 		       additional_ident_info,
 		       additional_info_len);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -401,13 +400,7 @@ struct vidtv_psi_desc_network_name
 	if (network_name && network_name_len)
 		desc->network_name = kstrdup(network_name, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -445,13 +438,7 @@ struct vidtv_psi_desc_service_list
 	desc->length = length;
 	desc->service_list = head_e;
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
@@ -490,13 +477,7 @@ struct vidtv_psi_desc_short_event
 	if (text && text_len)
 		desc->text = kstrdup(text, GFP_KERNEL);
 
-	if (head) {
-		while (head->next)
-			head = head->next;
-
-		head->next = (struct vidtv_psi_desc *)desc;
-	}
-
+	vidtv_psi_desc_chain(head, (struct vidtv_psi_desc *)desc);
 	return desc;
 }
 
-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

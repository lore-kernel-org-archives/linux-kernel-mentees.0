Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D61AC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76D9216C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdTJ6jCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76D9216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 437ED86174;
	Tue, 29 Sep 2020 03:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id btef02qUoMJk; Tue, 29 Sep 2020 03:26:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53B378647A;
	Tue, 29 Sep 2020 03:26:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41368C1AD6;
	Tue, 29 Sep 2020 03:26:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50912C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D84985C28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wBB7lGMD3d1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1B7DB85A84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:46 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id ef16so1617735qvb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiV1cS73QXhrI6Mq3a3ZiuUNhTGoF/5ZbayW8PLZSuA=;
 b=DdTJ6jCqRsVuEG6o3lasj6+OpO0czSAC24H+xck9sse4NmWVHze3PdIm2yKQ0/iZEa
 7/GHDlr/6QS+1GKYqqAIkq9H13SuROOMWVW95M/OTov5XuL8ypsxpPlkzpis8e8hRNju
 OUJi5Iz2nw+nnkXPsXOI+x5HuprSWibwD3nge0G/Fk+Enoj93JdKWAmQrIxiuHYWrLAs
 eLlpnYDEvvgufSVCuJqnLmcNthyhwYaH8bJ5Fl33kvpqmLP8xD3A3fiFao8qqoTBr5vF
 qmHxJc4z3y+T6GARydERQ+G8MTvPycgab4Y9PPo+HWIc0BsPFQ/JNVj0CSAgZdvkaqwc
 9Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiV1cS73QXhrI6Mq3a3ZiuUNhTGoF/5ZbayW8PLZSuA=;
 b=Y3VAbBy53L+TeiTbZOvTmYGSYwliqEjFV6OvvAPVKXY1Rt7Yj3ob9Ag98r3UgWwMvj
 gh6vcYa/f8VPUQkOVP8Ff80Bmcmo8ZZOb6y6QAPIAf89QQc80GXQMlR+6aHXy2ufpuXK
 jVQO+DVAxqA+w578I3u/Jyt1Zpfa/oxgfFVvcEQtLCtaPPHHEuykwgBBQxAXruv+WzOv
 gjWie9bzwFsUIdLyoyJlRx85EPBdow9Fj5Ah/0dy69SxWiHRpNfYK9asCTdW0CeHVJro
 aoOXsfbgfPaXgJ2r/1IbxYn5p5Q5b4k8vdI26RyfLts/skRcmyRFX5iCPOXNBB/uM7XL
 OpFg==
X-Gm-Message-State: AOAM532Wv328vkary5qF2Q1YqIGlD62OjkMWaO2yz5X6Yrc244cIHjg/
 8vDk0HF4ZihRfmLqaZBe6TefQABwoevjGw==
X-Google-Smtp-Source: ABdhPJybOoebfnDtiJcEmvLo70f4GxWruP9r8sezS+3jZBt48XFNpkmd+kugfbihJrwkHZ74l9Ub/A==
X-Received: by 2002:a0c:aee0:: with SMTP id n32mr2698991qvd.7.1601350005118;
 Mon, 28 Sep 2020 20:26:45 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 20:26:44 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Tue, 29 Sep 2020 00:26:23 -0300
Message-Id: <20200929032625.1548909-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH WIP 4/6] media: vidtv: psi: extract
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
index e331fc7d8eef..2cf103057b19 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -313,6 +313,16 @@ static u32 table_section_crc32_write_into(struct crc32_write_args args)
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
@@ -346,12 +356,7 @@ struct vidtv_psi_desc_service *vidtv_psi_service_desc_init(struct vidtv_psi_desc
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
 
@@ -379,13 +384,7 @@ struct vidtv_psi_desc_registration
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
 
@@ -404,13 +403,7 @@ struct vidtv_psi_desc_network_name
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
 
@@ -448,13 +441,7 @@ struct vidtv_psi_desc_service_list
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
 
@@ -493,13 +480,7 @@ struct vidtv_psi_desc_short_event
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
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A75C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53B561184
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B53B561184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF5F61B7C;
	Mon,  4 Oct 2021 13:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3Frw-RwKwDZ; Mon,  4 Oct 2021 13:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C93F560609;
	Mon,  4 Oct 2021 13:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA0D2C0011;
	Mon,  4 Oct 2021 13:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA1CC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7242D84B47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cg5qgu1YotiQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E350784B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:47 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso45414pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=fWTORTQPU8zQx0fTickf1QWb8zSvKCJC9iMT0nF+cbY7ifH6UZBUFjBx+ekqHPTao0
 oOCuCk/G5yHAO9Gs3xoqHMtFHrAjyMJlxD8P4du5XDgdXFpYjGkqJmiUjR0L3Ha6m3Po
 FZU/E9sDpckZY2MPRYob36bDyQBEb/jam8meXQHTqbhp95pMfIpvgoaX/6r/sx0aUTyq
 O5xla6vl2UkRcpUinYFtux0SaRFgvgLClCuHxsFByvVkkMJd5N4qqXTxnE2EQ6wABe/q
 8ybUXu3452USf3wXIhY6OBOIjNqzlaOUmfRfkF841Kq+cKujfakiwtylB/Pyek9HCmwb
 yLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=b9TwmoQgyZ//CR93KT0GzWraHd6BFZAYVM7R/eJqgRic3fWYdjaHo1tnD6qvS86KVI
 POM2YAGMhe4Qg8TMe62mbJHkmmLMd0DVqFVQgfSSUPnfKM3LJ925sPJd4kHLNNa+yYnJ
 /qmRdW9ofHRWVcsT9cDbcaYSgPz/p+kgKRi+OgyfnJWH0Ju2MebM6Sa7ysSgS0H3apEz
 zGCYTDYGggXX6tjUOjuqDGLCKLZKRyWVhVJemiG7xY5/9eHyxG2YQhsIaOFgzQQDMXIH
 ZoYpxhSoeVqY7nS3eWXjKic5Hpx4k30dzzBMTW64bT+zvKYViAeTTvo7/96lAjPKnlAw
 Y9Wg==
X-Gm-Message-State: AOAM533XyxEnIM1InEF09XhUZVU0nV+OS71C8PaKNkTIxDOJteke4S83
 Clj9kpzLf/QrPW+oCxf9yJo=
X-Google-Smtp-Source: ABdhPJxx10R9wyzIvpYNiy7S0UB2Mcvw0yPJXJXTjXVhsjOsf5P+ExnKCZXIlghvhRuiDJmHz3+7YA==
X-Received: by 2002:a17:90a:af86:: with SMTP id
 w6mr31205496pjq.8.1633355627328; 
 Mon, 04 Oct 2021 06:53:47 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:46 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
Date: Mon,  4 Oct 2021 19:22:39 +0530
Message-Id: <71cec6aef2535b48911bd98bd010012643eb0bd0.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

dpc_process_error() clears both AER fatal and non fatal status
registers. Instead of clearing each status registers via a different
function call use pci_aer_clear_status().

This helps clean up the code a bit.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df3f3a10f8bc..faf4a1e77fab 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_status(pdev);
 	}
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

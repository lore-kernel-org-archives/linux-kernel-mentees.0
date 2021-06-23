Return-Path: <SRS0=L/ns=LR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB50C48BE5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9690861026
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Jun 2021 19:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9690861026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571AD83B95;
	Wed, 23 Jun 2021 19:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIDC6Q-tBnDA; Wed, 23 Jun 2021 19:14:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3FB83B7E;
	Wed, 23 Jun 2021 19:14:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63764C0010;
	Wed, 23 Jun 2021 19:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0DB2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A288683B8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrVonqoYZxRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F25B483B7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 19:14:32 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d16so5931096lfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jun 2021 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCA9UxJ+EMCBunFdIzfCgcc8cOVFYGFyGgIL+e4eYGc=;
 b=UzNhGzf3APIIvFvjJsrVV26jL1WdkAkoAwzH5J+sxCyYYAY8XvjzLBKarHlYSgEW+H
 ROakHkkCfn70i7JTu+yHbCUbnkuPf7TkqgAOUJt1d0Ms8qGccgWOFHX7YAWXLuxF4qZl
 U/XbtVMPj5nLRPkZKpRykEAA6jKBoO5kEXNfZAlVD+EWR1Led/Uz5YOVeudBbQyx3X57
 OurvlnmzdOoSny+LJAPPAbww4QTxM0W6d/VHRAR8uiuhK1xGiMG1A94AOKVZJSkD5qPj
 0bbbGsEAChYON9jaMET8xnLxvZDByABYXkAbL4e6Wq3VBH9HdfNQcUsTU0Os2aMchm45
 AXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCA9UxJ+EMCBunFdIzfCgcc8cOVFYGFyGgIL+e4eYGc=;
 b=aff0mj4pB0R606TmfBEwDHRaIzFkTtJCbHT6FFQagQJhLNNOyrMWlgDfzssXCdoblH
 xQLCg41VvJlhpYrHgNt5uHAv+4W2II34SXz+vPRFUzABHifdpMOUTOKXJuWYrvfLbVFA
 GqM7iqZ05cvPT2i6uoUoVgtbiPakaiea51ILUJ290SSeYkrphvzMRUBjeVH5IsWABTrs
 6C0UQk6pITm4l7hE6UIBnWbij2cienuMqlkz30xVwrIrqgbP17nrjWkS8nXfFEirWaeY
 CuVythxz4HYkRHzoEEY4j2eZVXoQJ4iiYYfjy3bGJ//0yAAtj4O1ttgQGPUdjgXQ50bO
 E3tw==
X-Gm-Message-State: AOAM532JrV6DzG9PLlMzMeFWWLwg+FwFYQTDBcDtGLXO3efRuNfDQKbb
 Zs22rHo8hNxDpf7s14hyupg=
X-Google-Smtp-Source: ABdhPJwEryE5nA4/ztCF+DQUY46j/ZZB0JCfX0QWNYwk/Gjoy0mw/XvPRg1ombAoJ9/Rq/4JX1XHwg==
X-Received: by 2002:a05:6512:b26:: with SMTP id
 w38mr859979lfu.227.1624475670940; 
 Wed, 23 Jun 2021 12:14:30 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id w4sm79724lfr.282.2021.06.23.12.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:14:30 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	chunkeey@gmail.com
Subject: [PATCH] net: ath10: add missing ret initialization
Date: Wed, 23 Jun 2021 22:14:26 +0300
Message-Id: <20210623191426.13648-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

In case of not supported chip the code jump
to the error handling path, but _ret_ will be set to 0.
Returning 0 from probe means, that ->probe() succeeded, but
it's not true when chip is not supported.

Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e7fde635e0ee..36ea8debd1c7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3697,11 +3697,15 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	}
 
 	bus_params.chip_id = ath10k_pci_soc_read32(ar, SOC_CHIP_ID_ADDRESS);
-	if (bus_params.chip_id == 0xffffffff)
+	if (bus_params.chip_id == 0xffffffff) {
+		ret = -ENODEV;
 		goto err_unsupported;
+	}
 
-	if (!ath10k_pci_chip_is_supported(pdev->device, bus_params.chip_id))
+	if (!ath10k_pci_chip_is_supported(pdev->device, bus_params.chip_id)) {
+		ret = -ENODEV;
 		goto err_free_irq;
+	}
 
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

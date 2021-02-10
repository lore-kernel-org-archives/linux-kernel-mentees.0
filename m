Return-Path: <SRS0=uyzn=HM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715B3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:04:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B0164DE1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Feb 2021 12:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B0164DE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FD6A872AA;
	Wed, 10 Feb 2021 12:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37LmmPnPEZ3M; Wed, 10 Feb 2021 12:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C21A887285;
	Wed, 10 Feb 2021 12:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDB46C0174;
	Wed, 10 Feb 2021 12:04:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 701C1C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B90684439
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0f_DyK2a_FyE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A20F0845DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 12:04:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h12so2201232wrw.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Feb 2021 04:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJ/fTja9mKD4KGroCmj04WxehP7kOKRd+7I/05Mbq4M=;
 b=eJNnrdbROY/AGjV55wNNaknvjSt8hJpicfMFtrcXgdTyFJmqpIaHusDBb6lLW31/CZ
 ZmxfvmYvy/ApYALBZnb4vj4x2QRgYoJXpl/v/cBecrscBqCs3RkqaM06Bqfvap61XIvk
 T8Ce8CL68S4E71Oi6EpucQ/oNuWHaeNJHzf7yzo+aZUOzIS2oYIujpS3u9TWHRKX3wtV
 ilh5fn9C40JBv1O7sklmbN5iRBTrvdoHAK5qSGvYuvr/avyhTXQ45hQevJXK5cJ8dEXi
 y3uweFvSazUr3ynpR6vPjAgNqpx+Un2eNco96FBxNTKmAMq1Xv6u7FkmDgsAt7ToOSPl
 8OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJ/fTja9mKD4KGroCmj04WxehP7kOKRd+7I/05Mbq4M=;
 b=jE3P2WTaGN8sGAtJL6s9cTsM0QdzOcXpWjzHSdvu0Yrm9w0YFj4JlhTDvUiHAjtaop
 0mYAxyYJr4IFyYV29lsJjJfNLYejCQJVU5xm9sGc5MmEQ1tuJTRxtSNkPNnS+kDc7Tmv
 DeYD91PKi8ijoJqKwMHSaY1SUOkS9YJ/eECwrK0Iuqt6/rkzlptrT0Xp1dcPTgdPj5cm
 TnsSe07K/2UWeXHvY5bGltXdBP29MOwoXSGCzUEvOyNLkPKEEuYESsCLvM4d8DTConTG
 pxVqNYu4Pqsx79Os72pG6VQqHpEmNKmcAErqCW0LMN+h1bdcIa41Ra1FJIc17TVwwQDu
 znzQ==
X-Gm-Message-State: AOAM530YUG07fYIJjr8EL5gdqfMGW/60jxGf5Jd+AilHwV7qkOra9sAs
 SNOR4QyO2btw1lZkLIL2UI8=
X-Google-Smtp-Source: ABdhPJwIkpRJMNidPY7E8t77YNkSjglI/0+vLjMQRtxMoAor2nPGNhM0AYpSxXSb6En7s3W2Jn8oGA==
X-Received: by 2002:adf:97d3:: with SMTP id t19mr2308218wrb.164.1612958657043; 
 Wed, 10 Feb 2021 04:04:17 -0800 (PST)
Received: from xps.yggdrail ([2409:4072:301:1438:3689:6d67:ef18:b9a7])
 by smtp.gmail.com with ESMTPSA id f7sm2822529wre.78.2021.02.10.04.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 04:04:16 -0800 (PST)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 10 Feb 2021 17:33:48 +0530
Message-Id: <20210210120348.262328-1-aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] staging: ralink-gdma: Fix
	checkpatch.pl CHECK
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

Remove CHECK: Lines should not end with a '('

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---

 drivers/staging/ralink-gdma/ralink-gdma.c | 28 ++++++++++++-----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index 655df317d0ee..a11f915f3308 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -135,8 +135,7 @@ struct gdma_data {
 	int (*start_transfer)(struct gdma_dmaengine_chan *chan);
 };

-static struct gdma_dma_dev *gdma_dma_chan_get_dev(
-	struct gdma_dmaengine_chan *chan)
+static struct gdma_dma_dev *gdma_dma_chan_get_dev(struct gdma_dmaengine_chan *chan)
 {
 	return container_of(chan->vchan.chan.device, struct gdma_dma_dev,
 		ddev);
@@ -510,10 +509,11 @@ static void gdma_dma_issue_pending(struct dma_chan *c)
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 }

-static struct dma_async_tx_descriptor *gdma_dma_prep_slave_sg(
-		struct dma_chan *c, struct scatterlist *sgl,
-		unsigned int sg_len, enum dma_transfer_direction direction,
-		unsigned long flags, void *context)
+static struct dma_async_tx_descriptor
+	*gdma_dma_prep_slave_sg(struct dma_chan *c, struct scatterlist *sgl,
+				unsigned int sg_len,
+				enum dma_transfer_direction direction,
+				unsigned long flags, void *context)
 {
 	struct gdma_dmaengine_chan *chan = to_gdma_dma_chan(c);
 	struct gdma_dma_desc *desc;
@@ -558,9 +558,10 @@ static struct dma_async_tx_descriptor *gdma_dma_prep_slave_sg(
 	return NULL;
 }

-static struct dma_async_tx_descriptor *gdma_dma_prep_dma_memcpy(
-		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
-		size_t len, unsigned long flags)
+static struct dma_async_tx_descriptor
+	*gdma_dma_prep_dma_memcpy(struct dma_chan *c,
+				  dma_addr_t dest, dma_addr_t src,
+				  size_t len, unsigned long flags)
 {
 	struct gdma_dmaengine_chan *chan = to_gdma_dma_chan(c);
 	struct gdma_dma_desc *desc;
@@ -601,10 +602,11 @@ static struct dma_async_tx_descriptor *gdma_dma_prep_dma_memcpy(
 	return vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
 }

-static struct dma_async_tx_descriptor *gdma_dma_prep_dma_cyclic(
-	struct dma_chan *c, dma_addr_t buf_addr, size_t buf_len,
-	size_t period_len, enum dma_transfer_direction direction,
-	unsigned long flags)
+static struct dma_async_tx_descriptor
+	*gdma_dma_prep_dma_cyclic(struct dma_chan *c, dma_addr_t buf_addr,
+				  size_t buf_len, size_t period_len,
+				  enum dma_transfer_direction direction,
+				  unsigned long flags)
 {
 	struct gdma_dmaengine_chan *chan = to_gdma_dma_chan(c);
 	struct gdma_dma_desc *desc;
--
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

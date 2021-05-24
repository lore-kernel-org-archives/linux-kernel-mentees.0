Return-Path: <SRS0=DeHd=KT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA43C2B9F8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 15:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328836109E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 15:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328836109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D829A83547;
	Mon, 24 May 2021 15:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8N_oi9iB8DF; Mon, 24 May 2021 15:58:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD2F83530;
	Mon, 24 May 2021 15:58:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6ACB5C000E;
	Mon, 24 May 2021 15:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4173CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 15:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A5AE834EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 15:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqJisg4LhLES
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 15:58:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C61682EA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 15:58:04 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso11372264pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o82X5HgymL6cW4VbM9cJTzS1zYiyMTu5/WxGQrdHhxQ=;
 b=XVvCyvQjpE+djzLGq3lowirz+BlxEjm8ZcAH8BbWSQqbUXqwAPYVsgYnB19d3EgLRK
 GXEa+iQdiodDCwNGi5JYBvSAXeh50BuDrPJXV3dcXzcpzGhVm69KCHaZoxZZr8zNk0IA
 mws1l6V5hFBlt49PvyHB+LIlHanmaX8TJizPZCe2Lr3JuIskLH8OjUejdk6KL5ZO6fVz
 mkFxh2HJ+IssU6mWxyHXCIVjjtHJJcoPdD4YNdZox09v5f+pmdDxuMAgzoz1fKtNmaoK
 gbGllmxQ145YtHVKQHwYYU6XXVhPzq5RhmWyjgeXr9IvpTJbOWX25giEe+Q5ZxTwbKdE
 YKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o82X5HgymL6cW4VbM9cJTzS1zYiyMTu5/WxGQrdHhxQ=;
 b=U1Otfwew5rsVGFWnu3aUkLcA7fV6eISR4xsuL7sEmNCSkWT+Jj3JM721pln61LZXbM
 3VqZz3uRLv/sbi0l0JuPnhFXFoOjh2F4Dt39h+Xcf8PaRKkA0tr0ltAA3qAhi1NuGpyq
 Fe+nNwzODiHomYJQcq5ghSbX3D3QhWSYLSueTtqutRLiu6VshvgtIbkwvFuOtTYgEgyh
 qK5l69MAHqvUwIhaJuGn3Rw74lXUvnwCfXD8n1qfyDqahH7+WqzPfzPX+LKy+x2b13YM
 CommmEOgaAxxOA9qbXN803QjqcXvje4eU/FfAUUIGs1HHVD6Zhf+SIB6WnZrW5hnbns+
 udHA==
X-Gm-Message-State: AOAM530r+SdDE3snSihDL6qAGzi7lap4STFbcCJ3IaXA0y463ZdQi+vh
 aF4B/KKg1ytyd/iC2dghaA0=
X-Google-Smtp-Source: ABdhPJy58RQghS7ThhJgBfyp36TNHG0kgHWPFJnkTzVarDtqRt4+j2uXn/qXTUeJHfJJSNj2ez0s7g==
X-Received: by 2002:a17:902:6901:b029:ee:e531:ca5f with SMTP id
 j1-20020a1709026901b02900eee531ca5fmr26064584plk.37.1621871883823; 
 Mon, 24 May 2021 08:58:03 -0700 (PDT)
Received: from localhost.localdomain ([139.167.209.203])
 by smtp.gmail.com with ESMTPSA id w26sm11746135pgl.50.2021.05.24.08.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:58:03 -0700 (PDT)
From: Aviral Gupta <shiv14112001@gmail.com>
To: ulf.hansson@linaro.org, adrian.hunter@intel.com, axboe@kernel.dk,
 beanhuo@micron.com, satyat@google.com, avri.altman@wdc.com,
 richard.peng@oppo.com, guoqing.jiang@cloud.ionos.com
Subject: [PATCH] This patch fixes the warning generated due to use of symbolic
Date: Mon, 24 May 2021 21:27:06 +0530
Message-Id: <20210524155705.5138-1-shiv14112001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

It's better to use octal permissons instead of symbolic ones because  peoples are more
familiar with octal permissons.
WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
+	md->force_ro.attr.mode = S_IRUGO | S_IWUSR;

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+			mode = S_IRUGO;

WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
+			mode = S_IRUGO | S_IWUSR;

WARNING: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
+			debugfs_create_file("ext_csd", S_IRUSR, root, card,

Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
---
 drivers/mmc/core/block.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 266d62f9dbc8..1b5b0ad41b28 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2693,7 +2693,7 @@ static int mmc_add_disk(struct mmc_blk_data *md)
 	md->force_ro.store = force_ro_store;
 	sysfs_attr_init(&md->force_ro.attr);
 	md->force_ro.attr.name = "force_ro";
-	md->force_ro.attr.mode = S_IRUGO | S_IWUSR;
+	md->force_ro.attr.mode = 0644;
 	ret = device_create_file(disk_to_dev(md->disk), &md->force_ro);
 	if (ret)
 		goto force_ro_fail;
@@ -2703,9 +2703,9 @@ static int mmc_add_disk(struct mmc_blk_data *md)
 		umode_t mode;
 
 		if (card->ext_csd.boot_ro_lock & EXT_CSD_BOOT_WP_B_PWR_WP_DIS)
-			mode = S_IRUGO;
+			mode = 0444;
 		else
-			mode = S_IRUGO | S_IWUSR;
+			mode = 0644;
 
 		md->power_ro_lock.show = power_ro_lock_show;
 		md->power_ro_lock.store = power_ro_lock_store;
@@ -2851,7 +2851,7 @@ static int mmc_blk_add_debugfs(struct mmc_card *card, struct mmc_blk_data *md)
 
 	if (mmc_card_mmc(card)) {
 		md->ext_csd_dentry =
-			debugfs_create_file("ext_csd", S_IRUSR, root, card,
+			debugfs_create_file("ext_csd", 0400, root, card,
 					    &mmc_dbg_ext_csd_fops);
 		if (!md->ext_csd_dentry)
 			return -EIO;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

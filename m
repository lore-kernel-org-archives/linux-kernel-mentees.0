Return-Path: <SRS0=5DCt=AD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9E7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 12:13:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D45206FA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Jun 2020 12:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgX4gjHF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D45206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60BED885DE;
	Mon, 22 Jun 2020 12:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUccHfTxSy7Y; Mon, 22 Jun 2020 12:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E5FF8706B;
	Mon, 22 Jun 2020 12:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7816C088F;
	Mon, 22 Jun 2020 12:13:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 820E8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6462020784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8uk8XVeVhPk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id B0CCE2046C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 12:12:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e18so8072218pgn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Jun 2020 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9HlSKQMhzG7oJydL+6eh0up9y5VwqFmL94sToYa/uE=;
 b=lgX4gjHFucnFy5VkHP2WiY0D6XIEbcexKj1KxqJvBC+wiYLIl3kjnY5OiQ1lFBiGEL
 SZV3TvRi8AXTgDSbP1PcCEh22JfsRDXasJvLF7aUyb7UGHlKr6q4SKwLdt7gO2Ll0svi
 Bual2eB0y3TvXX0L8+Vg1km1WXhTjaeetYw4dJrSAxVa566HGLht8BDas3Ilc1JSmuuI
 gzEiuavSKzSdNavT5PNXwQ65afsFpTlWu2jiv8+hIA7cZiZyJvN7pJXOmJUixy8B14up
 y0yBURG+HoEUapcIxVxqS7s0AykmtYzDFVTMtMpkQuUleUQWWnyfZhPNvzcD/IzbyvId
 gHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9HlSKQMhzG7oJydL+6eh0up9y5VwqFmL94sToYa/uE=;
 b=NS3qM94jpdtrQ498g8uKnFtJEb3ASVwB/e/KtckGgfoCKpEt+CDmesgP1mvFYPNcVf
 tb9HMxkwMOizQVRXeWyGkVQei7d1TxPlJk5NcEHSIk1r/qrlDrOyFH7IdDAWJo4OPrYb
 Aeo92bv77ynqGQ4q1MhBYXKW3k1ott/pedOQpiz19CyeiJ6V11vCALJZUqPe/cqJmick
 PPoUDmp9UQHKKtecIXzUySN9rR7rwK/Mm7Yxn22UzXCCB90iZExFkm9MLG26FJ+0v0Tf
 XdTOu+gQ4zl1HbmhQC9I2sXuFr6dqIkcPLcgZD79QE/LgCjmTGWZU7QNF4+cdkqcfxfw
 Kvfg==
X-Gm-Message-State: AOAM532cQzQD33cs3L9AghrvrlLhXLD+XEi1TQ+lsBXIyaHINzhyOwYn
 gWUOm1RZ2lYAuTy7gLOY7nQ=
X-Google-Smtp-Source: ABdhPJzcIKdS55H6Lk+xBsA8lIrAY3wgHsUWpiZth/n3tyJfyRUSFfw91QigIsAGY65JwPVcXZx7Vw==
X-Received: by 2002:a62:ed02:: with SMTP id u2mr19752810pfh.283.1592827979227; 
 Mon, 22 Jun 2020 05:12:59 -0700 (PDT)
Received: from varodek.localdomain ([2401:4900:b8b:123e:d7ae:5602:b3d:9c0])
 by smtp.gmail.com with ESMTPSA id z9sm6745565pgh.94.2020.06.22.05.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 05:12:58 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Mon, 22 Jun 2020 17:39:13 +0530
Message-Id: <20200622120912.92392-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] [media] saa7164: use dev_pm_ops
	structure for power management
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

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power managemgement stucture can be easily upgraded to
gemeric, without affecting its normal behaviour.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 126d085be9a7..dba537c11797 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1534,14 +1534,18 @@ static const struct pci_device_id saa7164_pci_tbl[] = {
 };
 MODULE_DEVICE_TABLE(pci, saa7164_pci_tbl);
 
+#define saa7164_suspend NULL
+#define saa7164_resume NULL
+
+static SIMPLE_DEV_PM_OPS(saa7164_pm_ops, saa7164_suspend, saa7164_resume);
+
 static struct pci_driver saa7164_pci_driver = {
 	.name     = "saa7164",
 	.id_table = saa7164_pci_tbl,
 	.probe    = saa7164_initdev,
 	.remove   = saa7164_finidev,
 	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
+	.driver.pm = &saa7164_pm_ops,
 };
 
 static int __init saa7164_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A33C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887B520771
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ur1ym4yj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887B520771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69E0289546;
	Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dp5NhSBy0rby; Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DEE989544;
	Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E52C0865;
	Wed,  1 Jul 2020 16:53:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B999BC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E7522E2F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQKxLqBbatpo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:53:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C9B620109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:53:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gc9so4714569pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kI+jHdY4m6ujscdkGQmRwNx+jC0maQNTY++oXpNulVY=;
 b=ur1ym4yjHLK++0JCz3oETZ83xil3HXeXa7T9kC4a+zYSqsisr0szH99Xc8SiT19RHz
 3BngHbshALJKHeAhMKHuQ2tnLx5fWdb23Zhgogg2o25uriCc12kkaJN0PPKTM59cgQ2t
 sgPoh/XR+B43OlPRQTLAwwA6xlWNTmew7A9+wfgw3PozrEsdMNIsYGiLp6+zc76wUnvS
 hJqjIjgVgXfjpfCriNlu/TDlSaWVRpiipPiTUwy4Q3HOzw3c1XEklzvCS2eaeAqOy5xP
 yb0PnesDGVk6ktCpGYfBD9qYxoDh9rfd0sAdRFfqOpn1k1mAtijFVL+0CwPFTg9Bvpp7
 M24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kI+jHdY4m6ujscdkGQmRwNx+jC0maQNTY++oXpNulVY=;
 b=KmWtNOQBqcy3vpYYubl621YmYKF6yxRMIt7QspaLlfdxlRpjekuKXJ4EvYNLSL4toY
 4to7/pZypzxDEPpzHhwYvUTilxZB2WB624MfbjtD/hWAHpIMIq9RSYl8ptv3VZvfwnTz
 /bLD4a49C8aC2aF9XepvbjEyf+1j3uROCsDfOHLKI1xJ12oYdpEnVoJ9d2/BEMf81U08
 hwHsqvn8GHoW1QmjVElOw++NDp5L5lXzsO6hL5tw2Mc2JPkLTmdUcADSLx9Rf6ysIphI
 AzmSeYPnCx6583fiAAnll8TyiPnsyOztgjsoVsO6sxYO0zChp9q4PkoVgEOMVPCz49+2
 CIig==
X-Gm-Message-State: AOAM53184/mYTBB35/JoS3ycojKCb9fQxKINIYkPuhCFYEWnpq/lg1Em
 rEGqYvQY7NMJmheW4eC/eYShsFNmAYAsCg==
X-Google-Smtp-Source: ABdhPJyFgGaA0OqAiw8EI0MoOyikGYnCY9PhRj/BiZUfY8DDTZvrPNzOcPBsFmCTHaiSsZDXfsp8oQ==
X-Received: by 2002:a17:90b:705:: with SMTP id
 s5mr22413556pjz.11.1593622418013; 
 Wed, 01 Jul 2020 09:53:38 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id g140sm6297437pfb.48.2020.07.01.09.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:53:37 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 22:20:54 +0530
Message-Id: <20200701165057.667799-9-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
References: <20200701165057.667799-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 08/11] mlx4: use generic power
	management
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

Use "struct dev_pm_ops" variable to bind the callbacks.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
index 3d9aa7da95e9..4cae7db8d49c 100644
--- a/drivers/net/ethernet/mellanox/mlx4/main.c
+++ b/drivers/net/ethernet/mellanox/mlx4/main.c
@@ -4370,8 +4370,9 @@ static const struct pci_error_handlers mlx4_err_handler = {
 	.resume		= mlx4_pci_resume,
 };
 
-static int mlx4_suspend(struct pci_dev *pdev, pm_message_t state)
+static int mlx4_suspend(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct mlx4_dev_persistent *persist = pci_get_drvdata(pdev);
 	struct mlx4_dev	*dev = persist->dev;
 
@@ -4384,8 +4385,9 @@ static int mlx4_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int mlx4_resume(struct pci_dev *pdev)
+static int mlx4_resume(struct device *dev_d)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_d);
 	struct mlx4_dev_persistent *persist = pci_get_drvdata(pdev);
 	struct mlx4_dev	*dev = persist->dev;
 	struct mlx4_priv *priv = mlx4_priv(dev);
@@ -4414,14 +4416,15 @@ static int mlx4_resume(struct pci_dev *pdev)
 	return ret;
 }
 
+static SIMPLE_DEV_PM_OPS(mlx4_pm_ops, mlx4_suspend, mlx4_resume);
+
 static struct pci_driver mlx4_driver = {
 	.name		= DRV_NAME,
 	.id_table	= mlx4_pci_table,
 	.probe		= mlx4_init_one,
 	.shutdown	= mlx4_shutdown,
 	.remove		= mlx4_remove_one,
-	.suspend	= mlx4_suspend,
-	.resume		= mlx4_resume,
+	.driver.pm	= &mlx4_pm_ops,
 	.err_handler    = &mlx4_err_handler,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

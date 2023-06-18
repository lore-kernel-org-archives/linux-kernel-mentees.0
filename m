Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F31EB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jun 2023 13:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C33960F97;
	Sun, 18 Jun 2023 13:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C33960F97
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=j+it1mrQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeFoFFZa5yco; Sun, 18 Jun 2023 13:07:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1455D60B35;
	Sun, 18 Jun 2023 13:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1455D60B35
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E94B6C007A;
	Sun, 18 Jun 2023 13:07:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EDC1C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57C1B4097E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C1B4097E
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j+it1mrQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnUoFJMbYe88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:07:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2269B40743
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2269B40743
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 13:07:04 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-66615629689so2451332b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jun 2023 06:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687093623; x=1689685623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ooiaPbgSDk2Vavd/yz78VigQmMncQVwP5N8EDeWNlmo=;
 b=j+it1mrQUvR/fZDFPPpYHa5RUyGfo/KR3ts/RFYP6cRh8d32bZFpPVhN409/WDBC9X
 6+7y6VwhwA1/XDSjGOy6p/VPFjpqG3+hhvk7JTfeOpzkBAKASts7Dla9lbrKFn3apDC2
 DtV5jg5oZnTrtG9k/NCZ4+c3tM6z1aWzFh4/6JbZEDX9az+neu7UTbQrmU5boSSSq2Ec
 41nuPaRAe537iaI+HSgVLBNbWp4BDJpbJCyr6EbTP9zjV0aCZfLDrAaj+nsuyNBOnf+P
 WX4w0d/J0lZcmgy+acQq5cq7ICtuMv0E9KxCk4Rez3AjBHZkwqv0tfp42afWRR7khSKm
 K8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093623; x=1689685623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooiaPbgSDk2Vavd/yz78VigQmMncQVwP5N8EDeWNlmo=;
 b=JzO5kCKX8xpI8h8f9KKBNrRRSfhn3eYo2cVWMUbA9UAS3t7Ko/uJlzyTjCYwp9JHKx
 LKBDWfbhHnfQhOkiIAXmMYxy/p7nYlOr4sMNEPUjA0UxrvlnrI5ZfV1m2Xr5djDYeBYi
 osMuUftiQzgvuvBEG//wQUkQRXNkuHWMso5QD/DQozzl0vJPDSm6RdzQ68ESX8YSh7UH
 mDs6c/cN3U33PlBoc+SHksTA9nFAgomF7k1jRMK9ULgul8L2Y21en9Affvup5wY5SpIy
 LqzUSEeMd9UEfdm01qSJwF7ciGT/95xiPPF21TltQejp/Vpr07SVkKwfdzKgKU0HVUPE
 TlZA==
X-Gm-Message-State: AC+VfDw4e6VIOIzLVjnzLlCNiXXjMl9hM1uHIV9begdx7KUzZ80XagPv
 j0Sh/j63Bwt5Ct0EseTyKHA=
X-Google-Smtp-Source: ACHHUZ79lFMtx+Pb0R/irseT7cjmzdFjy784QY0jo3sRAMHQO/wo6KPP3MDUrfzs48j3sNOBNNPMzQ==
X-Received: by 2002:a05:6a00:1691:b0:665:c10f:709c with SMTP id
 k17-20020a056a00169100b00665c10f709cmr11340188pfc.21.1687093623535; 
 Sun, 18 Jun 2023 06:07:03 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
 by smtp.gmail.com with ESMTPSA id
 y9-20020aa78049000000b0065e154bac6dsm16159760pfm.133.2023.06.18.06.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 06:07:03 -0700 (PDT)
Date: Sun, 18 Jun 2023 18:36:58 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] staging: rtl8192e: Rename variable InitialGainHandler
Message-ID: <59e1d108e07a159e766d33df1556ffbeab1f7693.1687092111.git.yogi.kernel@gmail.com>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1687092111.git.yogi.kernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org
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

Rename variable InitialGainHandler to init_gain_handler to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 7b0da55fa7aa..267fc6f8800e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1109,11 +1109,11 @@ void rtl92e_scan_op_backup(struct net_device *dev, u8 Operation)
 	if (priv->up) {
 		switch (Operation) {
 		case SCAN_OPT_BACKUP:
-			priv->rtllib->InitialGainHandler(dev, IG_Backup);
+			priv->rtllib->init_gain_handler(dev, IG_Backup);
 			break;
 
 		case SCAN_OPT_RESTORE:
-			priv->rtllib->InitialGainHandler(dev, IG_Restore);
+			priv->rtllib->init_gain_handler(dev, IG_Restore);
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index b82d2b7aa26c..eb20b8014997 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -734,7 +734,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->SetHwRegHandler = rtl92e_set_reg;
 	priv->rtllib->AllowAllDestAddrHandler = rtl92e_set_monitor_mode;
-	priv->rtllib->InitialGainHandler = rtl92e_init_gain;
+	priv->rtllib->init_gain_handler = rtl92e_init_gain;
 	priv->rtllib->rtllib_ips_leave_wq = rtl92e_rtllib_ips_leave_wq;
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ee9b99b4c5e..0551f9b108f6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1711,7 +1711,7 @@ struct rtllib_device {
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
-	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
+	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
 	void (*SetHwRegHandler)(struct net_device *dev, u8 variable, u8 *val);
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

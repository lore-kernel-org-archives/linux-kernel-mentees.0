Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F359CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C493C2076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYcYgSrZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C493C2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A71CA887DD;
	Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27NqeLY95OOm; Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05783887D1;
	Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E86B7C0864;
	Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99458C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 963F488686
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MpU5cR8BVHH6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D39B08867E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l23so10420165edv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bdwFdqR8uTJkBxeLE6+6M0ZT6V7Ev5F6Fk3j55l8Z9k=;
 b=iYcYgSrZmWlo3R6AUjHZkTUqWlOCuvWQfp9o/jYHquATEwsySoI7qb/5R298C4XuP6
 41LiSJR2F+wAaeJbMOPDCVFPHsL0+Fo4vxG7q9em4PQJboP6PNqu/EZa36fMsM/zZbBz
 JCHW/o6zUF9a2HzOkDNo+9vZ2c5PCBRDQeUpdDN2BOT+MMhqCt4g8i2V0lS4IiBQw05V
 he5n2kloQO33fgxJyOaPrLYN0f7EOtJSixf210mNPyBCU5yXE9oEPpuWtwkow02lziQ5
 AygMJ24A5io1qUJTTJ+itzp+4YiuCii7XbUXLOjJXwTJ52oP7dmycNBHJfJeLprStDPf
 kBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bdwFdqR8uTJkBxeLE6+6M0ZT6V7Ev5F6Fk3j55l8Z9k=;
 b=Z5ivl3sHLkEaPcWlWH/TdztXtWY89e01aOaYKAdQUVF0PGbCh+TVmVEsBdfU+l0bpF
 VwqOSIRyVEQ6MDe6LHwN1uGl+mR1mfO9sk5mSIaQYum4FPegtffubACcart8IvaGtF+F
 JR/2wCQqqrJHRlw6Ujt98PakKuAPMK0O4+EBRptRP6BKYoMrQnh7CcuW//nbztBqbYmO
 4dRlUmz8OgmQrDJxIV1QJKHWcSg0z0+VDs89a7ASfv4NFXZEM2Com0hMbP/mbSpobM63
 9YON99suiR77jmGdPkZb4nTNWk4gyADZxYFUVmp7x3afuOXZ0iqxaIkxB5wdXlJ1FQOa
 JujQ==
X-Gm-Message-State: AOAM5321LgichrXDwxbOJ+LJIHY+NWvSzVXK0SHVS8KfmKnCxv7dK2vk
 Im7jvpllUCmP4xdxGw1Cwhk=
X-Google-Smtp-Source: ABdhPJwD7rV3Z2sHm2Urux9ibnAQJLnjp5J8GSKRJQtu26ivkTzM9jU1IBe5MLhlZErz7vNjd6oCBw==
X-Received: by 2002:aa7:da0e:: with SMTP id r14mr8200605eds.236.1596284677325; 
 Sat, 01 Aug 2020 05:24:37 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:36 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Date: Sat,  1 Aug 2020 13:24:39 +0200
Message-Id: <20200801112446.149549-11-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 10/17] hwmon: Drop uses of
	pci_read_config_*() return value
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/hwmon/i5k_amb.c | 12 ++++++++----
 drivers/hwmon/vt8231.c  |  8 ++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index eeac4b04df27..b7497510323c 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -427,11 +427,13 @@ static int i5k_find_amb_registers(struct i5k_amb_data *data,
 	if (!pcidev)
 		return -ENODEV;
 
-	if (pci_read_config_dword(pcidev, I5K_REG_AMB_BASE_ADDR, &val32))
+	pci_read_config_dword(pcidev, I5K_REG_AMB_BASE_ADDR, &val32);
+	if (val32 == (u32)~0)
 		goto out;
 	data->amb_base = val32;
 
-	if (pci_read_config_dword(pcidev, I5K_REG_AMB_LEN_ADDR, &val32))
+	pci_read_config_dword(pcidev, I5K_REG_AMB_LEN_ADDR, &val32);
+	if (val32 == (u32)~0)
 		goto out;
 	data->amb_len = val32;
 
@@ -458,11 +460,13 @@ static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
 	if (!pcidev)
 		return -ENODEV;
 
-	if (pci_read_config_word(pcidev, I5K_REG_CHAN0_PRESENCE_ADDR, &val16))
+	pci_read_config_word(pcidev, I5K_REG_CHAN0_PRESENCE_ADDR, &val16);
+	if (val16 == (u16)~0)
 		goto out;
 	amb_present[0] = val16;
 
-	if (pci_read_config_word(pcidev, I5K_REG_CHAN1_PRESENCE_ADDR, &val16))
+	pci_read_config_word(pcidev, I5K_REG_CHAN1_PRESENCE_ADDR, &val16);
+	if (val16 == (u16)~0)
 		goto out;
 	amb_present[1] = val16;
 
diff --git a/drivers/hwmon/vt8231.c b/drivers/hwmon/vt8231.c
index 2335d440f72d..6603727e15a0 100644
--- a/drivers/hwmon/vt8231.c
+++ b/drivers/hwmon/vt8231.c
@@ -992,8 +992,8 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 			return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_BASE_REG,
-							&val))
+	pci_read_config_word(dev, VT8231_BASE_REG, &val);
+	if (val == (u16)~0)
 		return -ENODEV;
 
 	address = val & ~(VT8231_EXTENT - 1);
@@ -1002,8 +1002,8 @@ static int vt8231_pci_probe(struct pci_dev *dev,
 		return -ENODEV;
 	}
 
-	if (PCIBIOS_SUCCESSFUL != pci_read_config_word(dev, VT8231_ENABLE_REG,
-							&val))
+	pci_read_config_word(dev, VT8231_ENABLE_REG, &val);
+	if (val == (u16)~0)
 		return -ENODEV;
 
 	if (!(val & 0x0001)) {
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

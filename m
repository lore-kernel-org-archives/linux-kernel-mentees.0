Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FEEC43445
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D10206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMSP5L5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D10206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BE2B88B30;
	Mon, 13 Jul 2020 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvkDlaqaxvUn; Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B456888A95;
	Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1323C0888;
	Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48C93C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45A9388B31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku6JXNaRvZIw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6928988A95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:55 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id lx13so17142107ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4mtRlJQaHePxtEmxgJ4wlQxNn5L43q/Zka7616zruI8=;
 b=kMSP5L5Flpc6NQRlZYtnLBolHIuDM831m9PhJvg2LNyM/twJSV5iJ8UbM+6MQsdE5M
 CLml5IDPqOPYg6ZN757vdGZAeRzeO8W4v9K37fUtLv49qnF2JfdQKGdreBg10qenXt7f
 brY7Xfw8BL3Hiq4f+z4Ak0QDisXul8aNqNa1gbx8IfSJDXUB4GS7hj3jucg2WpedWTIp
 6t21q38GNrpKaAwB7fXFVRrY9h0regwcQxnbtdfMUz5GL4WX5ij2p1/Q+NVL76aXremr
 WqFYo+vasH+aRxaKKYbzhnAMuMyWzWEAL0HKxZnL226nb5mt6T8dUWFj3y7//RY8J7ss
 bigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4mtRlJQaHePxtEmxgJ4wlQxNn5L43q/Zka7616zruI8=;
 b=WL8IzlO/WHRnYFV6FrHHIqujZ+as2Lj3dJ/lsiS+qodEYZHfbHRRlyXFw5CWHM7544
 u0WnNPbAGfNdMKZxRDgIBkw2NiDiap35sh3HKCsUFVjxC7fFTxOIsFODLFD5SK2U9mUx
 N6r/GY0GTQ2+g55T9uJHb9nS9xgxVIczaL/zSYOzv81IHfMf0buA/gqpXHw2Kd9mpWNs
 9SMC+AiK0/Aa+g2oYLxtBtGFLwASnazcADVkXhyOgQnuhNXktvU0BqJTT5PfqqmcKB2B
 O/RAKBX8aAlWwFbCJObWZsdSUACYxZUVUeRURm7urcsv1VstJqA4+4nRjn/RxnY+FAJp
 fiIg==
X-Gm-Message-State: AOAM5335DsMBzuUos3uky8RB1GLo0J3FYFn/a3diThmz5D7I1WIEMdPq
 NALeuIFf+uwX9DeKmNOv8is=
X-Google-Smtp-Source: ABdhPJxBg6NeDOYmyTW5DNO1P5saMhEnmdJjfVEe5tJAB3i+dRIhgcPYOfBUSf1/IW9C6Yjeq+b0UQ==
X-Received: by 2002:a17:906:2b52:: with SMTP id
 b18mr75601756ejg.158.1594646573741; 
 Mon, 13 Jul 2020 06:22:53 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:53 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Date: Mon, 13 Jul 2020 14:22:24 +0200
Message-Id: <20200713122247.10985-13-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 12/35] r8169: Tidy
	Success/Failure checks
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

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on PATCH 11/35

 drivers/net/ethernet/realtek/r8169_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 206dac958cb2..79edbc0c4476 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -2656,7 +2656,7 @@ static void rtl_csi_access_enable(struct rtl8169_private *tp, u8 val)
 	 * first and if it fails fall back to CSI.
 	 */
 	if (pdev->cfg_size > 0x070f &&
-	    pci_write_config_byte(pdev, 0x070f, val) == 0)
+	    !pci_write_config_byte(pdev, 0x070f, val))
 		return;
 
 	netdev_notice_once(tp->dev,
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B052C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFF3206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT0ftuJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AFF3206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D00C2201C;
	Mon, 13 Jul 2020 13:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVYjyaim+XP2; Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6A5420764;
	Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD76C0888;
	Mon, 13 Jul 2020 13:22:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8436C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E5226226F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 571JWBK8kpNd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id D065A2288E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:53 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id dr13so17158158ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xIWj0P8al909J+4pBE5o44qtYmVuYzVtW9yKrCNUaw0=;
 b=QT0ftuJUMnvN9L1yGVRJDjEK3qSZdoXJXBN5DYl7jyWso++THIIOuHpbc17F/zrosi
 8AuTgvAPKXfSy6z4977e3BRxPajXTXDMS4RXeyVTILawt6WgXpY//f2djyt/UkJQGRzk
 /gdGnf3M/3rld4z29OqilvjBcL0gyasTI6OnKfGjeReyQglVGg+YQe+xr3g3vN2ZXmuT
 H3K8zDE9spjbeXT5VJ615ifyAxorGrxgxDGJjtr2u9GrRuD3j9OL7Xjkb7TwOPORQmqL
 TfhNmfHAyI3xoFlBuZ/xKOOKE0n/7YMZrCkoDpUABaGXyhlEEpPzVsxCBXEJHjxWIgoV
 ZxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xIWj0P8al909J+4pBE5o44qtYmVuYzVtW9yKrCNUaw0=;
 b=W6f2+cYp3x+NQNs87ONuvNXm6cbFe0lL5rIbW7r6K1UB51rT5DdMjBr5tn2BghgLkL
 y+qgN1WCaudrSH1hg5omnDDKOGJwXpw3dOfKXDbNYBmogo113RXRUgpU9XYPUBY8ZnDw
 ji0qX8xRMyynu0HSTXO/i+kFM3GPQ/uUVQb151l4R5pjF8vUeQzcXHsIFUBNAPykOn5y
 2DIC1wOV43B/025eQJkM6hmJ1/x4kohlcHasNV0bU0RMNSSRBVfb5HGGSTHJw+q2otdR
 L2BZKHy3Y98WqiAmVdipE1L7j1DroZTmxsKX6kn3D5bAvAHuhhPiUkwfQMftG5irHevr
 VAXg==
X-Gm-Message-State: AOAM5339TZmcTkJH/JyYOHoJkQz/uwBSfB6xGIR3z6T1We8K1uWNEcve
 TrPmQBMbxPRDvrI0+OD/Xwo=
X-Google-Smtp-Source: ABdhPJxAfEv30rbnDL4uWXY7GIMGij0pMiiCWfpa5ktuZKtBwYpOGp8E6A1+3fdVVGoX3cC+gtFk5Q==
X-Received: by 2002:a17:906:f53:: with SMTP id
 h19mr71418351ejj.491.1594646572377; 
 Mon, 13 Jul 2020 06:22:52 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:51 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Date: Mon, 13 Jul 2020 14:22:23 +0200
Message-Id: <20200713122247.10985-12-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 11/35] r8169: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/net/ethernet/realtek/r8169_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index b660ddbe4025..206dac958cb2 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -2656,7 +2656,7 @@ static void rtl_csi_access_enable(struct rtl8169_private *tp, u8 val)
 	 * first and if it fails fall back to CSI.
 	 */
 	if (pdev->cfg_size > 0x070f &&
-	    pci_write_config_byte(pdev, 0x070f, val) == PCIBIOS_SUCCESSFUL)
+	    pci_write_config_byte(pdev, 0x070f, val) == 0)
 		return;
 
 	netdev_notice_once(tp->dev,
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C41FA372C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 00:44:21 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E40206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 00:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vN47OxNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E40206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 25831C3A;
	Thu,  7 Nov 2019 00:44:21 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E71F1C2A
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 00:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 93E36712
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 00:44:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y24so125418plr.12
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 16:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ve6txvm4TEbZ68vl1TZrP7X3Fq6hJlmUnRCShKqx4Nc=;
	b=vN47OxNW9OpxtDVgv9BdNwxRsewNx8fSaPUZKaVQUNrcOQ2voRnPDZO4+7ZF+Df2qQ
	db/BjqbBzRuIHIuu8P3Dgo8tza2VWOkVhntkHXhLOTZ87cQ7YDgUV68nEPJ7pu4Yx0Al
	645dvDwdGtOzij+4nU1ffGiqD8XHqt9kmWGw5geDoU837WQCM71fbMpt698pFyWW3f8t
	a6pds0DTuwrGg5zVS3YF8Z+00AbZr221wvFURl2kJvJsFNjee6zXOmPcKnsNXCN00a4p
	YbpwLqYI68/2st7ssoQxkui/3D5im11vpVa58wRbNNiLrRG13OvUMPrFWe278MqeCfaU
	291w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ve6txvm4TEbZ68vl1TZrP7X3Fq6hJlmUnRCShKqx4Nc=;
	b=TreKZnk4gASevV/It9aNyVWTnOBBH1/quwuiBLUpWSlJ/KoAE8YZRkeDwOUagSbaBb
	jkM19ecTbP0stlG4lqC7hrWLaANKYpRaZRsT8mG2c75FSM79Z/loZ6VNkB2hbPSdLSAC
	UmB1cQ+0lJhL6hItHMJx04HcHW8d5+7fBylI9HmFzWkFDzncPMDnxGOWmcU/j/Y8uJcx
	zSDKAmD6G3Mo5JjXjDD6+gfUFsWC7+tomuBBI3RzYQ1VWLvwMV+06qgLbwy9xcPq1U1D
	Xt4ju0uGLJsFShtGBCi5Jzou8WeLJdqN8duL1rLOgHx3oSPirmEIR1aipYuYP1K3ePpz
	QRyw==
X-Gm-Message-State: APjAAAU6qPGYJhTA42RvZjRqIuVG5UZE51C9bjQ0XCMYZSegNri+ubO/
	s8iQ4pr0I3AArviFyWxjyO0=
X-Google-Smtp-Source: APXvYqxpy3t28znraTs3FdUzKv0i5TNBoXLmMbIn4EQZShJvFNGc0pT9gU4Ma4CNDnuo+NLeWHI5Zg==
X-Received: by 2002:a17:902:9005:: with SMTP id
	a5mr583641plp.204.1573087458695; 
	Wed, 06 Nov 2019 16:44:18 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id 71sm180385pfx.107.2019.11.06.16.44.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 16:44:18 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com, davem@davemloft.net,
	gregkh@linuxfoundation.org
Date: Thu,  7 Nov 2019 07:44:04 +0700
Message-Id: <20191107004404.23707-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0000000000009763320594f993ee@google.com>
References: <0000000000009763320594f993ee@google.com>
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, hslester96@gmail.com,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	glider@google.com, tglx@linutronix.de,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] usb: asix: Fix uninit-value in
	asix_mdio_write
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

The local variables use without initilization value.
This fixes the syzbot report.

Reported-by: syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com

Test result:

https://groups.google.com/d/msg/syzkaller-bugs/3H_n05x_sPU/sUoHhxgAAgAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/net/usb/asix_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index e39f41efda3e..3c7ccd8a9da8 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -444,8 +444,8 @@ void asix_set_multicast(struct net_device *net)
 int asix_mdio_read(struct net_device *netdev, int phy_id, int loc)
 {
 	struct usbnet *dev = netdev_priv(netdev);
-	__le16 res;
-	u8 smsr;
+	__le16 res = 0;
+	u8 smsr = 0;
 	int i = 0;
 	int ret;
 
@@ -478,7 +478,7 @@ void asix_mdio_write(struct net_device *netdev, int phy_id, int loc, int val)
 {
 	struct usbnet *dev = netdev_priv(netdev);
 	__le16 res = cpu_to_le16(val);
-	u8 smsr;
+	u8 smsr = 0;
 	int i = 0;
 	int ret;
 
@@ -508,8 +508,8 @@ void asix_mdio_write(struct net_device *netdev, int phy_id, int loc, int val)
 int asix_mdio_read_nopm(struct net_device *netdev, int phy_id, int loc)
 {
 	struct usbnet *dev = netdev_priv(netdev);
-	__le16 res;
-	u8 smsr;
+	__le16 res = 0;
+	u8 smsr = 0;
 	int i = 0;
 	int ret;
 
@@ -543,7 +543,7 @@ asix_mdio_write_nopm(struct net_device *netdev, int phy_id, int loc, int val)
 {
 	struct usbnet *dev = netdev_priv(netdev);
 	__le16 res = cpu_to_le16(val);
-	u8 smsr;
+	u8 smsr = 0;
 	int i = 0;
 	int ret;
 
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

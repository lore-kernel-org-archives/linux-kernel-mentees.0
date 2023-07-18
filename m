Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF5EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Jul 2023 16:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAD4640154;
	Tue, 18 Jul 2023 16:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD4640154
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WuaFFFb8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_gkzxA8aX30; Tue, 18 Jul 2023 16:39:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ABD77400CF;
	Tue, 18 Jul 2023 16:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABD77400CF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75E83C0072;
	Tue, 18 Jul 2023 16:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FCCDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 16:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46065410E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 16:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46065410E1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WuaFFFb8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1mA2LzRVDp2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 16:39:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AACE409DB
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AACE409DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 16:39:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bb1baf55f5so34197305ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Jul 2023 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689698389; x=1692290389;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dJfm9Xu6mLNf+bMAmuP6AEX0CyJ95XqwOktwztwQYHc=;
 b=WuaFFFb8P26DlxbEI98Sj9R8DetzfD5pLUWStEYhjaTGtJH+OUC3umtYjNgHw53X8H
 qRQz9GWTsXAIw8VqpXYoRn4nH1Ah7isvmtXvHS4QWlaW2HQQOrhO1i4lP+Se/EmSLKsH
 p9SLbEWHHS3M2CbGlPep/pdKYflAHMnT2458jc02O1Q8Wgu4rgmk6B2G1IraMMBbbeuX
 iRWXAYcYtwu3AgJCLEV4JOftBkNXpHIoV1AI9NB1sHxKTNczwCKtrJYzab4fajTWXn6L
 tgxfZQaBAXvS4rVJERQ1GahNghgEHZOuIOyq3D7dUCM8Ar9OdimqlIeaDOgMcpYwW9ha
 yWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689698389; x=1692290389;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dJfm9Xu6mLNf+bMAmuP6AEX0CyJ95XqwOktwztwQYHc=;
 b=f4K2VPmKZxx547S4yBwCBSs3GBYJaH55DeWxj0tuynbF+sIWESjx3ccioy4djwNlYj
 OIyA70wsOzdzJhoUpM7HlGFx7V2SBDBMwd8L0QEDf7kdYW4KCOsq5u/oqRXfXNW4RzTl
 W6IsVuJaQNkYknobBCqC71DSOyQyibs+mGhc1DoyQBHFQMpFxHIFTvMo9kHzM81NyZOc
 qfL0xbrIphFtq5ZUmCUI4X1oLF1L6VPQFNQRfCKJ6B2QDud1M84iV6UdFXrqrH1fvoE5
 SBi61KymljRGFrJAxSZS7zIv4w80WsRSem5d042+spAIWHejXjjCLGNnglQWCFUriwOE
 +TMQ==
X-Gm-Message-State: ABy/qLbm31cTWmkCUakjcDoGaW8HHn79jpKsULmvLDaubO16G9LnVPP8
 nFHrIPPxRDINTrz3H3AU9CE=
X-Google-Smtp-Source: APBJJlHZTPpp1pKtH1Oi100fve+RA7DjBKu+d4ef5KaEWCIBBYdCe08KvkmNsDfXxRTogVs8bDcwIQ==
X-Received: by 2002:a17:902:7894:b0:1b7:ffb9:ea85 with SMTP id
 q20-20020a170902789400b001b7ffb9ea85mr15154411pll.29.1689698388615; 
 Tue, 18 Jul 2023 09:39:48 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a170902869500b001b80d399730sm2077207plo.242.2023.07.18.09.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 09:39:48 -0700 (PDT)
Date: Tue, 18 Jul 2023 22:09:41 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
Message-ID: <ZLbATQRjOl09aLAp@zephyrusG14>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

This patch fixes an issue affecting the Wifi/Bluetooth connectivity on
ROCK Pi 4 boards. Commit f471b1b2db08 ("arm64: dts: rockchip: Fix Bluetooth
on ROCK Pi 4 boards") introduced a problem with the clock configuration.
Specifically, the clock-names property of the sdio-pwrseq node was not
updated to 'lpo', causing the driver to wait indefinitely for the wrong clock
signal 'ext_clock' instead of the expected one 'lpo'. This prevented the proper
initialization of Wifi/Bluetooth chip on ROCK Pi 4 boards.

To address this, this patch updates the clock-names property of the
sdio-pwrseq node to "lpo" to align with the changes made to the bluetooth node.

This patch has been tested on ROCK Pi 4B.

Fixes: f471b1b2db08 ("arm64: dts: rockchip: Fix Bluetooth on ROCK Pi 4 boards")
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>

---
Changes in v2: Added the Fixes tag as per feedback from Vincent Legoll
	       <vincent.legoll@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 907071d4fe80..795a70948d9a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -45,7 +45,7 @@ led-0 {
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "lpo";
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_enable_h>;
 		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

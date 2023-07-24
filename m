Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A975DEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Jul 2023 19:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2AE36109A;
	Mon, 24 Jul 2023 19:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2AE36109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGuZsl00bfAr; Mon, 24 Jul 2023 19:11:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F32B960FA0;
	Mon, 24 Jul 2023 19:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F32B960FA0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE5DEC0072;
	Mon, 24 Jul 2023 19:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5E63C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 19:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8059C403B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 19:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8059C403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvOoALRmo2LQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 19:11:17 +0000 (UTC)
X-Greylist: delayed 1105 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jul 2023 19:11:16 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69E84016B
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C69E84016B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Jul 2023 19:11:16 +0000 (UTC)
Received: from [193.138.155.172] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qO0fg-0008OD-EO; Mon, 24 Jul 2023 20:52:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yogesh Hegde <yogi.kernel@gmail.com>, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
Date: Mon, 24 Jul 2023 20:52:37 +0200
Message-Id: <169022470428.2905604.14514573882052237409.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZLbATQRjOl09aLAp@zephyrusG14>
References: <ZLbATQRjOl09aLAp@zephyrusG14>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Heiko Stuebner <heiko@sntech.de>
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

On Tue, 18 Jul 2023 22:09:41 +0530, Yogesh Hegde wrote:
> This patch fixes an issue affecting the Wifi/Bluetooth connectivity on
> ROCK Pi 4 boards. Commit f471b1b2db08 ("arm64: dts: rockchip: Fix Bluetooth
> on ROCK Pi 4 boards") introduced a problem with the clock configuration.
> Specifically, the clock-names property of the sdio-pwrseq node was not
> updated to 'lpo', causing the driver to wait indefinitely for the wrong clock
> signal 'ext_clock' instead of the expected one 'lpo'. This prevented the proper
> initialization of Wifi/Bluetooth chip on ROCK Pi 4 boards.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards
      commit: ebceec271e552a2b05e47d8ef0597052b1a39449

and added the "Cc: stable@vger.kernel.org"

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

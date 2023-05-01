Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C730C77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 May 2023 20:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73E884091C;
	Mon,  1 May 2023 20:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E884091C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bQH9HYPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fq0imcSp3_p6; Mon,  1 May 2023 20:14:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 619B640588;
	Mon,  1 May 2023 20:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619B640588
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41695C0036;
	Mon,  1 May 2023 20:14:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0D7CC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 20:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C18981FCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 20:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C18981FCB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bQH9HYPH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qsvtq7gKv82U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 20:14:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C873B81F0E
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C873B81F0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 May 2023 20:14:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso3622009e87.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 May 2023 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682972054; x=1685564054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mE2szBYezWZJnqwmUnpT8UTjyXUukwjUaTrr8EHK1lU=;
 b=bQH9HYPHNgcXWjvzo+JOtC4li7jb81ep0Jvhfok3QZTgcmArtWHA3Ocrh6zuNfD94Y
 mwwFYoPiJEir6haIPiRGIQm+9DJ/7TXM3k1Z8oaK4Fz7EXF+ftpq0xfA/8egXw0Pfa+U
 aVA3Xpr3QyEwFObF9ZB7LDCBCgDTZjKkjhMKmlDNp1/qWAqgMZZG1Hjdddqy5OkvcAlL
 CDpGkKLF3G93F0g2JpO59bqsSIZeJIMNTPixVdFDfpKSl2uU6T7WRIwbsgp0WyId9vTX
 a54aAeJNNoUh959zpiRNcNSv4R6etOqHKVTslmbpnL4Dp0Vf48NaL6vnxy3g9QKqeQOp
 8vjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682972054; x=1685564054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mE2szBYezWZJnqwmUnpT8UTjyXUukwjUaTrr8EHK1lU=;
 b=NMQeB5VAsxUrcy3bC16V2T35f2K+tzkdh0R+CEVwsOPi508hvxTFMhXVamN42pUqbn
 +6DR5lYGC0ITCYXcb0soBIbs1JtPgWxk5S67dRu6ivBg+7IupHd2bYF7MEoiuXwWu7sF
 pRxWpQ2mzRwPhHewucTnj8ae+DafLd5M3FDSaP+/8lhJCH0C8S28cDOlKeWXBLkpuoQa
 gmTJwm6UaQD8F7Ov4WrJtJ5A9cRG+7zLB01i8Xtr+EFRFBf3Yw8MmiRE7EWcr4jg4OZW
 39DZpYLPqn/5/gqZf8o6V2bXdBVTz7piLbw3vHPYwiNk6h76L8ASYLRAizf8QCYEYwkq
 xihQ==
X-Gm-Message-State: AC+VfDxZTeN8HqPOJaK1kBPwzoptl2ehOvpke89Qdo73B2H7ls+MS0nH
 95naB4qtCeFV9+GuEn+NhYA=
X-Google-Smtp-Source: ACHHUZ7BI79YRtSo0GMy9ajMtZJoELc8kfvezGSttDBV/qmgaZpbbALqGaAhNAwQ82H53++qvbUzvw==
X-Received: by 2002:ac2:5fd1:0:b0:4de:e802:b7e3 with SMTP id
 q17-20020ac25fd1000000b004dee802b7e3mr4713414lfg.19.1682972053528; 
 Mon, 01 May 2023 13:14:13 -0700 (PDT)
Received: from localhost.localdomain ([165.231.178.21])
 by smtp.gmail.com with ESMTPSA id
 o20-20020ac24354000000b004e843d6244csm4924132lfl.99.2023.05.01.13.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 13:14:12 -0700 (PDT)
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Add configurable sleep for pcie-rockchip-host
Date: Mon,  1 May 2023 22:13:53 +0200
Message-Id: <20230501201353.1213963-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: shawn.lin@rock-chips.com, linux-kernel-mentees@lists.linuxfoundation.org,
 lpieralisi@kernel.org
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

I am submitting a patch to add a configurable sleep for the 
Rockchip PCIe driver in the hope of resolving a persistent 
issue with old ARM platforms.

It has been observed that the driver requires an extra 
sleep before probing the device, particularly on some older ARM 
devices like Pine64 RockPro64. While an original patch was deployed 
in Manjaro ARM, the issue still persists with the upstream kernel.

This patch introduces a module parameter "bus_scan_delay" which allows users 
to configure the delay before probing the device. I have tested this patch 
on several platforms and it has proven to be effective.

I hope that by starting this discussion, we can collaborate and 
find a more robust upstream solution for this issue.

Cheers!

Vincent.
-------
Vincenzo Palazzo (1):
  drivers: pci: introduce configurable delay for Rockchip PCIe bus scan

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |  3 +-
 drivers/pci/controller/pcie-rockchip-host.c   | 29 +++++++++++++++++++
 drivers/pci/controller/pcie-rockchip.c        |  5 ++++
 drivers/pci/controller/pcie-rockchip.h        |  9 ++++++
 5 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71AC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 May 2023 15:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45DD4160F;
	Tue,  9 May 2023 15:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45DD4160F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Mufmtxbd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1K46KiNiJxpA; Tue,  9 May 2023 15:39:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E80641615;
	Tue,  9 May 2023 15:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E80641615
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 688D9C0036;
	Tue,  9 May 2023 15:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF85AC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 May 2023 15:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D68F78420F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 May 2023 15:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D68F78420F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Mufmtxbd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4zsUYFdaAC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 May 2023 15:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154CF841D7
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 154CF841D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 May 2023 15:39:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so2288083f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 May 2023 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683646748; x=1686238748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BAP6y9vENbOGTUMhyFaj/H50h+Cw78KTsgpA0Rfk0rk=;
 b=MufmtxbdxskYNVPPTGC4wvh5lnaRXX5HH8PFcWRPdIDNo5A5tuqVl1P7E/DC2oqNvn
 bXbUuYsN9QmwXlKoS8aSxKjfaEI2l0DchyG2G1HsZeQjFD8jp2zv6Nsyq5M3uUvMAjM0
 qjKoRkVK3vdJ54iePMleWGLCzvbKZa7L7VFcHjBdxA7Nszp8fcrKy40YzqCxklOPpD+k
 uQrfNZTBDx0hkpiNxq6PUcwpdIkDToBDoeBwfGGYVHMgkn7NYRo0/QIe7oZQPkwbQdhc
 9e435yLIw5Zy2bPFrZp3DvZDVkubxvzA5VwbPoTDYZ/TAPc4HjsdpxGmJrDAUzrdIwFQ
 UXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646748; x=1686238748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BAP6y9vENbOGTUMhyFaj/H50h+Cw78KTsgpA0Rfk0rk=;
 b=Jdsm/qE/W5h/H+rlZy69FepKr34PrTktwLFqScBETfaUJbSJ99nwTOvp0fLa8TaKI7
 9pVYkrrT2QkyqMX4+XWjviBrZZPBM6/PhzypTNI14scRaqUXpeQn3hy5AmkqDTOwk/IP
 IUvqJmzhTV9FAJwKKbqKHq+TMN33DxXYwWF6pUMN7PXVK4WtBOEZkoAF0x63hdb0RJxN
 lJW2RJNf3EXzEeSQziGt6xIet1bTMKZPyEfPxNWxVZlCp/Pbj4t3JNx0jiXJUjvXxCib
 7vd6GOTX+xxUSl1ElXH86xkqCXuSrskGmZvuV42+EuGJ0xDbrV+PhJyk5ekQwEAQLGNv
 l4MQ==
X-Gm-Message-State: AC+VfDxmzIcnQEoOtaItLCWCJfagQJsR6JCDruoJo8Pg5QW7J2PUza0i
 yZdGPoob5qIwImxpBFxvyn0=
X-Google-Smtp-Source: ACHHUZ4aKda1ezxfuzftb1TPzU+2RoACFlSNYWggFpqk8qP96GfUNv2pmL5E+0OyroVm0hmVFu9jeQ==
X-Received: by 2002:a5d:4c49:0:b0:306:2c16:8361 with SMTP id
 n9-20020a5d4c49000000b003062c168361mr10045612wrt.22.1683646747911; 
 Tue, 09 May 2023 08:39:07 -0700 (PDT)
Received: from localhost.localdomain ([146.70.132.238])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d6b52000000b002ff2c39d072sm14743147wrw.104.2023.05.09.08.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:39:07 -0700 (PDT)
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v1 0/1] Add configurable sleep for pcie-rockchip-host
Date: Tue,  9 May 2023 17:39:02 +0200
Message-Id: <20230509153902.515106-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: robh@kernel.org, heiko@sntech.de, kw@linux.com, shawn.lin@rock-chips.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

P.S: I sent again this because I forget to add some people to the list
of cc.

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

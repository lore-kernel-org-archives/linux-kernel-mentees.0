Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1382DC46CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Sep 2023 19:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81ADB614BD;
	Mon, 18 Sep 2023 19:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81ADB614BD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UmGaDfj3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbWxKc45ZuZs; Mon, 18 Sep 2023 19:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 39BF4611DC;
	Mon, 18 Sep 2023 19:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39BF4611DC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04094C0071;
	Mon, 18 Sep 2023 19:35:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EC78C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Sep 2023 19:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26CE2819D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Sep 2023 19:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26CE2819D2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UmGaDfj3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fyI-i-Offue
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Sep 2023 19:35:51 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97FF7818E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Sep 2023 19:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FF7818E8
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c3bd829b86so35832745ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Sep 2023 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695065751; x=1695670551;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVaQmA2LhT7dn8cne4eMfEhfPLLr6K6HA82d5u2PJzw=;
 b=UmGaDfj3tQc0TJb8iewLio8KYSlcZ7JXLr7+iy0qDq5TR45/cTUpM+5odNOz84ucrQ
 5TGvHwPa/EqP1iPq9i99B4nIt0NNPrVysmvRD7kD8/jlrggeI+1ByLZw3xcP4woYb49N
 WlWuoQqg/ebSpNJPPd7j7ZTZiDHf/mfX37beNYL9HScTpvQJLMaas9/HUPN59bz50DX9
 FY8bqMLgJoaqncw3NTDPubv1MLYt45gEHxNsSow0oNmDlIK7saB5LVgB8Jm7I5qGiUcv
 F9FDcFuN5bn0knhxryg2Md+9s3TJnjuhcV7jVxa5+BX0LvjtuQiRtpl5Hd1ocNLxHDYe
 1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695065751; x=1695670551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVaQmA2LhT7dn8cne4eMfEhfPLLr6K6HA82d5u2PJzw=;
 b=XT4rqbWybxYF3O7UoJ7G5CIenPo2YQw9nSJ+VmAqMhUWCnh8KCEsynmveGB4di5tg/
 9jVCS1JGtDIPaUUus3gHl49wxKAHDnd11P4BK4TDfUxL77NfNnEwKZ4H+7ApiCt8t30k
 KEFSuroMlHQcP4L0sqMaN9AwTgQpvN2vjYjJXjn/9N6DcwAP5wIXUZ0izx7CBA60kzSZ
 pukhhH6PLxtf2s1cVpGViqVZ/Vh17Rw6Jyy9NwzIeptQEKxHPsA49viOKNIoxhlC05Un
 yxR83D/XmPb3tP0KFOfBu7TObQIduqt+HOFoSUm3QnIkBk25PeIyASXbRg8QFdxOzUbW
 8qZw==
X-Gm-Message-State: AOJu0Yxj7bGHGnc+k+Iv04AZoQcmhGS7sRhsy63rmisNHNY9JjTAeaIB
 2c5cyyUbRTM6qUgAUGdM9oE=
X-Google-Smtp-Source: AGHT+IFAQ8y6vwskWBz+ZyVbgackyibWf6YMx1p2aw0coDBfIZWQGAKolBLnHAdbUrp0ZedKdV1Edg==
X-Received: by 2002:a17:903:24e:b0:1c4:abc:b85a with SMTP id
 j14-20020a170903024e00b001c40abcb85amr9799862plh.9.1695065750965; 
 Mon, 18 Sep 2023 12:35:50 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b001bde65894c8sm8602032plh.268.2023.09.18.12.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 12:35:50 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] usb: fix kernel-doc warning
Date: Tue, 19 Sep 2023 01:05:05 +0530
Message-Id: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
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

Fix kernel-doc warnings discovered in usb driver.
Fixes this warning:
warning: Function parameter or member 'gfladj_refclk_lpm_sel'
         not described in 'dwc3'

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 drivers/usb/dwc3/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a69ac67d89fe..078edfe0f88e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1106,6 +1106,8 @@ struct dwc3_scratchpad_array {
  *			instances in park mode.
  * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
  *			instances in park mode.
+ * @gfladj_refclk_lpm_sel: set if we need to enable reference clock for LPM in
+ *                         Global Frame Length Adjustment register
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  *	0	- -6dB de-emphasis
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

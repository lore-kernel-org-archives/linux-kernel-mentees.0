Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577FDE7491F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB04640B56;
	Mon,  2 Oct 2023 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB04640B56
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9Wh6VMX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xmat24Dj2B90; Mon,  2 Oct 2023 21:01:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE23240518;
	Mon,  2 Oct 2023 21:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE23240518
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1ECDC0039;
	Mon,  2 Oct 2023 21:01:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D50EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 21:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E707D416A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E707D416A3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A9Wh6VMX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lvkbfz6W5p8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 21:01:49 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 280A6415B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 21:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280A6415B5
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-690d8c05784so166123b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696280508; x=1696885308;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HRAxndoOywhRzYPgMdhdUgmtQrGkiYMmSMD+Z1Z5zSg=;
 b=A9Wh6VMX5tc8eB0w8mgzGetT04UuszXcue1PbjPOLoTmidX725zfTIIEJr544e3wZE
 lF2AFlAmB+MarDiq+orY+YQfouVSvs0InIxZVLoEOzf12SQcNNkgnTpaykud2PKsI5LV
 j3syxZfzKr45qpS0hqdx//8jWIrAEBAeMy2T5NWdRVUr8r9RO2PaQKT9oerd7t4XCvw0
 xqMn1/VqtU5sikegYRLuwCa2ndVWzme5pZ+nZ75QFu/tRz4V/tGjvxzdUa3815sulvcU
 GIwtt2P85TcxMmgrsITKp6Dtfb13cI6onyWriNswkT0z4N6JcNLrl3Jp+50316EJoIfR
 s3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696280508; x=1696885308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRAxndoOywhRzYPgMdhdUgmtQrGkiYMmSMD+Z1Z5zSg=;
 b=LMzcz+itAb0TDWDCTSe2jico5fKWqEKyaG8y6Osvtane4pt3u/eCm96W2CO6qRd8Ex
 eI/f2eyqNEJrzs77gZNpwHlFChOYqYdzStVzVTS3u9sUlk5BJLY+JrOEjByM9WHL5Dcw
 VmP+cFpPnNBJEeYufv0nRadPSn2XScDBCP6s9WSSSL2fvYb7DhJ4fi+NnpJ3qWVL5syn
 N/i0TuNbaE8YlNwqqUqKW7chvWUbcC8yxZriRP2Lpy5i+zJerz0EtcC/UrUgp58gxuvz
 iNGyQxRaEjXWvj8qvPYUbOP8yOBItg/kae1vyKbKOqVx0cTAAY5YLHCVGa6FojL8g+Wi
 gpIw==
X-Gm-Message-State: AOJu0YwV6+7QBVitmnnQroIpOBqmmc6F11DnAEurVqBZHpr1n7d3EAbB
 t4R5WOLzmHJFzXv7F4OgAac=
X-Google-Smtp-Source: AGHT+IEKCfUG0nwjH8sZfRtHvsAK+dOUfuK8uQYrL1Bc9Etwdi/XDgar1p1eQl8pEiTFhOqtIgGXOg==
X-Received: by 2002:a05:6a20:2589:b0:135:4df7:f165 with SMTP id
 k9-20020a056a20258900b001354df7f165mr11492945pzd.21.1696280508384; 
 Mon, 02 Oct 2023 14:01:48 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 c26-20020aa78c1a000000b0067b643b814csm20072472pfd.6.2023.10.02.14.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 14:01:47 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] usb: dwc3: document gfladj_refclk_lpm_sel field
Date: Tue,  3 Oct 2023 02:31:37 +0530
Message-Id: <20231002210137.209382-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: swarupkotikalapudi@gmail.com
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

Avoid a kernel-doc warning by documenting it:
	drivers/usb/dwc3/core.h:1343: warning:
	  Function parameter or member 'gfladj_refclk_lpm_sel'
          not described in 'dwc3'

Fixes: a6fc2f1b0927 ("usb: dwc3: core: add gfladj_refclk_lpm_sel quirk")
Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 Changes in V3:
 - Include correct Fixes tag as suggested by Thinh
 - Update the commit message
 - Update the commit log
 - Change wording of document warning fix
 
 Changes in V2:
 - Include Fixes tag as suggested by Greg

 Changes in V1:
 - Fix document warning

 drivers/usb/dwc3/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a69ac67d89fe..96685391696d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1106,6 +1106,8 @@ struct dwc3_scratchpad_array {
  *			instances in park mode.
  * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
  *			instances in park mode.
+ * @gfladj_refclk_lpm_sel: set if we need to enable SOF/ITP counter
+ *                          running based on ref_clk
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  *	0	- -6dB de-emphasis
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

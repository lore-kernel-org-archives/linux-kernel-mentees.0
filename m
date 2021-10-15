Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50C8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9D4611C1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B9D4611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6498B83B60;
	Fri, 15 Oct 2021 14:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_V4HeiFd8m4; Fri, 15 Oct 2021 14:47:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9255D839E0;
	Fri, 15 Oct 2021 14:47:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EE03C000F;
	Fri, 15 Oct 2021 14:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F46DC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C8C140806
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47U5Ilo4WN9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C2F340801
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:59 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 133so8840597pgb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8H47ocDcATCEcdvQX+LbcVgPZyzX/fIx4WAwDOmGCq4=;
 b=Eux3ZNBeFFId+XHdQkRmLauqE8OAFj38AteET+UOhB3y9JaX2mZ7iVNlfIRKDRY1aP
 Sp6zIyqe0Ud1BseDpkT60FafTSrwY/J9mVtI9j6Pk1rVWEoMjamuFbMeteGMPDAKudik
 KArKNn2zwwdCjIBZxpW+uWOakhRB/U92FAHfnx0pAl51m7jn0v3JUQIo9+fDoLeLyZKS
 q0hJnBIuY49zyJLy2wo5UiUb6ZZzxCY797QfKS3vghg+AJsL7XwnTQgVY1AndynWaiH9
 9oOFzKwhP8B7SoA28FaVuvv5gwLhB9aFLGJY09bJemOUk4tbqCKVAHfYulxYfufqA4Sj
 LRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8H47ocDcATCEcdvQX+LbcVgPZyzX/fIx4WAwDOmGCq4=;
 b=yBBRnxBs6rUJVRKk1aFrZF1TpxcQ4EYG4tJ32akXexME+iPcKSB2fZrGQ7i7QUzwwO
 aeKXAbcW4YwCn/hb8STgrYtYUZUwLdtiDhjWf1z0Uom6LNTnvMy+k6XG9MpLkwQH0zMa
 pO7zwwf7RbY0/L1orAspTD9Qk77JKKnyBcugRaCRX2X9h9R269GkxFSQJGwhry4OoSz9
 MPNJCOFT3uQRfwMaRDkg2Paou6h9o18r12b2+Hi7+uBu2mAcOp6MCgSIMoLbYDi5So6O
 caHt0xEyqd9n2pbEwMFUGclpt1ObbvN7l7DOm/t+BoZ8pQFnqeVmcbnOW7Rsk6+powgZ
 VfXQ==
X-Gm-Message-State: AOAM533bGxrrUFMf3XC9gd6EqvtvNzNljk2Q8Zz71DrdkXniP0+C/URm
 MZrGJ0z5HbayfI4UXLFLo0E=
X-Google-Smtp-Source: ABdhPJzGttIeZ/ecyBn9FSKHW/aoF+vyF/yYttrHn5sYxfqT3TXKV4dkEub6bv1LydtAneYLLoxtPQ==
X-Received: by 2002:a63:f155:: with SMTP id o21mr9408255pgk.218.1634309218506; 
 Fri, 15 Oct 2021 07:46:58 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:58 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 23/24] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware
 read error
Date: Fri, 15 Oct 2021 20:09:04 +0530
Message-Id: <9b72268025063f0094880f32f391e2f626f62487.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "open list:Hyper-V/Azure CORE AND DRIVERS" <linux-hyperv@vger.kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Include PCI_ERROR_RESPONSE along with 0xFFFFFFFF in the comment to
specify a hardware error. This helps finding where MMIO read error
occurs easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pci-hyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 67c46e52c0dc..7e1102e3d7c6 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -1774,7 +1774,7 @@ static void prepopulate_bars(struct hv_pcibus_device *hbus)
 	 * If the memory enable bit is already set, Hyper-V silently ignores
 	 * the below BAR updates, and the related PCI device driver can not
 	 * work, because reading from the device register(s) always returns
-	 * 0xFFFFFFFF.
+	 * 0xFFFFFFFF (PCI_ERROR_RESPONSE).
 	 */
 	list_for_each_entry(hpdev, &hbus->children, list_entry) {
 		_hv_pcifront_read_config(hpdev, PCI_COMMAND, 2, &command);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

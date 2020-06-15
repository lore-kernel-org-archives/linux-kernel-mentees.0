Return-Path: <SRS0=vsPk=74=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C431C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B08320739
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAth882o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B08320739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C49B884AA;
	Mon, 15 Jun 2020 08:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwiNX9cmVepJ; Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48A5088975;
	Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34291C0888;
	Mon, 15 Jun 2020 08:32:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8267C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BDFCB889A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKfi9Y3iB31d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8AF868898B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 08:32:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l11so16143106wru.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2020 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LhYq3ErTARnN8M2y3YfDyaUAiF9DdChbWeaq0FOKRSE=;
 b=iAth882ot48k+1hVxs2N7dKisLYLFY15sfEjKljaix/MP7NhyZkJnNqvQIQdA/RFHN
 xoasva4/H9ZHoHRiTydzkdZfExNxJrgbe4KXfoIiPl+5y7jGS4fxWHtd3pdsDayb1NVk
 phF1qbUyyV7Cv1Wa9Taqnjee2Un2UqqOnXyieCToPVOxYJgESkzIuHyTyXLZBsi//ZPJ
 etNN5douj8ntVKOi9ac6mOTUSz8cpJH7JQCErUoIxMi1Vaq1io+Il8Up5OkPHweBWcck
 Hg6EehHHD8Gq377nepRnWrXzLjE1ireVXu3V1RWbHdTWShK3adK6VVBeaDuhnPJz3V/a
 mhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LhYq3ErTARnN8M2y3YfDyaUAiF9DdChbWeaq0FOKRSE=;
 b=ZLEqucZimTxysM42zPHx356toufTL15mMW0eR8+P0Du3LnoDoOK3bl2DvScKjK51bX
 K9jAbP9QCqNEzqbzQ5VIv6dhgojX/MNaUSSQQqD8HoewkH7PqFAjyoKOcBRJJ1Tl1unf
 U3dnpeEotGNLRtT/8ACO/dUVbuyy/WeBifEIxzRYQ4CWjxHtnElSCRlr6LavqwpmHfWD
 o0mON9pwj06cwYDec/QxxZJgABcY7dF/AqO62hHgiVyMmQvp9sbuLUQfl4hRVtTS2gLl
 J6UnSMp8qqKeenDjMnkszOazTTqinitfrZEKpU4wKDPDDfa7J3E/d+hWd8KK4a95LrK1
 I7Ew==
X-Gm-Message-State: AOAM532OrxfTVGpKcKXMC4JlY9foseZESerMzSEvC6wV6RG3a4fmC7VX
 Bt4s34JGRXaSOuBfmdCTmfc=
X-Google-Smtp-Source: ABdhPJyVpcmhLb92L22CTkhQXirzPyFYPKxH7q0JUBoAhTgmjAwOEGO/IzLwbRaAtJ7n5HAteFfw7g==
X-Received: by 2002:adf:f205:: with SMTP id p5mr29480211wro.302.1592209931903; 
 Mon, 15 Jun 2020 01:32:11 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:11 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Mon, 15 Jun 2020 09:32:18 +0200
Message-Id: <20200615073225.24061-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 1/8] dmaengine: ioatdma: Convert
	PCIBIOS_* errors to generic -E* errors
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

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

ioat3_dma_probe() returns PCIBIOS_ error codes from PCIe capability
accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/dma/ioat/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 60e9afbb896c..fc8889c2a88f 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -1195,13 +1195,13 @@ static int ioat3_dma_probe(struct ioatdma_device *ioat_dma, int dca)
 	/* disable relaxed ordering */
 	err = pcie_capability_read_word(pdev, IOAT_DEVCTRL_OFFSET, &val16);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	/* clear relaxed ordering enable */
 	val16 &= ~IOAT_DEVCTRL_ROE;
 	err = pcie_capability_write_word(pdev, IOAT_DEVCTRL_OFFSET, val16);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	if (ioat_dma->cap & IOAT_CAP_DPS)
 		writeb(ioat_pending_level + 1,
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

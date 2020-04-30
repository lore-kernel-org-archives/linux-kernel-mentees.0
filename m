Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A36C8300B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 01:59:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3787B20757
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 01:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="LxmFwU7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3787B20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F45385721;
	Thu, 30 Apr 2020 01:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSqXIImrwVIg; Thu, 30 Apr 2020 01:59:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0BE78568D;
	Thu, 30 Apr 2020 01:59:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 999D0C0864;
	Thu, 30 Apr 2020 01:59:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67E74C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 01:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5162E85721
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 01:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YseYp-Quv2R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 01:59:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 865848568D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 01:59:36 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s30so3784614qth.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
 b=LxmFwU7TGw7y9TAZafLVzvatQZ0gZjRW65fHnG9mih+vMFlq42rxUunxAOoL/uGZwV
 b5K/FJ8TlMReE9NuZwdRSN6JlWVx8OuU2m6gEcAXGPHBij943y09p3qom6ajQqpAGCDL
 DkgvAmBO0xKju/EuTeKYhKvfU/Vh10jMxTnMlNsbKhjkRYiFRaS9DB/KBcYIG1mCBMbw
 C5iSVrlzItgv9jyBA+YiqNlUYGLVHSg4H1/08Bcf6R2/x3tcYJFHZ+r/5kUSPSwN+Wts
 /0wnxrhLKsD/Orm3kO/tYZVEOjnATZK4APJk6ZCQ2tof62k6ScOI5t0iHP4HngekMbhA
 fsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fVFXHIsh0/YRSKtqr5ljSmMbeR52DAiwA44HTGSUEYs=;
 b=abcZ+NFUiD+4xfAucydMsNzYRd2AnL9HxvlEjA+zBKD4astLuWK0MuEX/+6rNf/m6K
 gbNi/pRv5OMlROpFHlvwiIczZ3mG06KmPCEs+wubuVlJg0el0i6h3FVtfFk1ER75b2y/
 IOyfUuffOxsF8vptOP+Bn1PyBHX+Zo82tgCjDXiZs4GU+vqrpKeo+93qSbhd/P8R+jpQ
 1fSLG16h+HZXwcpcY2RUCCpF1fA3+fKYM0BuT2JkzL69nKTG2a5U+hdekS/Pko1n3D8C
 NzxqMwcP+/KtxOIDPM+yeZGyDqWFA/bt9y3SD6j4kn7gblIkK0N5yP2m/h1gTxrlstJW
 FKwg==
X-Gm-Message-State: AGi0Puba9Bqlx1vGA2MiGTisocnpkjUE4Kk2tkSZSN+7rw4N1B2qr6w7
 5IX1XW77sQLQ6ohu4uIeYYhBFg==
X-Google-Smtp-Source: APiQypJoSfYUsyxQnQO9ATp9PPbiyFH/GL856p8ztpAhtz6K1Fy0hNXDM3D+1FjMDNceAVO1N+vsvA==
X-Received: by 2002:ac8:51cb:: with SMTP id d11mr1332622qtn.370.1588211975468; 
 Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id l24sm836378qtp.8.2020.04.29.18.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 18:59:35 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: dri-devel@lists.freedesktop.org
Date: Wed, 29 Apr 2020 22:59:30 -0300
Message-Id: <20200430015930.32224-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel-mentees@lists.linuxfoundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] dma-buf: Documentation: fix: `make
	htmldocs` warnings
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

Add missed ":" on kernel-doc function parameter.

This patch fixes this warnings from `make htmldocs`:
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ccc9eda1bc28..0756d2155745 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
  * calls attach() of dma_buf_ops to allow device-specific attach functionality
  * @dmabuf:		[in]	buffer to attach device to.
  * @dev:		[in]	device to be attached.
- * @importer_ops	[in]	importer operations for the attachment
- * @importer_priv	[in]	importer private pointer for the attachment
+ * @importer_ops:	[in]	importer operations for the attachment
+ * @importer_priv:	[in]	importer private pointer for the attachment
  *
  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
  * must be cleaned up by calling dma_buf_detach().
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

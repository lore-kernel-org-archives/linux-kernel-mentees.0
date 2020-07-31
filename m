Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F07C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACF522B40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlWaplXG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACF522B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0377886F4;
	Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBd-3dUZznZP; Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C744886F5;
	Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33798C0050;
	Fri, 31 Jul 2020 12:02:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0792C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C823E883AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d+Ct0H8dO1HG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 275B48839A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:24 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id qc22so16378847ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eZK+H+8P4YZaGPvNdFZeiGG9Bo1EGoEt0s5F4CNNc80=;
 b=QlWaplXGbixFr2iaZsG5PJHSSOZbuNBUIasW8yuH1nsnVdp6YoYPMGxTOoB8aeGPjl
 cn2K3t/zLUCVvaaSnJcwSClDPI/NsQpHsPV9YLrXYaYwWeJ89I2ysukcyFp9knRUz/6A
 C1Yy8ztk7MbJ2O1f6n8/EwUzvpVmzYv3aVhmpXCFLy0CcrvflKiFRAQY1NvlEFKkwjEd
 7M3+18TKCiSUH8ezZEFQRUHHM1DaiD+BvM6ftfMrAemf6hGhWP+eoJ4DEqde40kq53fv
 Vt/tgbEvtv1lsYX5VyhQ7PDlh++wbx6fnuf5oW+s+Z+p1JAKPLwxByyotKgX808QntiK
 +X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eZK+H+8P4YZaGPvNdFZeiGG9Bo1EGoEt0s5F4CNNc80=;
 b=Mtu8x9pklx8zRD//paFX3PP8dnup5mKrmpyz/Y7pHmwqndescjpvemolBqJk+BefrH
 Ufbu0W1Fp3FO+Fy09ae0ltUeuFH0jFQWbjyC8OemUN2rSug+mFJzI3av/pbiqCCe/0h5
 xliltIZXlEA8F4GHdYUGyKl2BsLFWRf7d7T4xk+U43TXUrX1zFr6Q9oWr79V0ZoovT/l
 KwQhFPus29T12ilKGME7+PmJCek0A6GGukkXkjTY8XN8ZwzjbMOSX/FWwQ948MhpEQ1A
 YeihvhTtS8TnFulFvPJjM40BllirPtekUozjouUw1BrAymxcXB/5RUZKxpt/QESJZh1Y
 Pfbw==
X-Gm-Message-State: AOAM532LakoZnjZHQ1OKCcAG4qbJnpS/n0/udxXXXH2iLRgZrNp9xJIg
 GdAM1chyKb5hLscV6Ev27HY=
X-Google-Smtp-Source: ABdhPJzseAgg1rg1tVy8ApT5RrpMw/6kYsnooL/dOwqEDLtZ6RfM9YbjqXKCNWBVO0h/MP8NAaoBeQ==
X-Received: by 2002:a17:906:c1c3:: with SMTP id
 bw3mr3941716ejb.8.1596196942684; 
 Fri, 31 Jul 2020 05:02:22 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:22 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 31 Jul 2020 13:02:32 +0200
Message-Id: <20200731110240.98326-5-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 04/12] iwlegacy: Check if
	pcie_capability_read_*() reads ~0
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

On failure pcie_capability_read_dword() sets it's last parameter, val
to 0. However, with Patch 12/12, it is possible that val is set to ~0
on failure. This would introduce a bug because (x & x) == (~0 & x).

Since ~0 is an invalid value here,

Add an extra check for ~0 to the if condition to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/net/wireless/intel/iwlegacy/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 348c17ce72f5..659027563260 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -4287,7 +4287,7 @@ il_apm_init(struct il_priv *il)
 	 */
 	if (il->cfg->set_l0s) {
 		pcie_capability_read_word(il->pci_dev, PCI_EXP_LNKCTL, &lctl);
-		if (lctl & PCI_EXP_LNKCTL_ASPM_L1) {
+		if ((lctl != (u16)~0) && (lctl & PCI_EXP_LNKCTL_ASPM_L1)) {
 			/* L1-ASPM enabled; disable(!) L0S  */
 			il_set_bit(il, CSR_GIO_REG,
 				   CSR_GIO_REG_VAL_L0S_ENABLED);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB4EC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9128E22CA1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6Y0jv5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9128E22CA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83CBA88639;
	Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhOxoZxJP-Xx; Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2DBE7886F3;
	Fri, 31 Jul 2020 12:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00142C0888;
	Fri, 31 Jul 2020 12:02:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73A0DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6E91B88639
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ5o9sN0F6Qr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DA42886F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 12:02:22 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id c16so10782838ejx.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 05:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0s8kQrogwdlSPLZApHKOPIg76Pp1CNTA9YznKKgGPck=;
 b=M6Y0jv5kDqUnaX/yd/T2xgMQt71taFc83qH0hNkDJSCO82eBpAd0hnmaZzXzH8JwwR
 QxnHOUFXM4WOTonZWpymDce5CueUtu5cPdmXzfF3QkrFwjTonyaSBB6/OFutNKWXXJl7
 1jUDYkKMxsmMDhL2Zw4OcJ1xStjLUKRpOJXm5Y9RjchXLuWxHlaZ4NjkFERXie4cqi+O
 OqAUwBdHmMok6y4FmBJihc5eH+MTABnbOjG2wVrZs5mQO/rZvl7GoIwILp5r9rZkXKaj
 I1ZZYBXCyxy0zsS5imx/7/w6t7tKz/PDc+l5Py3ZaKD6QtvvAyfi+GgIxAJ99ngBWThA
 2OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0s8kQrogwdlSPLZApHKOPIg76Pp1CNTA9YznKKgGPck=;
 b=XyvN8tuk326zeEXvAqIZG1ZUPIcTdPasA0tXtFfSBUaXUbNDTzOjAieM6y5Tafn4u6
 Wh9I/c4Zk1mYdWrIZVV8Vm6iaJSNMf0yBn8ViY/aE/YNg/QEfKbvIAEq16gJYHVAmIGC
 hGkFKlY3KvlJcHB/APJBrdt0SXtQdz0y25al1u32nMD2/moQtABap18VzXDo8lyDi25x
 bd+JY2zsgG69nC5W7G10Cv21Cx/BUvD6T//hGhcL9mhJL42l5Awwg8rgqpr1ahzB6e5M
 Os+PyArryiOkNGtAPO4WH2ikFJAaxOiwJKwxjxQFfQ8r2HQ5NTvncKRkkwgJOQr7c0iB
 otNQ==
X-Gm-Message-State: AOAM531HziOIR97h6+AsIUKUOiJgMedPDKkVIaS8yFFj50xAmZZ2hvRZ
 fcqr6mHxPe9do/u8G7d4W34=
X-Google-Smtp-Source: ABdhPJz45zbOZzboFeAodzV6Jdd70KawW/kH4Nt1N7OyBQuz8phrmzy5Ee9QL5qqaAtYtkYbQgzHiA==
X-Received: by 2002:a17:906:1c0e:: with SMTP id
 k14mr3597814ejg.479.1596196941171; 
 Fri, 31 Jul 2020 05:02:21 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id j5sm9091734ejk.87.2020.07.31.05.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:02:20 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>
Date: Fri, 31 Jul 2020 13:02:31 +0200
Message-Id: <20200731110240.98326-4-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731110240.98326-1-refactormyself@gmail.com>
References: <20200731110240.98326-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 03/12] ath9k: Check if
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
 drivers/net/wireless/ath/ath9k/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
index f3461b193c7a..f02b243befef 100644
--- a/drivers/net/wireless/ath/ath9k/pci.c
+++ b/drivers/net/wireless/ath/ath9k/pci.c
@@ -867,7 +867,8 @@ static void ath_pci_aspm_init(struct ath_common *common)
 		pci_read_config_dword(pdev, 0x70c, &ah->config.aspm_l1_fix);
 
 	pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &aspm);
-	if (aspm & (PCI_EXP_LNKCTL_ASPM_L0S | PCI_EXP_LNKCTL_ASPM_L1)) {
+	if ((aspm != (u16)~0) &&
+	    (aspm & (PCI_EXP_LNKCTL_ASPM_L0S | PCI_EXP_LNKCTL_ASPM_L1))) {
 		ah->aspm_enabled = true;
 		/* Initialize PCIe PM and SERDES registers. */
 		ath9k_hw_configpcipowersave(ah, false);
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

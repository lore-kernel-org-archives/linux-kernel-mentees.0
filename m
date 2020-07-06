Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61E9C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBB72073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxCrW16I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBB72073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79D65872CC;
	Mon,  6 Jul 2020 10:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqBKUAS6d4oV; Mon,  6 Jul 2020 10:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D592086F4D;
	Mon,  6 Jul 2020 10:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE7B9C0891;
	Mon,  6 Jul 2020 10:31:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4334C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79639887D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYz3ZBTcNo6h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2AA87887D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 10:31:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 17so41279649wmo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=26PwZYWxJLM18KgdpHkyjehBVk/n+2ZbAWSqTgL9M2Q=;
 b=pxCrW16IRieTwvUyfV37QjVnQ2O3MhAQrIgdBDgG7b3w1tTXkv7lUCNXiS4zrGZAMe
 N1VJEg8Bim6iX46ZhEbdVSBYnT48+lS6fzoNTY85G1YC/HmeY3QHTuukcZeQrmz73/mP
 COvmx5r5ojODL9tw1fB7wI00/3bSKvDRp9OEintGjqRI+pFoyH8jlEllu6Lr9i1Iijij
 u9gcudUWJ5O4knMAlINCEVN31TnLwTmn4hdvEAgIVUnIPkM7youSKpysIuuUFjBZ8KvO
 C+tgsLXgMcJVJq16jGJIEEbIUHQHsp60TbM0AKHtgP3tVTguNQx2mo+Pk3gLpqXQwAMu
 mRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=26PwZYWxJLM18KgdpHkyjehBVk/n+2ZbAWSqTgL9M2Q=;
 b=DDHStwUU54vvQlurLtjpKGKh8Xg2SIdSLgPbu2vEIpabh5z1ZxR+f9y+jWnKAONySk
 HRbyWS9MU0nHb0JiNHsh3zonzg/z7HKU5uKM4NYjCpM/fq5OOkYHW353J6qnLbB2UUhD
 FaGSxzBGZPZKX0kvOPhgIXbiNq5OyQFi1P0PhK0UF1o6hqzUgdPRQFzmTNgNHVC6HHLK
 XstAEd112u0w/jx7QTh6mwT2JTxf+nIjFy5Y5n3sbLRj9tl9+NBx8XqdWMwMetgZ8xq/
 NdPZMGZyYIMEjI7IKcCr2WXqVaBLbaHCVImYcoQdNm2PKMUgU9/fzdJkRWjTA0YLy1QL
 6HXw==
X-Gm-Message-State: AOAM530zPFo+LuDONlOz6iqcRnQhN+WYmEGyGaulLfnYI+9XHj0miNEx
 d4VKi2/kvvKX4QOgWauhiYI=
X-Google-Smtp-Source: ABdhPJxG0/OyVGPsxo05cj1vyobVNPAQY/7kabnnro/sX8fPw0qfXwKvZNQeNbkTW+bpPnAoirgHXw==
X-Received: by 2002:a1c:668b:: with SMTP id a133mr48067986wmc.10.1594031512588; 
 Mon, 06 Jul 2020 03:31:52 -0700 (PDT)
Received: from net.saheed (51B7C2DF.dsl.pool.telekom.hu. [81.183.194.223])
 by smtp.gmail.com with ESMTPSA id 22sm24216859wmb.11.2020.07.06.03.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 03:31:52 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  6 Jul 2020 11:31:12 +0200
Message-Id: <20200706093121.9731-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200706093121.9731-1-refactormyself@gmail.com>
References: <20200706093121.9731-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/11 RFC] misc: rtsx: Confirm that
	pcie_capability_read_word() is successful
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

On failure pcie_capability_read_dword() sets it's last parameter, val
to 0. In which case (val & PCI_EXP_DEVCTL2_LTR_EN) evaluates to 0.
However, with Patch 10/10, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided without changing the function's behaviour if the
return value of pcie_capability_read_dword is checked to confirm success.

Check the return value of pcie_capability_read_dword() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

---
 drivers/misc/cardreader/rts5227.c | 5 +++--
 drivers/misc/cardreader/rts5249.c | 5 +++--
 drivers/misc/cardreader/rts5260.c | 5 +++--
 drivers/misc/cardreader/rts5261.c | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/cardreader/rts5227.c b/drivers/misc/cardreader/rts5227.c
index 3a9467aaa435..7a20a4898d07 100644
--- a/drivers/misc/cardreader/rts5227.c
+++ b/drivers/misc/cardreader/rts5227.c
@@ -92,6 +92,7 @@ static void rts5227_force_power_down(struct rtsx_pcr *pcr, u8 pm_state)
 static int rts5227_extra_init_hw(struct rtsx_pcr *pcr)
 {
 	u16 cap;
+	int ret;
 
 	rtsx_pci_init_cmd(pcr);
 
@@ -105,8 +106,8 @@ static int rts5227_extra_init_hw(struct rtsx_pcr *pcr)
 	/* LED shine disabled, set initial shine cycle period */
 	rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, OLT_LED_CTL, 0x0F, 0x02);
 	/* Configure LTR */
-	pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &cap);
-	if (cap & PCI_EXP_DEVCTL2_LTR_EN)
+	ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &cap);
+	if (!ret && (cap & PCI_EXP_DEVCTL2_LTR_EN))
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, LTR_CTL, 0xFF, 0xA3);
 	/* Configure OBFF */
 	rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, OBFF_CFG, 0x03, 0x03);
diff --git a/drivers/misc/cardreader/rts5249.c b/drivers/misc/cardreader/rts5249.c
index 6c6c9e95a29f..2b05e8663431 100644
--- a/drivers/misc/cardreader/rts5249.c
+++ b/drivers/misc/cardreader/rts5249.c
@@ -95,6 +95,7 @@ static void rts5249_init_from_cfg(struct rtsx_pcr *pcr)
 {
 	struct rtsx_cr_option *option = &(pcr->option);
 	u32 lval;
+	int ret;
 
 	if (CHK_PCI_PID(pcr, PID_524A))
 		rtsx_pci_read_config_dword(pcr,
@@ -118,8 +119,8 @@ static void rts5249_init_from_cfg(struct rtsx_pcr *pcr)
 	if (option->ltr_en) {
 		u16 val;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
diff --git a/drivers/misc/cardreader/rts5260.c b/drivers/misc/cardreader/rts5260.c
index 7a9dbb778e84..934aeaeebfaf 100644
--- a/drivers/misc/cardreader/rts5260.c
+++ b/drivers/misc/cardreader/rts5260.c
@@ -498,6 +498,7 @@ static void rts5260_init_from_cfg(struct rtsx_pcr *pcr)
 {
 	struct rtsx_cr_option *option = &pcr->option;
 	u32 lval;
+	int ret;
 
 	rtsx_pci_read_config_dword(pcr, PCR_ASPM_SETTING_5260, &lval);
 
@@ -518,8 +519,8 @@ static void rts5260_init_from_cfg(struct rtsx_pcr *pcr)
 	if (option->ltr_en) {
 		u16 val;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
index 195822ec858e..2b6f61696e19 100644
--- a/drivers/misc/cardreader/rts5261.c
+++ b/drivers/misc/cardreader/rts5261.c
@@ -438,9 +438,10 @@ static void rts5261_init_from_cfg(struct rtsx_pcr *pcr)
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, 0xFF, 0);
 	if (option->ltr_en) {
 		u16 val;
+		int ret;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1951C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864A42078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zwpj17R4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864A42078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78F3D8623B;
	Sat, 22 Aug 2020 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nt-av6R4J-bh; Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C7A1E860B2;
	Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B462EC07FF;
	Sat, 22 Aug 2020 21:04:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D08ABC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BAEC2883B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t4YB7cV83EhZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AA9B0883DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:04:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so4934693wmc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DI3JwahrLu9ezBr+ZyJ6hG9Eu8dqn/pQ2JGoUnbEtII=;
 b=Zwpj17R4kqrgJHbPHzQKZfu9tMz+vlXbdSMcd3LbZSeQ3Ul99Qof/DPwGOYyHw9x2g
 ZmmxBqf9pk8Qm4Vdj3PLSLKMdZyValxLbAKCA/TCdbC9iqc3fvA+kKGENqGT+U8Mfj3Z
 GQIElenuqs0KWQ93Tx7AxRaolHiLI9QDQt03q9mAEG+Nmh1F0xkuCf5+W1RHTGefOQNK
 QXhy8SlOwFjBi967GAEH518S4lv+LYKjCElRpSduFD3WvJi+kGbIsCa005AZlVj2FHlo
 GuPMKS+rUT1K2GYBIJePDZlAWcOJlbnvFJ3vzHJ/RfPcWU1euJ2YeC7YQ22ExT1kXH/6
 0QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DI3JwahrLu9ezBr+ZyJ6hG9Eu8dqn/pQ2JGoUnbEtII=;
 b=jcOK/5LqHsg9Ux083umOzQ0e8AHnDKn14f5PaNwN0/uHO+6QGL3fKOa7a0AN5hucG7
 hoJFYQCM4Bhycbkw0pecQbiMLe+xuxAidvcfsKVtqfA1AEb4B5GYMeA/U/xG9JiWwaCK
 MCSRme9qavAE1aUlfRR3hhTnZDRhLhhcAjjL0gaMJqFZhsh5IJCxUbZiWGCkEA5LVLrX
 DE/c8hC5/hKtdsV+0BzexaBPz6ossqzA+R4IGqqQs+jk9zPkUy9c9s51ZihSyS5GgPnx
 vb4/JwIoLlkG9eVcAa2iXdNBlg2/4uKF19LQNIE9udX/95+JvyQQShaEY2tRL72E3/RX
 MU+g==
X-Gm-Message-State: AOAM533XvuzhuJxJGxg3D2AvCnrSorMoK6i0vkphK6qX3zyiNB2rBND9
 XMAq9TIiEQstSbGTZ7OeuBPiNkdGr2HTpA==
X-Google-Smtp-Source: ABdhPJw/vq0sE8jrwri1dj/Mof1qVjZ1KIzNroD+n2qCu2UTMTpF+6kkwDhcyddIrAmSIxrEgl/eKQ==
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr1505923wme.116.1598130242142; 
 Sat, 22 Aug 2020 14:04:02 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:04:01 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:56 +0200
Message-Id: <20200822200358.252967-22-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 21/23] PCI: Remove .downstream
	from struct pcie_link_state
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

 - Remove initiations of pcie_link_state.downstream
 - Replace all access to pcie_link_state.downstream with 
   pci_pdev.downstream
 - Remove pcie_link_state.downstream

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 244b28534e7f..dd21c17296d7 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -43,7 +43,6 @@
 
 struct pcie_link_state {
 	struct pci_dev *pdev;		/* Upstream component of the Link */
-	struct pci_dev *downstream;	/* Downstream component, function 0 */
 };
 
 static int aspm_disabled, aspm_force;
@@ -419,7 +418,7 @@ static void aspm_calc_l1ss_ctl_values(struct pci_dev *pdev,
 	struct pcie_link_state *link = pdev->link_state;
 	u32 val1, val2, scale1, scale2;
 	u32 t_common_mode, t_power_on, l1_2_threshold, scale, value;
-	struct pci_dev *dw_pdev = link->downstream;
+	struct pci_dev *dw_pdev = link->pdev->downstream;
 	struct pci_dev *up_pdev = link->pdev;
 
 	if (!(link->pdev->aspm_support & ASPM_STATE_L1_2_MASK))
@@ -471,7 +470,7 @@ static u32 get_aspm_enable(struct pci_dev *pdev)
 static void pcie_aspm_cap_init(struct pci_dev *pdev, int blacklist)
 {
 	struct pcie_link_state *link = pdev->link_state;
-	struct pci_dev *child = link->downstream, *parent = link->pdev;
+	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
 	u32 up_l1ss_ctl1, dw_l1ss_ctl1;
 
@@ -595,7 +594,7 @@ static void pcie_config_aspm_l1ss(struct pci_dev *pdev, u32 state)
 {
 	struct pcie_link_state *link = pdev->link_state;
 	u32 val, enable_req, ctl1, ctl2;
-	struct pci_dev *child = link->downstream, *parent = link->pdev;
+	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
 	int up_cap_ptr = parent->l1ss_cap_ptr;
 	int dw_cap_ptr = child->l1ss_cap_ptr;
 
@@ -679,7 +678,7 @@ static void pcie_config_aspm_link(struct pci_dev *pdev, u32 state)
 {
 	struct pcie_link_state *link = pdev->link_state;
 	u32 upstream = 0, dwstream = 0;
-	struct pci_dev *child = link->downstream, *parent = link->pdev;
+	struct pci_dev *child = link->pdev->downstream, *parent = link->pdev;
 	struct pci_bus *linkbus = parent->subordinate;
 
 	/* Enable only the states that were not explicitly disabled */
@@ -786,7 +785,6 @@ static int alloc_pcie_link_state(struct pci_dev *pdev)
 
 	INIT_LIST_HEAD(&pdev->sibling);
 	link->pdev = pdev;
-	link->downstream = pci_function_0(pdev->subordinate);
 	pdev->downstream = pci_function_0(pdev->subordinate);
 
 	/*
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

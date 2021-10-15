Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1026C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697BE61181
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 697BE61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 421C4405A4;
	Fri, 15 Oct 2021 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PmzARO6qcBa; Fri, 15 Oct 2021 14:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 41E7E401BE;
	Fri, 15 Oct 2021 14:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B215C000F;
	Fri, 15 Oct 2021 14:46:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76C5C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B59F840586
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3MYHr_eqaPe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ECD8401BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:46:37 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id v8so4411393pfu.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F90TVLLbkkjlFTZkt/NbI81qyTfS7mybpJeR5bN32UQ=;
 b=l5ELkb75e7o0WqRg7nGZ9P1QoeNbxsEGVGFrefZQ/ppVbqiJYC1+5+OpX+KkPqFvDw
 aLGb7yL88woVFnJUuNdXLXM7/DxVZSEr3pByuWd9EGz3SqrwAmcg4h7rmKL/gbbcU0zp
 uoZZHfztxBoQquCz1RWFxPrkPirdb0uzbp761KgtQfLB2JNySaD7mQrZb/q63HLuptZQ
 JhXsY4Ao8rLTq8UORVBZmUs3ULDA+EZXHAvFjKbAho7UaV76oaiIW+HqibjGA/wtr5hc
 xcrfviYyAtIJbjobyVBkN/6OhUP05e6UwqOO42UDz+MHh8hLguqcHg/lLcyMMeEG6cOM
 LZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F90TVLLbkkjlFTZkt/NbI81qyTfS7mybpJeR5bN32UQ=;
 b=mP4E0RqQN8QXEg+MIcJLVbQMnp9WV4QmpIVGz4+sdmaxoJNx6zVjwqfhs0yzcI/vK/
 v39zlw4lDX9yyvTxaJ/o4H/Gk5fCMCKLJO9jx2R0K5G0nafQvwuNa01R71q4+qZRZFJs
 VY2CO7oGc1Rl9D9aiULGw6OBsZLhVrPg2bWksJWvhqO4e2XfsAVYHyKRRMGboykNRgud
 YqFlTvSlGHghanktaODdi4hXxHKXjJrEgsHeEHQS46ksIvLSmlBb4lxlrFm8b7n6yQ/I
 qCmaageXEIMnlJX+ognViN07z+nHBDGs3/5YwvG4fzSaffjjDjyxoKVatk72N8iUWGUK
 PhoQ==
X-Gm-Message-State: AOAM532AuKlKj2iDvlmBC9xC6ME4c1It527xe0D/oefywGan/4C0ALOe
 Jl5+oRyWbfAHF/vvDmgZzl+ybkSnZYcRDxJu
X-Google-Smtp-Source: ABdhPJz6U9ZR5U059i2Q3FPT+1FmSwYKHMAJz8o9+XAViweLN28SbAcTm8y742+h3/UXopkv6XeChw==
X-Received: by 2002:a63:590e:: with SMTP id n14mr9425002pgb.434.1634309197420; 
 Fri, 15 Oct 2021 07:46:37 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 f18sm5293491pfa.60.2021.10.15.07.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:46:37 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 21/24] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Date: Fri, 15 Oct 2021 20:09:02 +0530
Message-Id: <dca18849c7f51d9e7944abe910548e07d9ddaced.1634306198.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634306198.git.naveennaidu479@gmail.com>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/hotplug/cpqphp_ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
index 1b26ca0b3701..d5274b9b06a5 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -2273,7 +2273,7 @@ static u32 configure_new_device(struct controller  *ctrl, struct pci_func  *func
 		while ((function < max_functions) && (!stop_it)) {
 			pci_bus_read_config_dword(ctrl->pci_bus, PCI_DEVFN(func->device, function), 0x00, &ID);
 
-			if (ID == 0xFFFFFFFF) {
+			if (RESPONSE_IS_PCI_ERROR(&ID)) {
 				function++;
 			} else {
 				/* Setup slot structure. */
@@ -2517,7 +2517,7 @@ static int configure_new_function(struct controller *ctrl, struct pci_func *func
 			pci_bus_read_config_dword(pci_bus, PCI_DEVFN(device, 0), 0x00, &ID);
 			pci_bus->number = func->bus;
 
-			if (ID != 0xFFFFFFFF) {	  /*  device present */
+			if (!RESPONSE_IS_PCI_ERROR(&ID)) {	  /*  device present */
 				/* Setup slot structure. */
 				new_slot = cpqhp_slot_create(hold_bus_node->base);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

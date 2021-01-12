Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BDBC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:13:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7D422D2C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 08:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD7D422D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F60E86C3A;
	Tue, 12 Jan 2021 08:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZELmlJhbLzl; Tue, 12 Jan 2021 08:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C442386587;
	Tue, 12 Jan 2021 08:12:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C71C088B;
	Tue, 12 Jan 2021 08:12:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B5C2C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7279986845
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SoE4jaSL5cZg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 75EF586841
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 08:12:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2so938153pfq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 00:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L2l6Rr1xN13fWChpqtRLf7qClNmYDaja3N/aO2Ct6fU=;
 b=J3ZLmDpu8FL3lT7WITcZlFarpkLVi/PFlw3OmqkZwP5yGPBiVyDF0xak8+32mvvcnq
 0/RWOC/JYi34v6SDdJLQhNbsdGO7X1u50r4UllA8tt9ztM5/Z1wYIbarLgIfRijuJCW9
 cDtqhJMuwcNGGCKMNek3vnF/yq+uuAosvYZG1dcmbGR8Hu++GOOfLlRHr+nOX7mqyFhh
 OS/62D1YvPcK+i80wG8Dt0HkeMzz2wimSexoKTr05O/+VipVqaDJFuNKDm1xSTj0B/PG
 9PkpTXeTDf6kZgA81wbxzauOoi8J6f19mkHyyzZaOS9a/8aWsXVshpeB1YruwCIW2VSr
 3Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L2l6Rr1xN13fWChpqtRLf7qClNmYDaja3N/aO2Ct6fU=;
 b=QC+IWoq8RkYX0EuN6RZMG8H6PN9GQh97PvEZG09pU65Hb0lP+UxrYSCDQ+kxc690fN
 VbYaVP79xOeGzWR7I+ir7yFwUqLE+05lH0tvmTrSvxnl72AYA/gcAOJ/4AtkL9OuHTxD
 86arKtPvPx/vDIzIDy9iX5vS36SUo9d2F48rnQJ7ReWmI2gdSUgd/wYZD6pwypKEvIuM
 AhiK6yLgmM+/GyDO65O15aKsgoL0OUbnPPvNYdH6qK4TcaWAT3lQKEMz9ykWFzHmT9qx
 4bUZyHtURKrKC3zHfUoL7AAMa2aR1SKbU6sADRhS4/70DIbYFv2RLsBboNuBKwo9bKSJ
 Vikw==
X-Gm-Message-State: AOAM533wMnYo7HkUktQMqrCYp8LoBAFLUs4vGWr1TCbVMnkdEttNDfs+
 lYL/rDHQFno9xbtdgofR/Ig=
X-Google-Smtp-Source: ABdhPJz9J9f+9rKMUoT2drjKhr14BDBiNqjedY6nxz2BjkFex49ogtVZaUc6QVrN90NaBkCiaGxTkQ==
X-Received: by 2002:a63:3549:: with SMTP id c70mr3588502pga.361.1610439173993; 
 Tue, 12 Jan 2021 00:12:53 -0800 (PST)
Received: from varodek.localdomain ([106.215.30.102])
 by smtp.gmail.com with ESMTPSA id l2sm2152381pjz.27.2021.01.12.00.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:12:53 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, David Airlie <airlied@linux.ie>
Date: Tue, 12 Jan 2021 13:39:21 +0530
Message-Id: <20210112080924.1038907-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
References: <20200717074937.296192-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] char: use generic power
	management
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

Linux Kernel Mentee: Remove Legacy Power Management.

The purpose of this patch series is to upgrade power management in char
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.2.0
    - allmodconfig build: make -j$(nproc) W=1 all

v2: patch-set rebased.

Vaibhav Gupta (3):
  amd64-agp: use generic power management
  sis-agp: use generic power management
  via-agp: use generic power management

 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 drivers/char/agp/sis-agp.c   | 25 ++++++-------------------
 drivers/char/agp/via-agp.c   | 25 +++++--------------------
 3 files changed, 17 insertions(+), 57 deletions(-)

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

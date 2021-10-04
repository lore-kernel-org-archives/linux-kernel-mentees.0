Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50136C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047D361360
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 047D361360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C224961B81;
	Mon,  4 Oct 2021 14:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdEDnmaHzlBJ; Mon,  4 Oct 2021 14:30:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBC0461B79;
	Mon,  4 Oct 2021 14:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5994C000F;
	Mon,  4 Oct 2021 14:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69432C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B3B6415A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PH2cAuJ9ACbt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2394D414BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:30:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id b22so21613pls.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rr106+TYNeK97taV8nJ/RZEy+nuSWL8bqPL/aoVjRQ=;
 b=dCrrsJvny+hB8TpVDzPJqM5XRNvg99gIyL7pccDv7Hg1idhKdsZXpuRzIqSm3k86wK
 6EpxKp5R2n/dSTSd3atPrxHHsbxx+oe4QOD9qiSAZBylCjJ/UaJEVRxwhOYJgvYAEwCg
 0CzNm2RlWEjNdGNgA4/UBYBB3yQNWWFADdfOlPRfJZb4Qwn7xV0cLfa/mnbiDSaE2V+A
 J145kLAi1Edyeub2jRxpLg3PP5yJ3pq/1p63zI+4MvIcFjEoGjPVtz07Vu1hRTxdft0L
 IhSYV9nXW/pt8qQRW7/qijuCW/9s3fZ74iEFxxUI/5U3H+UOjySRtoIH+mIODSuiBZhB
 G++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rr106+TYNeK97taV8nJ/RZEy+nuSWL8bqPL/aoVjRQ=;
 b=j9EWXFCYVYmts7iEVyWpMKs+pkdJeqO6ugUgnkG9Nw4I4nvRGZxNreUVXMEftv1oL6
 woFITgnl0LwUrYyo5XkqUnln8CwsDtCHvv48Mg/wBWLS4EKFKMMXVUwEgkioaC9tybVL
 YhXH6EX/8CoKX1Dt1tDVH3fKDRiRxQKZ2sXxNhThPangtsiVuPCDVtlLVQStQqeAwoDI
 eY4rctHBqpTlqnlT4SasRuJRp8i1w+12X7sdoyWP83qxyYKKf5eS/rZO/eJ6vhfvgFhM
 QhlNRUaifZ2gP7JRiwu7L4h+7UtQwK1pPXE7da4FSOUrkZKUfJoZPiFPtPmB+pyL6JdS
 BBnw==
X-Gm-Message-State: AOAM533RIbYT/mnGi/pRFC67+VCENeJGm5uwYsf66UrW1Y312oorvtEJ
 hy1JEhZMKFThT90cvN0NCTc=
X-Google-Smtp-Source: ABdhPJw6PldeGsjV/EL0pdYEviOaQ4rPP1DQowLQR2PYIHQgBZUm1Hnv61uEdepS0yhN1pwijPziZA==
X-Received: by 2002:a17:902:9689:b0:138:d2ac:44f with SMTP id
 n9-20020a170902968900b00138d2ac044fmr23336055plp.85.1633357836449; 
 Mon, 04 Oct 2021 07:30:36 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:30:36 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 0/8] Fix long standing AER Error Handling Issues
Date: Mon,  4 Oct 2021 19:59:56 +0530
Message-Id: <cover.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

This patch series aims at fixing some of the AER error handling issues
we have.

Currently we have the following issues:
 - Confusing message in aer_print_error()
 - aer_err_info not being initialized completely in DPC path before
   we print the AER logs
 - A bug [1] in clearing of AER registers in the native AER path

[1] https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/

The primary aim of this patch series is to converge the APEI path and the
native AER error handling paths. In our current code, we find that we
have two different behaviours (especially when it comes to clearing of
the AER registers) for the same functionality.

This patch series, tries to bring the same semantics and hence more
commonanlity between the APEI part of code and the native OS
handling of AER errors.

PATCH 1:
  - Fixes the first issue

PATCH 2 - 4:
  - Fixes the second issue
  - "Patch 3/8" is dependent on "Patch 2/3" in the series

PATCH 5 - 7
  - Deals with converging the various paths and to bring more
    commonality between them
  - "Patch 6/8" depends on "Patch 1/8"

PATCH 8:
  -  Adds extra information in AER error logs.

Thanks,
Naveen Naidu

Changelog
=========

v3:
 - Fix up mail formatting and resend the patches again.
   Really sorry for all the spam. I messed up in the first try and
   instead of fixing it well in v2, I messed up again. I have fixed
   everything now. Apologies for the inconvenience caused. I'll make
   sure to not repeat it again.

v2:
  - Apologies for the mistake, I forgot to cc the linux-pci mailing 
    list.Resent the email with cc to linux-pci

Naveen Naidu (8):
 [PATCH v3 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v3 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v3 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v3 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v3 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v3 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v3 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v3 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 265 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=dZTT=OZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA33CC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2F161381
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B2F161381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5C4404BF;
	Tue,  5 Oct 2021 17:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KVgWpvfzNdh; Tue,  5 Oct 2021 17:19:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE52404CE;
	Tue,  5 Oct 2021 17:19:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 475EAC000F;
	Tue,  5 Oct 2021 17:19:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B95AC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D47FF605FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucQgQnI0wOMZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 103E560C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:19:00 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q201so7750936pgq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Oct 2021 10:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQT+mDvkkQCJQfW4l8MXueOtWGmReSv26PNLqJ69eIE=;
 b=SAKUQo0n36vAvd2dP1867PQKEdhRlgvmbuzGuIjn6ExEt33l2DZ+FZeddFfsxZhPoN
 pE1xkI3/fiwkKoL3lO3xSRKeT39B5otGFTRCa9aZtDn1KSLn8LY32Q3jEUGqnrGQhrRf
 FEtTYTJWYMEm+plrrqi7vMw6tb1+3M+HUHAEaCbcIwP/maFCEilzUAFRDi4o/D4gskpb
 dHH2tz7jl/EJDxM1lPpu8WUPW8FJtFq2xv+1kXuWmLX4IEXmoFtix8X8sQDIXBkTXUg6
 X/01cjlj1ILLP2ZCI0eSAjTkX/SUAk97sQ0ISZoae2hjQQVoyJioUA2bq18o/TxQ8bFD
 viIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQT+mDvkkQCJQfW4l8MXueOtWGmReSv26PNLqJ69eIE=;
 b=7j5wKe9RSjlEHI8+mImfEkR4CpWVQAYdvLADcQuEu5JWixcxqsOjZ0jPLoPIw6HBMR
 lGn5mXDCQt7zoaae3gt4u47H1vaExwreY2aW1hBt2M5NaxkzYBB8stYKJNZx8yEhkMPD
 ubdf5I438w3dbTSjPEWQ+RxdH3Me64HdnEPe6XK6MJ4ta/zUHb+D/ACkwUG/WLvKIqez
 mYf3yXuy4EQQayeIjFJOQ9L1cgfXZSRA8Yb8KiE5nFU9E7Zo1EkwC/Qzf4f5EoLoiJ+B
 MGz/hDH+Em9uiNvHWDQPHD+2tb0dbqDBqcKKLfGAqli6p/7R16dLJuwjIY7PAig7t3nZ
 G3yg==
X-Gm-Message-State: AOAM533C6R8cdF81WA+Menwy9GzzcY+UyHfbUDmYxQ31D/RERkiuYmPW
 rW2C1FuAHRaqUpJq3A/7/7Q=
X-Google-Smtp-Source: ABdhPJzEWfjabqzm399k9sgiMDMfZMs8fGUj9h1G1NasJnjVQm0jliPuqYwmVa/JBUHJf7aVDXzsGQ==
X-Received: by 2002:a63:5717:: with SMTP id l23mr1322508pgb.87.1633454340207; 
 Tue, 05 Oct 2021 10:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:18:59 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 0/8] Fix long standing AER Error Handling Issues 
Date: Tue,  5 Oct 2021 22:48:06 +0530
Message-Id: <cover.1633453452.git.naveennaidu479@gmail.com>
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
  - "Patch 3/8" is dependent on "Patch 2/8" in the series

PATCH 5 - 7
  - Deals with converging the various paths and brings more
    commonality between them
  - "Patch 6/8" depends on "Patch 1/8"

PATCH 8:
  -  Adds extra information in AER error logs.

Thanks,
Naveen Naidu

Changelog
=========

v4:
  - Implement review comments
  - Make "Patch 1/8" commit message more meaningful
  - Fix the code comment error detected by kernel test robot 
    in "Patch 6/8"

v2 and v3:
  - Fix up mail formatting and include the appropriate receipients for
    the patch.

Naveen Naidu (8):
 [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v4 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v4 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v4 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v4 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 269 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 209 insertions(+), 101 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

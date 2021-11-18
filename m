Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7903C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 17:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649946141B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 649946141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BA4F60792;
	Thu, 18 Nov 2021 17:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSyAMi_kg9GB; Thu, 18 Nov 2021 17:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B585606C9;
	Thu, 18 Nov 2021 17:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A930C001E;
	Thu, 18 Nov 2021 17:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B5E8C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 17:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E0F4036A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 17:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PLh_yuOUPDS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 17:19:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 595D440369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 17:19:13 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 28so5956683pgq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 09:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ouDQlk5zP/VXAJVsTu5rp4BRmgexGWzx5mlwojfemqc=;
 b=U4kbcX15gvaWqE8KhuqMkEpRudV6Qdtb81j0UvxOntWtT4KLFSkbOn2p0zqzHQfM1w
 1B6Koj+zmv5GDJcyTUKKA2KVQ8dJe+Jj82xx3f8nPA+oPegZXmVCe1dzoI8qSJbZsviH
 hGnyTtq82W5qMyDDtYrwDhQJUO8g/2XWUgQLoZ51rJt7q/ziKybUz4BRl0NPwV5w5bMt
 RT177gzHnsuBLarSXhczjOAXwinHFX6b/g0XqtZ54jJja9Mx+nuXUkx+ZsgdCTu+Ia3r
 nb/fspMloJ7PNSSphBjM206T3FUmqUuoZlPDzjgbDslBiQcY1/VlqaZ1sTd+2px+C6/0
 UZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ouDQlk5zP/VXAJVsTu5rp4BRmgexGWzx5mlwojfemqc=;
 b=jeHFBu0AbnkTewXa3QVSVEnJzfxlnD0KBU1kwkS1jcCxJXozD2nqm3UuRBNi0uDvzK
 0M/HaKtneacrYAG6ikLByMVoI4kECZA+hwiVSmvOXyucyQDNMqNsgEaqKPpLFe4pdHCt
 7/NAKWnK9Uql8qIlzWO/F/RcvPO3wF8BzxlC4rBnTxtVboUDlv+5rh+chdS57jAYImAi
 5BsRk7Im2u9T4IGjNBNOa1uZJDUCrB2mpMOLiMZGgGdjlpO8mx8ZgRIGzEz1UbF0wrXj
 yAVfgEcX3TXgpwXe4ZXdS4HKRRrFNmGPaTwA8cQZvCD556W6fs+HLoS8Tx5+k/24udbf
 ILqw==
X-Gm-Message-State: AOAM531IsMDXS44osMSKHlb0T8Vl9T9Q0WUwECCicSOSVqPV2XzBbCj6
 WLtUp9yrwUsB9ETDoJmZMeQ=
X-Google-Smtp-Source: ABdhPJwO0ITyNRj+mvPgJqS/+PgQh3J1f7sJBQ4UVI/GSsPPZalXjYjmutxdKmG7qxXQUYyQVYhUsA==
X-Received: by 2002:a62:4e0a:0:b0:4a0:4127:174b with SMTP id
 c10-20020a624e0a000000b004a04127174bmr16706105pfb.41.1637255952588; 
 Thu, 18 Nov 2021 09:19:12 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 u32sm191283pfg.220.2021.11.18.09.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 09:19:12 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 0/1] PCI: Initial KUnit test fixture for resource assignment
Date: Thu, 18 Nov 2021 22:48:50 +0530
Message-Id: <cover.1637250854.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

Currently it's hard to deubg issues in the resource assignment code of
the PCI because of the long reproduction cycles between the developer
trying to fix the code and the user testing it due to the lack of
hardware device with the developer [1].

[1]:
https://lore.kernel.org/all/20210621123714.GA3286648@bjorn-Precision-5520/

Bjorn, suggested that it would be really good if we could have a test
fixture for debugging/testing resource assignment. 

The patch attached along with the cover letter is an attempt to lay the
foundation and also have a proof of concept to show that it is possible 
to have a test fixture to debug the resource assignment code.

Since there are a lot of things which happens during the resource
assignement phase, the first version only tests the __pci_read_base()
function since that was the most easiest to set up.

Hopefully, in the future patches I'll be able to write more KUnit tests
for the other parts responsible during the resource assignment phase and
get closer to the goal of having a complete test fixtures :)

Thanks,
Naveen

Changelog
=========

v3:
    - Rename init_registers to init_test_registers 
v2:
    - Add test cases to test resource assignment for Type 1 devices
    - Fix a error (a function was not static) found by Kernel Test Robot

Naveen Naidu (1):
  [PATCH v3 1/1] PCI: Add KUnit tests for __pci_read_base()

 drivers/pci/Kconfig              |   4 +
 drivers/pci/Makefile             |   3 +
 drivers/pci/pci-read-base-test.c | 803 +++++++++++++++++++++++++++++++
 3 files changed, 810 insertions(+)
 create mode 100644 drivers/pci/pci-read-base-test.c

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

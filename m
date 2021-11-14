Return-Path: <SRS0=7u83=QB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A35C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Nov 2021 20:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854BE61056
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Nov 2021 20:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 854BE61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45465401FD;
	Sun, 14 Nov 2021 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CBl-4WeQpAX; Sun, 14 Nov 2021 20:09:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10F7840001;
	Sun, 14 Nov 2021 20:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7BD3C001E;
	Sun, 14 Nov 2021 20:09:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66A4DC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B5680BAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwQAr6bc4OBK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 20:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F33080B9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 20:09:23 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so2012461pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Nov 2021 12:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Nj+oxSX/c3z55ECc6E1sqG8puAX/WDZIVVJffo9MIU=;
 b=IuCl7VIm2KIapGhBYDwqQraU2CCe8kI2wOVKMMb4/TueOPYH0p/qni4XBxWevydhM3
 yat9GBWYNNtfvFuxCN56xDOf0O44GUSE4XyVcq4gqGFcHIeNBduVB7TpgLvxhJSYh2rt
 oYCfH9tfK6JidnW3E4ashRn4POqA8g/qMcYbs1XYBh9TOtCcrw53nSF3/uJ8fHyFw347
 wKMg5nhy6H87qEdY9jYXD0dkWkVvG/zPhJKjQQCyBt5H2zGYOYBtxbZBxlXVumZLqTkK
 uc750RhkMpxz03fT00tQ20I+qqxl17t3Qdb4kgWcbRvekWBb/eazkRFObjBbnVyNsPos
 p2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Nj+oxSX/c3z55ECc6E1sqG8puAX/WDZIVVJffo9MIU=;
 b=6DsTMsnXBjBH+UeyaRkWjQR1Aa8eC9SU+PQ7all6buxXK+ElUjxHxUq14nEURVG4xw
 sAf0puf47m1hMcwWGDigL7PRljOsWzG/FQV3cHtkDuyW1oGrCg1n0pPtEOCw8sWZdmoU
 aghPwyi24Wb+LPI7UmoLTcuGjp5uoVDtwO1w4r7Tw5ePm5MxDHz6QTgxblbeGtG3UmYS
 ooQrNf//NCIMpZyQCqCn2iBFB8Loi1GNt+PajDHEqhrO7tHZNKabZidlsxssAK2MczHA
 Mw5w/OcF/fJAEBF/2gMEX30w9IpIgqoa2stI9IlCTKyM6uXKBLfRgD5wo+mIW8MMznFm
 rb5g==
X-Gm-Message-State: AOAM531rWIqjHKWcZTYMAOcDOtQ/WeWjdi7gxhKoCTrwni5OpFYA/4Xv
 jI3ptxyJSn3b5Tb5popeU5o=
X-Google-Smtp-Source: ABdhPJwuJ+OxtBtDWYllww/wd9EdAd7SjOmtJN4Sh7D5MNzQjMSbfpRQg1nv/5+aexHdRUQazD21yA==
X-Received: by 2002:a17:90a:8043:: with SMTP id
 e3mr41373127pjw.130.1636920562867; 
 Sun, 14 Nov 2021 12:09:22 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:9777:151e:e959:105:10d])
 by smtp.gmail.com with ESMTPSA id e7sm9737869pgk.90.2021.11.14.12.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:09:22 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 0/1] PCI: Intial KUnit test fixture for resource assignment
Date: Mon, 15 Nov 2021 01:38:45 +0530
Message-Id: <cover.1636919579.git.naveennaidu479@gmail.com>
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


Naveen Naidu (1):
  PCI: Add KUnit tests for __pci_read_base()

 drivers/pci/Kconfig              |   4 +
 drivers/pci/Makefile             |   3 +
 drivers/pci/pci-read-base-test.c | 740 +++++++++++++++++++++++++++++++
 3 files changed, 747 insertions(+)
 create mode 100644 drivers/pci/pci-read-base-test.c

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34CCC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AACA21527
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 21:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtyiMQyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AACA21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1A5286F58;
	Fri, 19 Jun 2020 21:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXqddU7iAZ_L; Fri, 19 Jun 2020 21:12:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9285686F35;
	Fri, 19 Jun 2020 21:12:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 851B5C07FF;
	Fri, 19 Jun 2020 21:12:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53C15C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 24F0928940
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8m9j+SHoVHTt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 02B3027E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 21:12:01 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id gl26so11615927ejb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KIfMPBwAbPyXpMZbtJoCaGsnNqfMLuSMLpP/STnWlzg=;
 b=LtyiMQyp/FFZubW5+D7Foysbwwy85DTvqClszgRgNmhLcYvR65lWt8fkqGyfDY8Tqa
 VDBkQZ3ADigK7DYgxlj93aUYWUVZnlPrlhP9Lt4lv3AK3SZ+9zoQxf7zu3pUUQMak3Ro
 fUf9nmwlXLRmY3tb4ZXnV03Vh0/JmlzfjyPJcmWGFOEhijyPYte7h0AjlrUXJmgeF0Oo
 rWWi3GdVA8skQgoKRyX3oCVYLxRuI5klFVgEuVJFlc6KRgG5vJNHL0Vs1StzSGYnzHK3
 JvhhEfNVbUnysBFzTnLzB024bU2F55p6VO8WWnpHAsZV8YIIQPvfThIjqt2vFuklQzqj
 0PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KIfMPBwAbPyXpMZbtJoCaGsnNqfMLuSMLpP/STnWlzg=;
 b=IMaXYBRIZuC1aXpfSObVrWvI+H3+iNFfdMbqjLT1tPilheDPY/i263xxB4b5FwTTyj
 dCgfHRqxW3DbvHbWVATy8Oz0GbbUTk7NYpt+ZatJC+PE6Vf+wFJIJz0iAD0ebM/RXzdM
 MrhF2a4Tp2RbMjUsw8z72FBmAoDpzgNkDuk3Asz2b3xNWaYoJILToy2K1C47CDZo8ao4
 tCsQQJmWJKeSlP5VT53IEYsK/0cMuP2MDhd0Tm0ytvhIxDNxVjRAn0koREfBQsN1iA61
 zWt26Mf68qtYmqh5h1YVuVwfHuLDsKJ9ZkZV7y6xMQUWvM9BQ4DrjAsu8srz/fg96qiS
 1+FA==
X-Gm-Message-State: AOAM5336tZ8tcGgPVOz7aWDJx4uqkSu/AGi0D+ajDb/n0s53GOersQaf
 mDbrzaGRpid6VyJ/pFOHrTI=
X-Google-Smtp-Source: ABdhPJz6Lh9pbDU8TDSe05ow1YOmWrdksOecxfmIJQTZzGP5k+kRD6mBrTHQAq1DsYbFiHN/vcBdEQ==
X-Received: by 2002:a17:906:adc7:: with SMTP id
 lb7mr324566ejb.302.1592601120219; 
 Fri, 19 Jun 2020 14:12:00 -0700 (PDT)
Received: from net.saheed (54001B7F.dsl.pool.telekom.hu. [84.0.27.127])
 by smtp.gmail.com with ESMTPSA id kt10sm5485833ejb.54.2020.06.19.14.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 14:11:58 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Date: Fri, 19 Jun 2020 22:12:17 +0200
Message-Id: <20200619201219.32126-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] Fix wrong failure check on
	pcie_capability_read_*()
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

On failure, pcie_capabiility_read_*() will set the status value,
its last parameter to 0 and not ~0.
This bug fix checks for the proper value.


Bolarinwa Olayemi Saheed (2):
  PCI/PME: Fix wrong failure check on pcie_capability_read_*()
  PCI: pciehp: Fix wrong failure check on pcie_capability_read_*()

 drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
 drivers/pci/pcie/pme.c           |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

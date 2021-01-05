Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA3FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144EB22240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144EB22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8CAD85F5E;
	Tue,  5 Jan 2021 13:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gk10pi6IR4DO; Tue,  5 Jan 2021 13:10:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9FB685F37;
	Tue,  5 Jan 2021 13:10:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0309C0891;
	Tue,  5 Jan 2021 13:10:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFE3CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D6F7E87103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqRAfx9oUQKb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4FADA87119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:11 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 22so26296391qkf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQhTpfYHLDRwx3w40/HeUR0qSHC2BNRF9Xp53fgaufk=;
 b=K+asJL/sTwQZVtAsg4jvOYGxL8o5zGXDs2BXdUyusYKz7dzf7YPyRzg1LcDq6MsY1h
 ZYI6DLJXK39u/kfja28OWpsXpS1x2R8XSmMYuWSpiqfvCOBnWpU5F3UB3wWJeD8Y4PsD
 O9IKbYeVMhAQ1Oj3qjriwWp5Am8niHdSLgCi5Iid5+6UNDRrawMeapWQIUIceQCrVh2j
 tDBKdG/IYYntP+LnMih+Gbu/2h4HdlnPZfppMBPycLmGymC/q+KtuAYJlIUepuH2Rfgl
 Evly8hJJZxUfPGuRfqjahfc4gtfg42sLwP6xnhtwccrvOwse7vNC0N4eqLwcLslyT8nB
 AYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LQhTpfYHLDRwx3w40/HeUR0qSHC2BNRF9Xp53fgaufk=;
 b=Av8FBr+MOnxXgZLhudyAzES4CQ7y3/KRVVpwrlZ/QEjt1E7ows2ae/S9ubkYR5pV8w
 WPcfMy8y78VMWl15iy9reO+cqSCbjeyASN7pTJIIn7XG7W96283jopjv7OYUwXL2eabR
 gi2LKMacbLs2sZJsFDV/cQTwMdSliGtde15ZQGQHudxoCUIBL48GnGHbM06OjZkCRTKX
 QFNcapUZZhCL8GyIQ7Zkxpiz99gG/A97tK0trsOZZ+arcolKQWurgmgBbpJHu8Efa9oy
 eN8xkw/5ZSBcJbQm3qNgJ5cyrg9BjHQBofxiBLAz+S+SRcvt0kBnoU4W62HyD8dQ43cu
 4tjA==
X-Gm-Message-State: AOAM530yU6tYblaeC8wTOenl2sChspDSTvJc18aeM989KEFF5PCCzKpn
 JfskZ8/WC9vabiLmGUUomwQ=
X-Google-Smtp-Source: ABdhPJyqti8Wjdpymn9SgsBRvjq4h577IxB7RlB68c0Z4cwUomJYOyY3ka0YJ+TsgMDibvf53/CpQw==
X-Received: by 2002:a37:3d1:: with SMTP id 200mr39131698qkd.30.1609852210186; 
 Tue, 05 Jan 2021 05:10:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:10:09 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:09:52 -0300
Message-Id: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 0/4] media: vidtv: add media
	controller support
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series adds media controller support for vidtv so that we can
support this driver at the test-media script in v4l-utils.

I based my implementation on vim2m's.

Daniel W. S. Almeida (4):
  media: vidtv: Add media controller support
  media: vidtv: reinstate sysfs bind attrs
  media: vidtv: use a simpler name in platform_{device|driver}
  media: vidtv: print message when driver is removed

 .../media/test-drivers/vidtv/vidtv_bridge.c   | 32 +++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
 2 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

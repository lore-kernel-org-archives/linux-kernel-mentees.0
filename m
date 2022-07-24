Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EA3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 14:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0330660C11;
	Sun, 24 Jul 2022 14:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0330660C11
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAiepUxK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2jbONNBSpSL; Sun, 24 Jul 2022 14:59:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DD52060BC7;
	Sun, 24 Jul 2022 14:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD52060BC7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F907C0033;
	Sun, 24 Jul 2022 14:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 880F0C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 14:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D4484B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 14:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62D4484B01
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fAiepUxK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhIYMge3HiH8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 14:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C393184988
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C393184988
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 14:59:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gq7so8237133pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xk8QcPITCD7zASInOLa1R0RXzqRXOUwelC1gE/1VxyQ=;
 b=fAiepUxK9sA5DHnLfCj/TTTTGGSmd2m9+OxyFBa/JXmjDXjvRJRTkIHYf8+IyXU2s7
 W1mFhcDj9aed4LSxZ1TmZ+0vZcBGb86C0PT0HZ6IgDBXz2VULXSLqSvYIsLHyE6y4xOq
 /JKdESHnpNg+eRJ2VqzkVs6RjmJUGmcmdVyOUE3MYSiowchwAuY9inpmGVB5hMW9zz8u
 ChzTN0f1d1pFHdsRu6LdBJT4eTrFSUZCMkv6HmDupDcU9Wqd+w/0uymEbFZOnL12YEDb
 5Ozki9IMj0emcV6pQu8vQt95nCbIJgIFXRFwA9BmRaWPPZ+EzltBXdSvBU/1aYxaIUMa
 XFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xk8QcPITCD7zASInOLa1R0RXzqRXOUwelC1gE/1VxyQ=;
 b=hTlz4JBh7VmSsg3W4OuJT+0G5kXpNbV9doxk6u/ilEEpKnmqAVrqTnKJZjZ+/6bSWa
 VVx8+/PPw885qWiVoB7w8QovBtlf4XuUjuWcCBq3T1gJ5qo5IbIrVjN0l+vtst/oG1+K
 2U5+G8RizuRvombTafynD00+5ss+Y089YUMQaRzcKW5l8ueGPaZ9Zhek0PnfT0abnGpi
 enZGHMTchtxlwxYZM2sLlWQEWrhUDXhiNdaTxSO/vgXRFBs58PDHJtuyNH/mozPe/v1P
 b5rJXUWV2KWfiwB0twpum4UiJygHJyeE/rPPhYH14uLpjoC+L0A0Plpl/2NzyyyV+HAs
 k48A==
X-Gm-Message-State: AJIora+bLdcEdm704nU31cwMa19Jltjb2TFK08sR0sUmWfOPO9AVXD+/
 G/MMqdNuyi0JFDtft3F27aY=
X-Google-Smtp-Source: AGRyM1vihI8jIMhLCAgyF58n4D21NvM8f0l7z09f9iCuH5Q7OA5NkCQZV6bc80jT4wquK62eNbfPcw==
X-Received: by 2002:a17:903:3283:b0:16d:43f8:d971 with SMTP id
 jh3-20020a170903328300b0016d43f8d971mr7791901plb.171.1658674790006; 
 Sun, 24 Jul 2022 07:59:50 -0700 (PDT)
Received: from biggie.. ([103.230.148.186]) by smtp.gmail.com with ESMTPSA id
 l16-20020a170902f69000b0016c500fb7bcsm7360900plg.140.2022.07.24.07.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 07:59:49 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: chenxiang66@hisilicon.com,
	shuah@kernel.org,
	liaoyu15@huawei.com
Subject: [PATCH] selftests/dma: Add a .gitignore file containing name of
 executable
Date: Sun, 24 Jul 2022 20:29:31 +0530
Message-Id: <20220724145931.32556-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: song.bao.hua@hisilicon.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>, tiantao6@hisilicon.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The dma tests in kselftests are missing a .gitignore file, which leads
to the dma_map_benchmark executable file showing up in "git status".
This patch adds a .gitignore file containing the executable name.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 tools/testing/selftests/dma/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/dma/.gitignore

diff --git a/tools/testing/selftests/dma/.gitignore b/tools/testing/selftests/dma/.gitignore
new file mode 100644
index 000000000000..668e2f8be2f7
--- /dev/null
+++ b/tools/testing/selftests/dma/.gitignore
@@ -0,0 +1 @@
+dma_map_benchmark
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

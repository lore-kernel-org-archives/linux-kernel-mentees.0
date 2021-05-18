Return-Path: <SRS0=n6YR=KN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BA7C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BA9610E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 May 2021 04:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BA9610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B6D83D5C;
	Tue, 18 May 2021 04:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUBsZHKVeZSQ; Tue, 18 May 2021 04:43:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D00B183D53;
	Tue, 18 May 2021 04:43:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD037C000D;
	Tue, 18 May 2021 04:43:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 465F2C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F2F160671
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdy_iN9XjN1Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A16960659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 04:42:59 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id t21so4400976plo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 21:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/E0260RKAaTuA5t/VJ380T71hV58i1T3oQ6tmg0Xxg=;
 b=ktivBHXXlh0cPeILEDATbuupODCuGEWvSCydB3kAIJyY9rFtwRqyF0c4p5JRRF4vr8
 rr4tast23bJ0v7lZ0I9IuqeBLvmdi6Xw4yxk5lMQq/cfLxZr4P9ixOac96saL+Xr/bzD
 TWKH19Nd/xFjvBo0PbNf1AJCRyf8DSlumkLlWQ9gSY2HDEi31Ec8yNF1P1raIdgO8VXA
 UJZ//D08SuF3VVX8jOAyMflfSL8C+LW3DeqK0fVdGsI8wvlF3lKX+VUuMsJigDXwtFwo
 MxTVLiLmmsxj4TyVDUjAr6OR/jj8NtuNEwgHiLzEpeL8kpISNy7+Qt5UaV5sbjsRf72o
 63sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/E0260RKAaTuA5t/VJ380T71hV58i1T3oQ6tmg0Xxg=;
 b=LoFPoHBn3RDxqAUnHvnU6ofG0EysrmybbHachLWAq40gqwPUPu5eX+xNy/tFHsHJSU
 AjJhQjOiAdu+SovnuzgtNg6v+vmMasFdBg7KRyQhYWWw3oinixiZoomN+sT1z+fLULDv
 a7wEZAZX0FIIp7UDgxD03OVkn3OlKxyjYOA0Hm6yyarIRhXRIvKngsyy69IST73t21Az
 3AuIlCIBBJwYt01RDthRTu6clBIrqp48SIg0odfjn/DSeWoZLgqmLK/6Irn6MtfikXP3
 madZKlDl9QCvTFZFOedbBU0fB7jp8kEU0mHtMTf/1yCS0JUKURIBDIXmcUl9ueL7ki/Y
 NIWA==
X-Gm-Message-State: AOAM532QcPMbVXBxXQrlfnaNuusMh4UmhEH6kv/T01s3NuH2hzp4VXuR
 +w4PDCB9JsCHYEocYtIoxe4=
X-Google-Smtp-Source: ABdhPJzeQmjKwbJOIh35vt/GlskZevTMXjOPZ7992olPxBR9T3iaGQHZyZ4BKIpzU8Nu/iE9IlED2A==
X-Received: by 2002:a17:902:bc48:b029:f2:7db5:4d78 with SMTP id
 t8-20020a170902bc48b02900f27db54d78mr2379827plz.55.1621312978940; 
 Mon, 17 May 2021 21:42:58 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
 by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 21:42:58 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH v2 0/7] Staging: rtl8723bs: fix warnings in HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:12 -0400
Message-Id: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
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

This patchset fixes 134 checkpatch.pl warnings in the file drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c

Although checkpatch.pl reports a large number of checks, these are for issues that were present in the original code. In fact, in the process of fixing warnings, the total number of checks decreased from 548 to 545.

All patches are syntax fixes and no logic is changed. As there are a lot of different warnings, to make things easier to review, each patch addresses a different set of warnings in the following order:

- braces {} are not necessary for any arm of this statement
- please, no space before tabs
- suspect code indent for conditional statements
- Statements should start on a tabstop (this type of warning is solved alongside the previous warning type in the same patch because the fix for one warning addresses the other)
- Comparisons should place the constant on the right side of the test
- Missing a blank line after declarations
- Avoid unnecessary line continuations
- Block comments use * on subsequent lines

Change in v2:
- Patch 7: Remove dead code inside block comment instead of changing the comment formatting, as suggested by Dan Carpenter

Desmond Cheong Zhi Xi (7):
  Staging: rtl8723bs: remove unnecessary braces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix indentation in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix comparison formatting in HalBtc8723b1Ant.c
  Staging: rtl8723bs: add missing blank line in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix line continuations in HalBtc8723b1Ant.c
  Staging: rtl8723bs: remove dead code in HalBtc8723b1Ant.c

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 333 ++++++++----------
 1 file changed, 154 insertions(+), 179 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

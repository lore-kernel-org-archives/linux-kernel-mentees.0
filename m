Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBC5C4361A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 12:50:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AC222A85
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 12:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AC222A85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAE4587C5B;
	Fri,  4 Dec 2020 12:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYUiOZobQmyO; Fri,  4 Dec 2020 12:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F3BA87C53;
	Fri,  4 Dec 2020 12:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1907EC0FA8;
	Fri,  4 Dec 2020 12:50:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 239A7C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 12:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A6E652075B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 12:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5D7VnOE+0jR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 12:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0AAAC2052D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 12:50:55 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x15so3041209pll.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 04:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DD57FdqKvzwHgeEsErQDczkQKGb7EqA/gNqE4pQzGvo=;
 b=nhhy4xNcjBU+ZsCK6ThRgwN5m7SQCOrEpqbE7uaIyAjBemeHMxlY+DvnW2XpUglE4T
 K1MAM+Wz52pLxSzCDHNguP+561RifJr9g45nZcfKW1c6UeroTBfQx8xrI2vzLSgbjJO6
 ZqnOs39b4EH7I+2tCLfUmHLcrtZp+UulssrSFdV8LkXVOYdqzT97CS5NswCEgQeLViwB
 cai44UgQm3mXYYn0DgLFJ1W6IE9TEYAEWLX0+NwMINNGWouNVWSyZCDBLTrStIRrFCIE
 5rjywcTeulqYBPRZEnw4g6KK8rBjSgHCfuka1lVakQa4jSekbr7C3UU4llq7/jf3pVC0
 BsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DD57FdqKvzwHgeEsErQDczkQKGb7EqA/gNqE4pQzGvo=;
 b=erpwHJM0hSIZ3emJ5rUbi+RiG7uEavx9ucG00qMcHP7OetH4iZFdm+yX8nmXPj6lFI
 je6wSPLo95FI+2BMhfUdsRJ4bVUbmc9g7A0kRJtGXxbNfrA6DgbtwIefoUYjpF6rfsbg
 NwcrT9LaAGugE9dSslZ35YPT7zLfJcFnMkTVoGBuc1quOJWLW4mVXPEmWZPeJSESIODH
 K9TH1KZ11f8YpZJ07qwI0V1B72R0IzAnPDl3HXBnut//tTCQScH9TtLCHwSLu5U8wByK
 IH2v9zR4y3y25N24I54pniYB+J1oVp/NaUfrvFJbI4Pp8oV3fovsi9FE0CPhk6SI5osp
 k0yg==
X-Gm-Message-State: AOAM533mwmXGfqCvNiWUfHM7F3qGep48l4xtg1BBrgSCVs5rt56Qng6H
 6pveMDszTqwOgcegiwTQEMc=
X-Google-Smtp-Source: ABdhPJxu34Kb66kNamFUJDS3ZJ3ObtJ9zkjg/4bORE+tMNy9oVYWLvUJuyWiZy+kA4cC6Rn92XnRsA==
X-Received: by 2002:a17:90a:a08f:: with SMTP id
 r15mr3983237pjp.118.1607086254480; 
 Fri, 04 Dec 2020 04:50:54 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43f:b9bb:d059:d26:c75b:b30a])
 by smtp.googlemail.com with ESMTPSA id
 l141sm5585294pfd.124.2020.12.04.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 04:50:53 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri,  4 Dec 2020 18:20:45 +0530
Message-Id: <20201204125045.16740-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMzMq5OemsznzQqVB6wHWMqBFrejDnSU3iznnnF_Jesgrg@mail.gmail.com>
References: <CAKXUXMzMq5OemsznzQqVB6wHWMqBFrejDnSU3iznnnF_Jesgrg@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] MAINTAINERS: temporary patch for
	testing/fixing MAINTAINERS_STYLE
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

This patch is a testing patch for testing checkpatch.pl with
MAINTAINERS_STYLE warning.

In this patch, a random F entry for 6LOWPAN GENERIC (BTLE/IEEE
802.15.4) is added. Also an M entry is added after F

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6aac0f845f34..7937e76f9871 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -178,6 +178,8 @@ S:	Maintained
 F:	Documentation/networking/6lowpan.rst
 F:	include/net/6lowpan.h
 F:	net/6lowpan/
+F:	random/directory
+M:	wrongly/ordered
 
 6PACK NETWORK DRIVER FOR AX.25
 M:	Andreas Koensgen <ajk@comnets.uni-bremen.de>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

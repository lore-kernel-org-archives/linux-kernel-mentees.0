Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12BCC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:07:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E960207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="cXyDHg4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E960207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E03F86F45;
	Thu, 30 Apr 2020 19:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DGHziTci5rh; Thu, 30 Apr 2020 19:07:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97B3786F42;
	Thu, 30 Apr 2020 19:07:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D5EDC0889;
	Thu, 30 Apr 2020 19:07:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C6D8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AE6788804
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xgYG558iiZW8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C27CD887FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:07:43 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e17so5976542qtp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8AiLY8Jx+agzN5y2seIrLqYvcvctf8hMS4XCT7biTg=;
 b=cXyDHg4BakW/zjntd3RnSJFCetFIj31VQCU1kvleuvXtwnusFYS06s78v9XCBEWsPR
 Rb12gH3STnUJLri7F0qha7uZOZQVUfiZUOy+QHzbRNHlHeGmhjr0X3ZWUH3m9+/GqGof
 5hDErphgH7MBfeyqsL6/JIusJ2LIPidxn11mmzFMwCWom1EHzuQA+al0DZN9RNCDvEAB
 ZJ4V4LP2TDESxVa5boJbKQj3OG3BD09b0OwUyJ2BCu0M3L4ZV2T0KCUCgWyJ8u4zVOX3
 LqChc2GcYqLJGg1788YK50Gk6Svdm20KkViMySeEYv9rkpGfBxgOi8MPbn7M7dFdTtPV
 eviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8AiLY8Jx+agzN5y2seIrLqYvcvctf8hMS4XCT7biTg=;
 b=f4yQ/HOolhq5blSGGZGQCQ0+6oggdzgtPyiZUv8FWonCTFdUBOexBW2hb+NWBfCQpS
 24TihWeb0dJiRIMKmjHl7yE2lrwRmTgyPeYbJCJ1Kkesia7kTs7wBxrM07+95RFz+8ek
 qvzTI5sgkWCjYjUqPo5tNUCjL8MZTaT10RldMPKTa+bdJYVQWl3G9ubNz/V+SM/VrU98
 3SjFVlTL64Kx/gFkpj3zJJbeBjIHOOGRu77H2yiJOTTPzRajkNBlIHVlneOS8xkYvekw
 SyCr+nac7e+iPVu2ms+lvtl1LOfsCRci6Q5t8IOoLgf3AIf6u8g2KzE/Qo8jVVMPDl6k
 LrXA==
X-Gm-Message-State: AGi0PubFmPNnj+AxhHSijmQlnZG2YKGNymhXbZkNsRckvEFnjVmHs0ZI
 rXhdiYXzjMqBKUE2iCeKYcYhAg==
X-Google-Smtp-Source: APiQypI/UBx9Y5IWGpPtyBWd0nldKr9Js+rAqO9ame/KRp8gaD9ERM3xMuLiSYUC+W4jilxrmZD9Eg==
X-Received: by 2002:ac8:3102:: with SMTP id g2mr5266361qtb.349.1588273662712; 
 Thu, 30 Apr 2020 12:07:42 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id z4sm501252qtq.5.2020.04.30.12.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:07:42 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Thu, 30 Apr 2020 16:07:37 -0300
Message-Id: <20200430190737.80950-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: martin@omnibond.com, corbet@lwn.net, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 devel@lists.orangefs.org, hubcap@omnibond.com
Subject: [Linux-kernel-mentees] [PATCH] docs: filesystems: fix `make
	htmldocs` warning
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

make htmldocs
Documentation/filesystems/orangefs.rst:124: WARNING: Literal block expected; none found.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/filesystems/orangefs.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/filesystems/orangefs.rst b/Documentation/filesystems/orangefs.rst
index e41369709c5b..628dc220567e 100644
--- a/Documentation/filesystems/orangefs.rst
+++ b/Documentation/filesystems/orangefs.rst
@@ -119,9 +119,7 @@ it comes to that question::
 
     /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
 
-Create an /etc/pvfs2tab file::
-
-Localhost is fine for your pvfs2tab file:
+Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab file::
 
     echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2 defaults,noauto 0 0 > \
 	/etc/pvfs2tab
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

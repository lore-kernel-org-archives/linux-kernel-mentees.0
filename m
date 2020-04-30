Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CA7C47257
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:54:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F2220774
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="jnjRwyAu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F2220774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE1BA88178;
	Thu, 30 Apr 2020 20:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S615VupAX0IZ; Thu, 30 Apr 2020 20:54:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1179C87FE8;
	Thu, 30 Apr 2020 20:54:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F37EDC0864;
	Thu, 30 Apr 2020 20:54:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C097C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 76939204EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvo6fnQyTO+a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:54:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 73C41203A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:54:53 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id p13so3766212qvt.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 13:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYotVXEQ7QSaXZH0Cb6CySMSy1hNmT60Cfqey+kK7ik=;
 b=jnjRwyAu+dul5Y4kKLE7Ghb/Vc5TscG+yAoDRRIloYrY59wrKC6a8XzxjHt8F1Dj0e
 VFMLTpT+9U/DWo9TVhqTr+G/yhBPumcPucHbAZ8QiJUk51xU0Af6cSBZ48nzqPtCUL5e
 bjeUwvSs9OL5V9YXvXwZ4I9NmO9UA5IG0n1ZCQnT7JOYuDdGUHxjTspOnSc5Ki4BNAiZ
 bfU1A9oV4+HjOYT1mdjkiMR3EBDEOUP+Andpppt7WtwCwDQlPTXrdxhcv7r5a9SpgWbm
 kMK46SIX/uy11edzTFrZ6yLt8PJjxua6QkvIyadi2JXfNnT0YwilHmtEMO/Ju5Ya24y7
 +x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WYotVXEQ7QSaXZH0Cb6CySMSy1hNmT60Cfqey+kK7ik=;
 b=aSekGP5Df0XNgwqfGkApiyXQBKjw54DwLU84ZOIBG0f92isEuTmGG+AEfra+D3cl7q
 2R5i0ufv4WLDcTIOiKYTtADGMg48x/nfpKg3zz/CGLWYOfuH0LqtI1ZsRqljve2/bso3
 jLBQt7pZCRIpGLIz6PNjkwRHwFVkBLPZBD16qqAluJQHor5QhrQSJHMK5+u0b0V852+i
 TFRq6z3+M1gO97vs9unPwxtMick8chhI8w3vwJjkewhlYuwdtbiKZd9js/00T9Ej3hS+
 ONbfv6pCxPAdP8hZiFAwLrI6sbBKmj4rgxd7Eer+IZmEFzGlaXMkKYHM/gd5dpxM4x41
 dNyA==
X-Gm-Message-State: AGi0PuastZP6M3FysGOJ93qQQ8CC3f1s4FfcDJQp5bH+NxPSo4AT64Ja
 C8bxMceXYGGpQzEvPCIQBRTaRA==
X-Google-Smtp-Source: APiQypK0h2W3QvMGCUPB12GV8ymVk7gxiCl0cTc0DUvsoGMLKTbfcrDwWZOkdVEW+vKkXVSFxmr5hg==
X-Received: by 2002:a05:6214:cf:: with SMTP id f15mr816040qvs.59.1588280092358; 
 Thu, 30 Apr 2020 13:54:52 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id t7sm652804qtr.93.2020.04.30.13.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 13:54:51 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: linux-doc@vger.kernel.org
Date: Thu, 30 Apr 2020 17:54:47 -0300
Message-Id: <20200430205447.93458-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, corbet@lwn.net, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: fix `make htmldocs `
	warning
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

Fix 'make htmldocs' warning:
Documentation/virt/kvm/amd-memory-encryption.rst:76: WARNING: Inline literal start-string without end-string.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/virt/kvm/amd-memory-encryption.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/amd-memory-encryption.rst b/Documentation/virt/kvm/amd-memory-encryption.rst
index c3129b9ba5cb..57c01f531e61 100644
--- a/Documentation/virt/kvm/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/amd-memory-encryption.rst
@@ -74,7 +74,7 @@ should point to a file descriptor that is opened on the ``/dev/sev``
 device, if needed (see individual commands).
 
 On output, ``error`` is zero on success, or an error code.  Error codes
-are defined in ``<linux/psp-dev.h>`.
+are defined in ``<linux/psp-dev.h>``.
 
 KVM implements the following commands to support common lifecycle events of SEV
 guests, such as launching, running, snapshotting, migrating and decommissioning.
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

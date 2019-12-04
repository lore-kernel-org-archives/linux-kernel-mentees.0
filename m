Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75CEC2BBE2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 10:20:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89FDA20675
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 10:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBEQBjUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89FDA20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 71B3F20433;
	Wed,  4 Dec 2019 10:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkFxyT0muEMv; Wed,  4 Dec 2019 10:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 608192040A;
	Wed,  4 Dec 2019 10:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47D44C1DD6;
	Wed,  4 Dec 2019 10:20:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05738C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E263287711
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4-wCzYWRxHY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:20:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 639EF85CD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 10:20:08 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q16so2982842plr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 02:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=up7wRNDiQakb25Ld8qipwPlfmty+/izO4vyiWQI+wHE=;
 b=HBEQBjUC51tDAwFLRg/VzpdIi04E8cnFGwEtaYKjFQ1CmQtkCDovuAMAg1xMqg6qF0
 WTB158ts4/d5+XtTQ3oBHN/O3SjRWx9O1I5GcpZcwohOdW4RgWBptIioied7PjwkskNx
 zdf5l4SlcXZvAzmts2+Mju1F9JYV6HsuqntyK4ejeq0Hf1j0rQg9Is5tm8wYdsrb1z2/
 G5f7duquUNSqTu03sJbwGWKGYPvn0txKq6VIcY1HbgeWh32d0zRZjvncp+d2fG427kK3
 7mR0ExQZSQjgE3OKKlD4Dd7LD09ky7HRMWGXBP/TgBczL9gMVZJgdh+vUyx5FT/3V3UJ
 F/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=up7wRNDiQakb25Ld8qipwPlfmty+/izO4vyiWQI+wHE=;
 b=qq89v1cSY2KYSOfmf0az2P5LoPC+it9bcT7ptt9SbNTOXlX2WccRgVt5e6xr+wMr4z
 V/RX5DH1XzLNRGAzTWcacYlXDnDZzyDAXoN1rSrRjwQvL9difXmpiQ82zcYoyyRv22R5
 7quepz6IrinKwBYlffrqx8dgBN1lYnKTc6J/GGK+xswlKFHFGI0V67U2YmG1VeAF8xzo
 CeMeKfJR9xdLN88qUKozAaw3qr1KurFyTG5vDVyWhsjoNqcemqdbyNDg0sVJNv8X5Amm
 jl/a1yqekfnilRv/ffCONb3PMlI7g4oxuqVFEVuLImNUOnphhuQ2zvRljx7uYXpX/k6j
 hq4w==
X-Gm-Message-State: APjAAAXeLSY/L01Yx7vujVb/OYN/9Gp2yASg2Sa8PGqjwzpaYl6pB7QU
 ZMnX2kf0r5p0kF1mzBGSYpg=
X-Google-Smtp-Source: APXvYqwL1TM41IFYtBTyi9IDlGtHy7hkPVvUAIXIWa/c+wYFlAB/P7WWIdG0P2n945+R/zGzm1mfuA==
X-Received: by 2002:a17:90a:cf11:: with SMTP id
 h17mr2468035pju.103.1575454807763; 
 Wed, 04 Dec 2019 02:20:07 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:94ce:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 d22sm7209393pfn.164.2019.12.04.02.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 02:20:07 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: corbet@lwn.net,
	mchehab@kernel.org
Date: Wed,  4 Dec 2019 15:49:39 +0530
Message-Id: <20191204101939.6939-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: filesystems:
	automount-support: Change reference to document autofs.txt to
	autofs.rst
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch fixes following documentation build warning:
Warning: Documentation/filesystems/automount-support.txt references
a file that doesn't exist: Documentation/filesystems/autofs.txt

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 Documentation/filesystems/automount-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/automount-support.txt b/Documentation/filesystems/automount-support.txt
index b0afd3d55eaf..7d9f82607562 100644
--- a/Documentation/filesystems/automount-support.txt
+++ b/Documentation/filesystems/automount-support.txt
@@ -9,7 +9,7 @@ also be requested by userspace.
 IN-KERNEL AUTOMOUNTING
 ======================
 
-See section "Mount Traps" of  Documentation/filesystems/autofs.txt
+See section "Mount Traps" of  Documentation/filesystems/autofs.rst
 
 Then from userspace, you can just do something like:
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

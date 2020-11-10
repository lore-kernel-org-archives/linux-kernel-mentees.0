Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD8FC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:48:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA6A20781
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u3SXUAuz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA6A20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5ECCE863A6;
	Tue, 10 Nov 2020 17:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jC77wgrz+XIs; Tue, 10 Nov 2020 17:48:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC632862F4;
	Tue, 10 Nov 2020 17:48:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E820CC088B;
	Tue, 10 Nov 2020 17:48:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA3B9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B32A187277
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDeeL1e7NjOl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:48:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D28F87253
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:48:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a18so11914121pfl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U9vV/by1ItPYBZ2k5CLKKGvVkSRTIRG0FFRZLlCzvvc=;
 b=u3SXUAuzhxj86zTh3yQ/bq81MAfg+SDUBuGLVOx99opPRp59nwLpQ0saG0ZkSkURYP
 KILAOS9IRGLDA78fsRp0dVKLx6ziGiDeTnK6QAg/OuSdX6YyWhfl1puVnuPTGimTFeuC
 eY8D2J2HY+mlB+YTQgi0To4KXEnGiucYUVQwBemTALtsPpfqY8rgGmQxfvltuLnuJHao
 ebKydSxla8Upp94wwyr4QaY7A8TzS/yng7wRfmrNqqHbxlkSWiuCll6TgeuG8br080G1
 Ix2SGc/1b/m7BLP21CrX0L7xzUh4yhtHPyX78BzLixnTjItJDXoAucbKNK/7FNnrco/y
 HMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U9vV/by1ItPYBZ2k5CLKKGvVkSRTIRG0FFRZLlCzvvc=;
 b=iCwDyZWfzv3pjIS0xgzMziTQRtfRiF57qJDE5AzZ/I0LHed44OObZsjEIwSGJMTcvf
 WsQ3yx4r/7J5N3Zu1PW95tVwNYPrjkvo4R4/Z7YL67Wpfv0pacHphb+BSL7n8dsyRWZK
 UP5HlFOaen2tSpbaEKrM7rmo2fOwvzua3awLEjPcCc2PeR93kO8T84wCqgIFlqAGIvwj
 GwzQWji8/KM4/NZcRU9St+rmCRDrE1LIqlJ0BtezzMIApJXQrcliNb7blSc3Ig5U+les
 T5dvuRTEzQPpNohPQZ13LsjZzUWGGC3IicynhPWQG/6dBxoCBUNXldddd5Cxg4REyHJf
 ofiw==
X-Gm-Message-State: AOAM5319cjWbXqaepBwYI93E9HEYvLWz9vYhut5bKWH7sMkDNohfX0wE
 gpMrp8g4fVtIuKimP0E3oKA=
X-Google-Smtp-Source: ABdhPJyBIEL1hhryFvJ9rEu0JTFr7pT4XBArdvDD9AJAm96SIh20Jp1eaZp4m2C67D5VnkhlZpMh6w==
X-Received: by 2002:a17:90b:1b52:: with SMTP id
 nv18mr272717pjb.172.1605030481654; 
 Tue, 10 Nov 2020 09:48:01 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id
 z21sm14654325pfa.158.2020.11.10.09.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:48:01 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: corbet@lwn.net
Date: Tue, 10 Nov 2020 23:17:49 +0530
Message-Id: <20201110174749.32068-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel@vger.kernel.org, joe@perches.com,
 linux-kernel-mentees@lists.linuxfoundation.org, sir@cmpwn.com
Subject: [Linux-kernel-mentees] [PATCH v3] Documentation: include sign off
	for reverts
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

Currently, we do not have any documentation on commit reverts regarding
the requirement of Signed-off-by tag for it. This may be misleading to
the users.

Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed
that 4 out of 11 cases missing a sign-off are revert commits.

Add documentation regarding the same to document the community
consensus and let readers know.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 83d9a82055a7..fb8261a4be30 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,6 +404,8 @@ then you just add a line saying::
 
 using your real name (sorry, no pseudonyms or anonymous contributions.)
 This will be done for you automatically if you use ``git commit -s``.
+Reverts should also include "Signed-off-by". ``git revert -s`` does that
+for you.
 
 Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB463C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B58560EAF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B58560EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C58406A0;
	Fri,  6 Aug 2021 20:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QM6AJ3vVSgFe; Fri,  6 Aug 2021 20:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 60DE040538;
	Fri,  6 Aug 2021 20:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35F64C0010;
	Fri,  6 Aug 2021 20:11:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF8E6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98FF1835A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZSewx3KU8xT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE31883518
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 20:11:09 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id e5so8559174pld.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 13:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9DSbyhLqmcC93Ch0i+MPjJN9m2v2DAlApWH9Dmn9YAg=;
 b=llQOEK4B7A0QgwYwAc3w0zQcil6/fqvk+Jho1hTnJYUrxq2c1ZZrkwDDoStrdtK8q9
 NFlSnBa8ptBgKa1r4yzqWLCm78hARNhvHhOMo4HJqwZGhRERU2w7uPBA+WTf+yay/G31
 6bb30of4gMc46AQaogN+eGeBYGLoFjeeHWzLPtYmJd90wYKuwLToZXPVa44QT93Ou2Aa
 OpGVmoHBMLL4c9LyMaNFwgzn3ReSkvh9SBAV3mgcKHBTfGz1/+22IH97m+2XsUnbZXAx
 /SyqhOHf+o0xZE4/tU0IoLH3gvSBOffBE5+TM6V7eWxvufPZSJ9mgqA51fDcccCn1Qjh
 Dsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9DSbyhLqmcC93Ch0i+MPjJN9m2v2DAlApWH9Dmn9YAg=;
 b=j6NqGNAp06ftkErsrjfquYf3AfSK3ZdzF2HgL0ceZ1HjQor/jOtZb9aiynzeZruJpd
 i+MxBlya/BvMAvDxJIlIisWYGYGBZJRq+Q6Zp8K6+AunbKB1+Nl4Nk6ox3vLf5/7jvn5
 RUtQ5x/sPNc3SnlTUfmU97ch2sMPGtjKOI+cAcH8QHpqNwfuV0tpkTOVj7OjoGEUtfFm
 O+QZ8MuZfBFzSUgJuITbGB5ZUOJj8jrX6I7yhC6pjxShCC1zKrQC/0FbmI3hik+44Vxo
 FvjX0TEyubsy6MDJBoGExtkNCIRUAT5Bg7B/l81GMCkOcRU3s83kjd9SQCufqVT/Joyv
 y//w==
X-Gm-Message-State: AOAM530WS4VRb8wPclWPfmjVtTCD2A/nzQht6Z8xT1Fr3th9eKjilb0b
 LLKa9oCf7IAvg3WKBW+LzY8=
X-Google-Smtp-Source: ABdhPJxwNGRC5QKo+HHVpSHOBRwRsKNpWDzubbCXY74tPg3B8dm4hszle67y9VBQhp4PUQvK/kb8TA==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr11872895pju.205.1628280669155; 
 Fri, 06 Aug 2021 13:11:09 -0700 (PDT)
Received: from localhost.localdomain ([49.36.209.115])
 by smtp.googlemail.com with ESMTPSA id c15sm9281980pjr.22.2021.08.06.13.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:11:08 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [PATCH v4] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date: Sat,  7 Aug 2021 01:40:26 +0530
Message-Id: <20210806201026.2537-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
References: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Add a new message type SYMBOLIC_PERMS under the 'Permissions'
subsection. Users should use octal permission bits instead of their
symbolic macro names.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..009957cda 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,12 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts.
+
+    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
+
 
 Spacing and Brackets
 --------------------
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

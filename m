Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069DAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:19:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B239522DFA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B239522DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78CEB870C1;
	Sun, 24 Jan 2021 15:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYE2gCJ-XlqK; Sun, 24 Jan 2021 15:19:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 104FE870B7;
	Sun, 24 Jan 2021 15:19:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CEE7C08A1;
	Sun, 24 Jan 2021 15:19:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F6FCC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1632A2042B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAWn8BqqTK-X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by silver.osuosl.org (Postfix) with ESMTPS id 05A6F2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d13so290805plg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 07:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zoY4Vk7MmSKt8oqX54zh19bhelhiOquJiUmj8u/3eEM=;
 b=jTnV0RKPYuDZIjhRGx/+W9arDUzFIgIlDW8+Ml1cqiAVYo82S7Faea392gBGMWhGu7
 5I2dO0j5Ciex4RfJPXhEZZWb0sn7GYtgXRFM7yxvT6H1a24MLa0FwzUxybHcS3XfXhtp
 o4Uk9rEmMPZjt34sVOPP1Fab1F9EBnzZ5MpFJH0eDszP16WV1JuwQJzpb9ABPKUBaONy
 2XOlZ/vx77BzMj5hQTbd7OXg/qsg/crMqscoWt7aF3dsuwKy81fmoZqB4T6xQbsSMs9Y
 ozsdk6UQEQx8XfQ/zbUcK9fjubtRqjUrM2d7xH+xDk74qBX0T5tFUgRj+4YG89GT8WiN
 eNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zoY4Vk7MmSKt8oqX54zh19bhelhiOquJiUmj8u/3eEM=;
 b=mt2ddr2CARuFilQE0Rt+2RaGFS0/oRJFMCaHTSD2cY5EXLC1dUU6PS5jFIT9p+7JhK
 MxJe/gem0lVL7VhXXiIvgfkaeJf7zmzd0lhNVPsY5N2EEnN48kmEa9JbgxVEVOr8KNL9
 s9z1OA4pmrlaOYtwEyrrb1Y5JEukM6xt6iGNvUMYm9f93uGovUUFIRf5BNJcH6y3UUAf
 jJJ65RJ3RKNqH7G5tSjjZw7S0cJ5cxrw+1AMU1YPmnkvuAMNWvHrQJTsbFWdqHkfOjYJ
 XBn2gNCLGuthganmLJ+C8srUELnYK1ZDfojhfSt2X6lwlUFMYQkULfVoRdKaquFopYpp
 y3Pw==
X-Gm-Message-State: AOAM532d9Vl2hWN/4wYcl55unEp/+noXM3L5muY6/qHsHgxqHtstwkXq
 gf++xrj5UC2SYe8V8xZXIzI=
X-Google-Smtp-Source: ABdhPJzz0aDi+nfNduM1Ur91Bdoao/JS5dnTct4LHvsoTzh+j/cgk0EW8WMZSiudov5MrG+z/oktFw==
X-Received: by 2002:a17:902:d64e:b029:df:e5b1:b7f7 with SMTP id
 y14-20020a170902d64eb02900dfe5b1b7f7mr1713259plh.10.1611501582505; 
 Sun, 24 Jan 2021 07:19:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:694a:4908:5c97:3b7c:64fb])
 by smtp.gmail.com with ESMTPSA id gk2sm15687328pjb.6.2021.01.24.07.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 07:19:41 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 24 Jan 2021 20:49:32 +0530
Message-Id: <20210124151933.19696-3-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124151933.19696-1-dwaipayanray1@gmail.com>
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC 2/3] docs: add documentation for
	checkpatch
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

The tools directory will serve as a documentation for any kernel
tools or scripts.

This links the checkpatch documentation to Sphinx.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/tools/index.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/tools/index.rst

diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
new file mode 100644
index 000000000000..59c9904ef89c
--- /dev/null
+++ b/Documentation/tools/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====
+Tools
+=====
+
+.. toctree::
+   :maxdepth: 2
+
+   checkpatch
\ No newline at end of file
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

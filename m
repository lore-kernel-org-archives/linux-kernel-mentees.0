Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8CEC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1B2206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 14:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjBQEa6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1B2206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC5FA85629;
	Tue, 11 Feb 2020 14:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djqpPeEeDWEK; Tue, 11 Feb 2020 14:02:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90161855F6;
	Tue, 11 Feb 2020 14:02:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77305C1D80;
	Tue, 11 Feb 2020 14:02:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC4E4C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B62D986443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9tXOnl9GXla
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3CAA586418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 14:02:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z12so5780264pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ci+Rbqp1YivjpLX9BG2inDxFW0vPbauOHc8MjODqOjk=;
 b=SjBQEa6h+4n8DntgZfs21FRfVn91W25NzjrKOsUmjkLc3WfHgTviZm3Xj4dGY/IiSB
 /7rxaXUkwTtZ/RJnK5Y3VJf0n/T0W8MUx/oV0Q/7dLJSegPkSUClq1WEeOPt5KX+TfTO
 3xImnIpGpD/rAzLqIFNPSnMrursNM91Gdfz3TV0tpXGLREpKFukhg6yiqbCOM2w01aEh
 VXIZWUj+AfFQzL+tKmZxPAO0S8LuMDzDUuW0wCl3G3/Pw9de0wgJYOz+EWuagPNDh3f5
 tBsH3Hd1fXWbQpMQpXQJH6XxITYwkGBXkjiFl4QWyIVWX9vXsxUpQlUMk9+7X4ZzB7Hu
 oOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ci+Rbqp1YivjpLX9BG2inDxFW0vPbauOHc8MjODqOjk=;
 b=pVTg6PAFyJyzY1EJWATcGPhHj6bvdQxWAPAwOBZ6S9bHcKU43t+OVLkBdpCJ9Ea4Cq
 2DY/Xbi/SMBKJB/KtiA52MUdeDDYpArpGVbTjGaIqrxLc2nnG2ZDvL9tgA2jvdElk3Jo
 qHcKKTHGKyCdAQko4bf974rS5pCxb1SvJLWmLIeVbwr4mBLTYBvfj5pTp8AzzlyNWKPQ
 Y19QpTexmkYz5HGfLrIqU88eXj+ff8rSDB/Rl+vYKLg2gDBWaiWKRTaLCxYIxMypRczi
 pp6dLYaLbyyz+RObChHulvMs8bWzpWCk4ygWj7qM1jyudqW2oUieE+yic7nNXakxc34H
 vyoQ==
X-Gm-Message-State: APjAAAWN2pxAY9Z+u9AHBQTkfX8mDCL816Ak7pUtwvn+AZSJLuoqXIQq
 6ysNpQA2DUWMTW6WP6KP5i8=
X-Google-Smtp-Source: APXvYqzdRwFgv3sFFc52tz33AM1/sMoH6aUVDLoG2bEo3FkCCnwOQO+U6+qkwrAmIiGqqxjbI2PgJA==
X-Received: by 2002:aa7:9f5e:: with SMTP id h30mr3419244pfr.137.1581429724603; 
 Tue, 11 Feb 2020 06:02:04 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id z26sm4203575pgu.80.2020.02.11.06.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:02:04 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 11 Feb 2020 19:31:37 +0530
Message-Id: <20200211140137.2304-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
References: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v5 3/3] tests: Add test case to match
	const pointer variants
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

Pointer to const pointer and its variants would not match previously.
Add a test case for matching these types.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/constptr.c     |  7 +++++++
 tests/constptr.cocci | 19 +++++++++++++++++++
 tests/constptr.res   |  7 +++++++
 3 files changed, 33 insertions(+)
 create mode 100644 tests/constptr.c
 create mode 100644 tests/constptr.cocci
 create mode 100644 tests/constptr.res

diff --git a/tests/constptr.c b/tests/constptr.c
new file mode 100644
index 00000000..49f4af65
--- /dev/null
+++ b/tests/constptr.c
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const *id;
+	const char ** const *id;
+	const char * const **id;
+	const char * const id;
+}
diff --git a/tests/constptr.cocci b/tests/constptr.cocci
new file mode 100644
index 00000000..29f0aa96
--- /dev/null
+++ b/tests/constptr.cocci
@@ -0,0 +1,19 @@
+@ r0 @
+identifier id;
+@@
+const char * const *
+- id
++ id1
+;
+const char * * const *
+- id
++ id2
+;
+const char * const * *
+- id
++ id3
+;
+const char * const
+- id
++ id4
+;
diff --git a/tests/constptr.res b/tests/constptr.res
new file mode 100644
index 00000000..62fe2513
--- /dev/null
+++ b/tests/constptr.res
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const *id1;
+	const char ** const *id2;
+	const char * const **id3;
+	const char * const id4;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

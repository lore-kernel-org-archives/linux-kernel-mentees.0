Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E41C35254
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:04:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79151217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egbNttUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79151217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5481585D78;
	Wed,  5 Feb 2020 13:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJydessOJ6l5; Wed,  5 Feb 2020 13:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EFE1885C08;
	Wed,  5 Feb 2020 13:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED435C1D81;
	Wed,  5 Feb 2020 13:04:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC64AC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B807485D52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7bPbgcHz0qC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:04:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F6AB85C08
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:04:00 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y1so863564plp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 05:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32Y47SbuT10IdA/WyQebJ/4R/klDrpn3l0uQR85Y/JQ=;
 b=egbNttUUskY3YEA9gX0iL+5VLjTr+NqNVmDjlVRPHAjD4d/yR7tFH8YCFuwpkXroKt
 yxe7hlGJ/zaHFNtC9jwzCifFpdFk/mTLFFKi9EvqO+4eVml4uFTeast/mW15xBJVTQ/D
 9OaMmQc8rhoymXDA+ZtlrUVv6PY24fxvpNKXHWZqHdSpjcnkwx9LLqkzLRkKrZF9NYno
 SsHqj1jWAxZbGWZnLdAmnvvTGlcp/EX5UidYcCzHtfLQRQPe6aP1htObE5bTqjjpKY1U
 TFZYEvh/Fe8nldk5dhrM90JrMgYQulpLVFEi0HV4KDNJsFTH1J3bc1D7jmb91zMSqf08
 alCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32Y47SbuT10IdA/WyQebJ/4R/klDrpn3l0uQR85Y/JQ=;
 b=HpHWrQ+zbyNpGNXSnyu0YhBow3XDu8zK4jkQDAFWg+oJ7Y8pR2bNKxgoPY+RbA6yO1
 l1K057c2R/MZPKy+XPkXNesf6xIB9O6seXac+6Fchwus6erMOT7iguxYskgT5wyLDTCH
 nGNXXAxyygU2EZ88PPJlHl/tujqMIe3daaPWGjuVT23xSZlEh3D+r6oEPiHsXoOw0Xtm
 xRpgBowhxiTmTeeSd3pZo8s9op4G4R+dzcKb5Aukq+DjByYud+pP1UPml+kt72FZQXz+
 5KEufvfT9WkvfsD4vrBwrYEFkg8DICien0bOSUkBIo8qV2SvAfHvHrSdEASj9CBGSmbg
 OuPQ==
X-Gm-Message-State: APjAAAVUv7/fmACKS6XKWIXvfbhU8b7oyGtzJ2WF8JOjDV+TrT42/dtv
 VAMzdyVjXmaPbZfiVqICb4E=
X-Google-Smtp-Source: APXvYqx7w1WLfGWHTpBo+J9HYCB0UlysfQju0epJtu++DiFdp/GV2Oj65c6V5EN8uY4fPjQdWqYF3A==
X-Received: by 2002:a17:90a:928c:: with SMTP id
 n12mr5706717pjo.45.1580907839853; 
 Wed, 05 Feb 2020 05:03:59 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 q6sm28137098pfh.127.2020.02.05.05.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 05:03:59 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed,  5 Feb 2020 18:33:27 +0530
Message-Id: <20200205130327.6812-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
References: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for
	matching ptr to const ptr and variants
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

These types would not match previously. Add a test case for matching
a pointer to a const pointer and its variants.

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
index 00000000..13fe064c
--- /dev/null
+++ b/tests/constptr.c
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const * id;
+	const char * * const * id;
+	const char * const * * id;
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
index 00000000..0af4de9a
--- /dev/null
+++ b/tests/constptr.res
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const * id1;
+	const char * * const * id2;
+	const char * const * * id3;
+	const char * const id4;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

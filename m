Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D14C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6F6206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uA1Opabl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6F6206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B852E20461;
	Sun, 31 May 2020 15:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLij1ljtLdMO; Sun, 31 May 2020 15:28:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D45420438;
	Sun, 31 May 2020 15:28:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A04DC0863;
	Sun, 31 May 2020 15:28:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2661C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E055287E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8C7FyMvBp6kB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6FAC387E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m1so2343778pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1usUHRjT30UJ7SGo5+Abt4NssA1f9Eq27niEio+p3AQ=;
 b=uA1OpablRL1qDQ+32IjoVM1EqWFExrRT61D7NkaC7Yxt4Mcw7tsBN+XjcoxPqeM85R
 UfG7vkKEbhBVIVoI8DKXaPXkezq7RnkW3eWmGWzIxzuUQLtZZL305GFW5UvvdYJwmCDm
 IJv4BA3VKjqdLbQG7GjACk0hJnKLh/1R4s5yucfRTJwL/m62Vqr3BR8KsHgv460tgAC8
 5R6s/yv5EEUW+ehfuJ9RkkKZ54EPfoftwJLWo1Iy9sx9SRU4feQ/kfs6aLqMgpU5hUFg
 OqepqYy4W7lK+avZpkFg/+7NqHitBTLfK4k61D/bOnPOub1yMzwaolynikAvkupqZ4PE
 e5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1usUHRjT30UJ7SGo5+Abt4NssA1f9Eq27niEio+p3AQ=;
 b=P2JRdqwfQ+4yMqLEd3DSowyD41euGZqifeND7jLcNzsb+vsQKgXkQGimpHBsy3y01y
 Wax+9X3JZ7LVyxJdDpgmts9V0hZqVzs+ii1PrNQlfipHaMqSle1RbwlxERvkmNz9mnVg
 HoeAvDQslyfE50tpl7G3cFQ3eW9R+cDg8ptHKY/IeXQaIvfcDl1GXi+8ViyW97sIqUt0
 gwlUqtvmLqfWd5hL8BJet1/jT10P/SAesMQ5c4K0VMQPjovZdjsBbVdvz77x0sRIOvaC
 N0YAbYV5p1YHy3/4gC96k+Ns25uXZNvH3qvWEyzX4kPuPlRQLM/zhJ+YQ0lGq4fbmj2Z
 fdsQ==
X-Gm-Message-State: AOAM531sYIefwqHeKBxaSphu30CWrFNwamVXAhY7BTUl/IOXBzsLFdeh
 cErPotSO4YB8jzeU49bnYgI=
X-Google-Smtp-Source: ABdhPJwViq0wDbk5rN3CW1tNbSkyICnLOyyguALodN7GLC3VEJOomwAzmrIF6P/Jz53N6LNqBVC6ig==
X-Received: by 2002:a63:f854:: with SMTP id v20mr16298897pgj.0.1590938910026; 
 Sun, 31 May 2020 08:28:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:21 +0530
Message-Id: <20200531152621.2886-28-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 27/27] tests: Add test case to check
	struct endattr allminus
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

Struct end attributes are added to the SmPL and C ASTs. Add a test case
to check allminus for struct end attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_struct_endattr_allminus.c     | 13 +++++++++++++
 tests/remove_struct_endattr_allminus.cocci |  6 ++++++
 tests/remove_struct_endattr_allminus.res   |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 tests/remove_struct_endattr_allminus.c
 create mode 100644 tests/remove_struct_endattr_allminus.cocci
 create mode 100644 tests/remove_struct_endattr_allminus.res

diff --git a/tests/remove_struct_endattr_allminus.c b/tests/remove_struct_endattr_allminus.c
new file mode 100644
index 00000000..a99a7e9f
--- /dev/null
+++ b/tests/remove_struct_endattr_allminus.c
@@ -0,0 +1,13 @@
+#define __struct_endattr MACROANNOTATION
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+} __struct_endattr;
+
+struct defg {
+	int a;
+	int b;
+	int c;
+};
diff --git a/tests/remove_struct_endattr_allminus.cocci b/tests/remove_struct_endattr_allminus.cocci
new file mode 100644
index 00000000..f63ab7cd
--- /dev/null
+++ b/tests/remove_struct_endattr_allminus.cocci
@@ -0,0 +1,6 @@
+@@
+identifier id;
+attribute name __struct_endattr;
+@@
+
+- struct id {...};
diff --git a/tests/remove_struct_endattr_allminus.res b/tests/remove_struct_endattr_allminus.res
new file mode 100644
index 00000000..e2f74e8f
--- /dev/null
+++ b/tests/remove_struct_endattr_allminus.res
@@ -0,0 +1 @@
+#define __struct_endattr MACROANNOTATION
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

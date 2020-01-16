Return-Path: <SRS0=fgSf=3F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C191AC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 902392077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jan 2020 10:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz3DhRC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 902392077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 713CF860FE;
	Thu, 16 Jan 2020 10:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3hZKo0mcnoGa; Thu, 16 Jan 2020 10:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E14F85F84;
	Thu, 16 Jan 2020 10:45:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 351ECC1D81;
	Thu, 16 Jan 2020 10:45:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59B2BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 46C118646F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jV+c21n-wm8L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2671884FB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 10:45:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m13so1396375pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jan 2020 02:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bjJlXg6aQ0sdQZeUUmyebQ6K6s748binPw0SD7Jvao=;
 b=sz3DhRC4GqfMusKItSwQVX4Wi0Syw2AvRgg9NZXRpL/LxEbo2WiScO2xLf/PNxKzI6
 Hfv3jMrKyMCYNcpP6Etbdw4CXqfI5VGLJjp8e65Q/Vg2sJuLRKRUDAOQ3Ma9jihhtfO7
 lE6lFw7+7FIAgmLkxIzwczeOIw54XSu3OZtQFYT6T9eWuTXZpe2Xgo3/RpufAnSEnD5+
 Nsv26kO3HlyFDX5dC+gV4c3G9hUuEQ9ALviEBqZ/hacbwXDdV/bEtaXNO8QIw1xLGyTE
 n9WZU62UjoEtHhTH3vJZYtxN0o6uFYqLLxJf/CAaPfLuI5IRROWzArUPOhBS1n8tkRuG
 gp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bjJlXg6aQ0sdQZeUUmyebQ6K6s748binPw0SD7Jvao=;
 b=YF8ZvgSjgTWJNHapMquWyOgG7zVHjQnPQ4L9IxFpB+HUo+FudJxsB0Jbbe5GmO5L3t
 BVBhxqb+Ar6XPg0j3O1P7wkMpqOylVS/SvOUFJfAzBcqu6ooaqbNTALfw0oCZiC1kWgk
 7i+hwkw+QVlACn1wIUeedpARDTRWdxOMsoxK5ZKJF+9ZhEMfa8OhksvPJuGOhJL+Lvbd
 ESqRdBKALbz3HOxjql42gNWlEj7ME/G6ZYORZIBNdzz1SyWs0iJV1KUDTdZhvRNiBuwF
 64rPUihEP00eLjNsFkTsrreYZRjIwLOVFrYoeeU7FnN19hJH9edNh7U+Vg+R1lyhTW6a
 xfZg==
X-Gm-Message-State: APjAAAXRy/Ck/3qTR+rmZ8WOPpAE4d9k3OHT4uvcGVR6fc3zLzcGpC7t
 F7g5W1OZRje9S6oPsn5WkXRpMM9z
X-Google-Smtp-Source: APXvYqzSbHRoEyi5/NJU90QhV6t2d5GZOyTPUMlpCsJrFN2aJ/KbQZbS8Zl1/C7Lze/Ap5vIDCA4Ag==
X-Received: by 2002:a17:902:82cc:: with SMTP id
 u12mr29409078plz.342.1579171533729; 
 Thu, 16 Jan 2020 02:45:33 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1677:7d6f:b2c8:b07a:d4f3:9a2c])
 by smtp.gmail.com with ESMTPSA id a69sm25948799pfa.129.2020.01.16.02.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 02:45:33 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jan 2020 16:14:48 +0530
Message-Id: <20200116104448.15539-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
 <20200116104448.15539-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for * const
	*
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

Previously, a space would not be added after the * const. Add
a test case for testing spacing with use of the type.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/ptrconstptr.c     | 3 +++
 tests/ptrconstptr.cocci | 7 +++++++
 tests/ptrconstptr.res   | 3 +++
 3 files changed, 13 insertions(+)
 create mode 100644 tests/ptrconstptr.c
 create mode 100644 tests/ptrconstptr.cocci
 create mode 100644 tests/ptrconstptr.res

diff --git a/tests/ptrconstptr.c b/tests/ptrconstptr.c
new file mode 100644
index 00000000..a2a3cf71
--- /dev/null
+++ b/tests/ptrconstptr.c
@@ -0,0 +1,3 @@
+void main() {
+	const char * const * x;
+}
diff --git a/tests/ptrconstptr.cocci b/tests/ptrconstptr.cocci
new file mode 100644
index 00000000..030bc024
--- /dev/null
+++ b/tests/ptrconstptr.cocci
@@ -0,0 +1,7 @@
+@@
+type t;
+@@
+void main() {
+-	t x;
++	t y;
+}
diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
new file mode 100644
index 00000000..f5b2210c
--- /dev/null
+++ b/tests/ptrconstptr.res
@@ -0,0 +1,3 @@
+void main() {
+	const char *const *y;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

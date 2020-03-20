Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42178C4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1540F20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="seUGDje/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1540F20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 07FF622854;
	Fri, 20 Mar 2020 07:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFkA5LnvTg6C; Fri, 20 Mar 2020 07:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 806052002C;
	Fri, 20 Mar 2020 07:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70163C089E;
	Fri, 20 Mar 2020 07:03:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B579AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B1A6488915
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEFzPZL79+Ja
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 61002873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:56 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id nu11so2068271pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmcsVGk4SUFgwf9gcnr4bcFVeXLGhm9CDcwKlVjnNSU=;
 b=seUGDje/JjVz1jVsXGpTHGH18N9++CYlGkDLaJnEymtt6BLoAKl1p7wfLMuZ4cLwaq
 sK4Ndmz1Fb8YNnpTCc/EhE9yGzOdzMNHSOZkY/YDDLCo2IdxJxRV6LBtDRmy/ila/Zf3
 04MTQQsumHGhdLFG3vPMdo7VFIggMs+K7Rh01T3muDyRJk7m31nyLPJ/s4t9/K3wEMbM
 LcM05jQFcnCoISCQJimjdbjK7nPzJM+2MvHUzCAnZJWeoHZ4Fel8TIJFKzawP+qzxovZ
 +WpAQsnjliDoNaurS43esUsPKtXDo+W3zrYxBJXCB1H7dzQiqzFNpbnLyx81IPv5qW6R
 hbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmcsVGk4SUFgwf9gcnr4bcFVeXLGhm9CDcwKlVjnNSU=;
 b=Fi8Gw5NClPhrDDVh01ABWgJ+3bgynAmLFQFxVIPm8/0Fc+zL5a3nHdzKXKh7sUvoYQ
 +ixlF8teLcmj0lsQ4kPNlZNK5Wd2Iem69CJ2EAEmGTe2zxDmkcViUI28nUR8uRIN2DwH
 03bl2at5hdD9EFsh9VAiyEy59lSoDCLADWFJJBebbgMnmS44jWUcBvjpmkkLl9ktA597
 2lH9Nu5QCSf0oIqm/ekCsZen3xNy54OsW4UgGYKzih8qCArtUhfr7ZEfCI8PYocZ1EJw
 VdVbP9SYBnOIpYFqxRDJ1kEBExYT41RPF/RpYz2a1S5uqYtMCwn2JJXmfi2acFe5opI5
 ggsA==
X-Gm-Message-State: ANhLgQ1W1c3g6qAuClgvqg3qI1PjYZQmA1JkEhgVybcaF/5lXYuRfXY4
 xBW7AAEeGepyPwGpPO7Li64=
X-Google-Smtp-Source: ADFU+vscZajQ9CDH5RyZV707gQojJP4BxF9R15BxCbAmPIQZFK1rxe9nAoNwpjLgyco7aKwyQHfT1g==
X-Received: by 2002:a17:90a:ab0a:: with SMTP id
 m10mr5451764pjq.173.1584687835923; 
 Fri, 20 Mar 2020 00:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:57 +0530
Message-Id: <20200320070157.4206-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 26/26] tests: Add test case for
	array of function pointers
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

Add a test case to match against an array of function pointers.
This would previously not work due to differences in the C
and SmPL ASTs.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/funptr_array.c     | 1 +
 tests/funptr_array.cocci | 9 +++++++++
 tests/funptr_array.res   | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 tests/funptr_array.c
 create mode 100644 tests/funptr_array.cocci
 create mode 100644 tests/funptr_array.res

diff --git a/tests/funptr_array.c b/tests/funptr_array.c
new file mode 100644
index 00000000..dac29ac6
--- /dev/null
+++ b/tests/funptr_array.c
@@ -0,0 +1 @@
+int (*x[2])(int x);
diff --git a/tests/funptr_array.cocci b/tests/funptr_array.cocci
new file mode 100644
index 00000000..8027bcf4
--- /dev/null
+++ b/tests/funptr_array.cocci
@@ -0,0 +1,9 @@
+@@
+type T;
+identifier x;
+@@
+
+T (*x[2])(
+- int
++ char
+  x);
diff --git a/tests/funptr_array.res b/tests/funptr_array.res
new file mode 100644
index 00000000..72e1a14a
--- /dev/null
+++ b/tests/funptr_array.res
@@ -0,0 +1 @@
+int (*x[2])(char x);
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

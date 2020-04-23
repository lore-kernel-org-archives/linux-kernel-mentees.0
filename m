Return-Path: <SRS0=CC7Y=6H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F814C55192
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 12:45:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E9C2077D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Apr 2020 12:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEH1jWKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E9C2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 203BB87E8C;
	Thu, 23 Apr 2020 12:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i10EVfWrNkbK; Thu, 23 Apr 2020 12:45:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B9B7F87E84;
	Thu, 23 Apr 2020 12:45:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8423C1797;
	Thu, 23 Apr 2020 12:45:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04B37C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 12:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E6903231E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kdu2fuKuisPj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 12:45:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id DEE10230FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 12:45:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t14so6661251wrw.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=out4PF7f/PmTIeJMMNg9xrpl67X2+hDnaDGBvd5Qh6I=;
 b=SEH1jWKV903FaLqMz8aHHnCbdx0XE+eaEso7o5J4JGZkkKyMYT2FZX6gmDu5io9L4O
 XhmCAmk+9ygDNmWYQboRZwlEUxJCWVZlzNzb1DNJAtm/JaG7KBA6SvbmLkAt8a0sH4GA
 P5rsgyQZJbVZ8xU3mf+pD5AF/guqDgQiOE1WBvaCLqoc6+8Xc3FcZlqZSlPC3cIXFKTh
 rlAIgReQKVFuDTSEgklm/rYQp3INflYJLLVmRR2OHBwjaOk3r+wjw5n84VPBcQeJIlix
 uhaRCsjKui/yJF4394LZt6kykocczgiBPim6P8jprY4kcp2LMGrSFXX6/zQKp5Xxvw0R
 qFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=out4PF7f/PmTIeJMMNg9xrpl67X2+hDnaDGBvd5Qh6I=;
 b=HjatHkQmRbZolaMbLi4S7L0OGJ7kaE5pEKaQ2HHIj4mV+4k6zCBs1XeUHvuiL+N4Xd
 FXJj0dk6y5BZinG41rF03Pt8jp1xmM0nG8AiTBmhmPZ9LsCtN0ciA80ygYQxUo2n1PQq
 KZzwqcZnDN7koX4awcpf2eo8laaYGw09gbNlOtxoRDLTshqyQpHSAjOWUhFoDg/14iJM
 zhijNYF2RmZVS+29seiIAdR2jWGJCleo47IdzIH99TR5btp/yYAu59gymWP9ntAyBJ1d
 Mw3ovvi0JM4EnLMKbadDD/Er3RooHYthIIFzIhinfu4w8A3PjOxCW5c/3KbyOVebSXhG
 wkAw==
X-Gm-Message-State: AGi0Pua1tvdXemEJieA1+Tqq9L9quypAPb4oWspW70ARv9uButJHGcA4
 XslcwHeTn30al2bBkkbIrj8=
X-Google-Smtp-Source: APiQypJLoMPD4aEjRb8mZV8whi87DgBvI13poaPpbJYRJq+2N/ZzLCza99R+9lQnGYTDapul28+r4w==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr2785258wrn.262.1587645943224; 
 Thu, 23 Apr 2020 05:45:43 -0700 (PDT)
Received: from net.saheed (563BD1A4.dsl.pool.telekom.hu. [86.59.209.164])
 by smtp.gmail.com with ESMTPSA id s18sm3771640wra.94.2020.04.23.05.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:45:42 -0700 (PDT)
From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
X-Google-Original-From: Bolarinwa Olayemi Saheed
 <refactormyself@users.noreply.github.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Thu, 23 Apr 2020 13:45:17 +0200
Message-Id: <20200423114517.18074-1-refactormyself@users.noreply.github.com>
X-Mailer: git-send-email 2.18.2
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 Stephen Kitt <steve@sk2.org>, Kees Cook <keescook@chromium.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eric Biggers <ebiggers@google.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-doc@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] docs: Fix WARNING - Title underline
	too short
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

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

There were two instances of "Title underline too short" and they were
increased to match the title text.

Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 3e68da9fc066..6f7f01b1180c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -292,7 +292,7 @@ Default value is "``/sbin/hotplug``".
 
 
 hung_task_all_cpu_backtrace:
-================
+============================
 
 If this option is set, the kernel will send an NMI to all CPUs to dump
 their backtraces when a hung task is detected. This file shows up if
@@ -575,7 +575,7 @@ scanned for a given scan.
 
 
 oops_all_cpu_backtrace:
-================
+=======================
 
 If this option is set, the kernel will send an NMI to all CPUs to dump
 their backtraces when an oops event occurs. It should be used as a last
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0E0C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 16:45:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C312187F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 16:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdWN8Lwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C312187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 577B1881F9;
	Fri, 14 Feb 2020 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJ7vXIlLpd4u; Fri, 14 Feb 2020 16:45:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2E9488183;
	Fri, 14 Feb 2020 16:45:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA74FC08A4;
	Fri, 14 Feb 2020 16:45:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0C0DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 16:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BCC9388183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 16:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BkrWOA9Uqk2S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 16:45:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4B95888146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 16:45:09 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p11so3915816plq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 08:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=CPoNQ+Sf1fHspzF09NwteMM4WEWx0QsGsv6flTB39KM=;
 b=rdWN8LwnE+yDBw0Yxnm8NrLJssyO0EPhZNDWZzVwZO3XCtHtou5Zh6h6hWv9EeCVTm
 NpQHMImVRfOWB+7cIlNmX3PVT70LSzerCvNl2ceieb0MbKTzz5+oVv3w0AxQ149colJu
 j2bV8cnIygPKg25FmMzM7VE31g2FdG6sf+UcF9ZnDO0+O9TM3/BKCO+zYpkYh1EeTSf4
 kKruPVlp0XUX0WvUoMHQCtrahnz0rjYUMU6YIyMQcdY2aGcdIJb+CvwJqVLGYBIF4nCj
 U298WiHSPB/vWH9hYfwXSm8IIndleNTKsUe/kbwAeOWybMbhwe9z8ls91081fzWjMTVe
 1xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CPoNQ+Sf1fHspzF09NwteMM4WEWx0QsGsv6flTB39KM=;
 b=AvrR7lBhxYGfXX26roQUb8cIn9EKXPiD8ODxRCMM7o++cLD5FjxwMTXZou59RXk7p/
 xGXbgnuFq/FEUniYG8Lz2g1KEsOXztOtT1pzFAOqhp0chw6EwvSwJoKLydvR9i6MbzqT
 j0SZJCfTRumrw4tbm/45xVaXacvGvAW3sIzSdZjfRpkx34Y1mIRUIA/m5EyhODq/A1iH
 nIoWBNwtQSy2BF3GHkMGEiXLPRh0pjzStoMwSuJBnMO5/Un/ITVeV9z+9X9/+fcdvR9z
 P+sGd9xWq2DiZ7TT/bxt1XhbOUuEeWxDA3n1j/0gqa1NZqVBlj1S4hBJ0rC+ceU+2Bze
 IJRA==
X-Gm-Message-State: APjAAAV3BSGKW9zhNxMuWVHM49tNHEo0t4odIqU2jPCJgsPEjWcWlQkS
 x28LXF2NtExeD6gilKyMwA==
X-Google-Smtp-Source: APXvYqxge33YQRmBtTCmBNT7WE1SwgFIMCYS29+b4FN3wZu5vaLM1r03WPyC7m/WSeA+ON98qNlyjw==
X-Received: by 2002:a17:90a:102:: with SMTP id b2mr4673412pjb.64.1581698708825; 
 Fri, 14 Feb 2020 08:45:08 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2409:4071:2305:77c6:fc5b:5bfd:1ab4:4848])
 by smtp.gmail.com with ESMTPSA id 200sm7474682pfz.121.2020.02.14.08.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 08:45:08 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com
Date: Fri, 14 Feb 2020 22:14:54 +0530
Message-Id: <20200214164454.19942-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 namhyung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] events:core.c: Use built-in
	RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

list_for_each_entry_rcu has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/events/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4ff86d57f9e5..04d28f3eb8df 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3760,7 +3760,8 @@ static void perf_adjust_freq_unthr_context(struct perf_event_context *ctx,
 	raw_spin_lock(&ctx->lock);
 	perf_pmu_disable(ctx->pmu);
 
-	list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
+	list_for_each_entry_rcu(event, &ctx->event_list, event_entry,
+				lockdep_is_held(&ctx->lock)) {
 		if (event->state != PERF_EVENT_STATE_ACTIVE)
 			continue;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

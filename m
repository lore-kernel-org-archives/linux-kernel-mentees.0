Return-Path: <SRS0=GiD0=3H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1A2C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 03:06:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D9A24656
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 03:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT7tAvPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D9A24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77E5086F9F;
	Sat, 18 Jan 2020 03:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaK4c19LydVm; Sat, 18 Jan 2020 03:06:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EECCC86E7F;
	Sat, 18 Jan 2020 03:06:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D54FFC1D81;
	Sat, 18 Jan 2020 03:06:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A90FC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 03:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 40A3586EAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 03:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09JkNP9KWrNy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 03:06:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE7A686E7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 03:06:26 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 62so6182274pfu.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 19:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ZOS/QKfJuYHMcS4p5y33x0lWJFFfhgPkwQi+6BWE0/s=;
 b=cT7tAvPzEQGvP8FwNaSz5sJQJr16JuwCeKy76J7+0CXYibIXw5W9H3ImH/XF6Y1y2f
 l/CB6PhveH0EW7bldI3GYIsM5xB7dibtyGiLFyCwniQtWvLc2j6mQiNMs7Lhb29WT1Sc
 RzPCEeOd1QeCvdbDZAPv2glcGElX7NvwYG697Z5z6HvhQ9OFctcDGI0Dx/JP8HoP6A8b
 plDGQGF++TK5lj8ih3gcGHlBKGppcyMtH11TRDVoQMaUM23xvtRizceMkNmDqTXzi3f7
 GQEFvEcCdDNv2CdQXITNzLcOIW4sYIOx83eNe7O/IQ/e5LNsP4HCuNTjvS8Vz1WjVx2U
 UIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ZOS/QKfJuYHMcS4p5y33x0lWJFFfhgPkwQi+6BWE0/s=;
 b=sKc+cauthX87/ZiubwV2xI28Os1CHSPEJVH1Sy9VqSgjtOA/clBNnQuN9VSzDxRf4d
 kz70EGsCkjlFupyDNBSXqqsbTOAEhNGzhqvwrDVquqg6YzZwn9aArOt1UdeXD2c4YBNF
 fkqBPbahACQSz5iJJBMCAXQFFc80rUyTgo45oJi+glvGxLYMxRqZ/KKbdj7m9ZipY/eG
 KFdev+2XAyQpOFgXf9pEp4Ia4TY5k619jvl//GQ2YDSPmencurCdKVIjowf4TzzCFwEJ
 WZ3U/XZLIrJxxh3fAokxSHaXosShJGGY/2TgdnZSPTG/lfrSX/L1yfFVpp2QsPh0toiz
 1lPQ==
X-Gm-Message-State: APjAAAVFtVyfSmX+f3B32YlvHRbUAgrNp+zi+Y3JXAYpA88/cYY/vwq0
 LzT20tE5RJevjXBiDYLMPQ==
X-Google-Smtp-Source: APXvYqynSuHb7zqQFO6TPM9eaLCNeLc6NMrMJ4WBFqPMvpJD0F/OdoY3zjM/mK1N3r4FVktNXKFNbg==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr49126467pgc.450.1579316786303; 
 Fri, 17 Jan 2020 19:06:26 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee0:feca:7477:122a:17db:72ef])
 by smtp.gmail.com with ESMTPSA id s22sm184620pji.30.2020.01.17.19.06.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jan 2020 19:06:25 -0800 (PST)
Date: Sat, 18 Jan 2020 08:36:18 +0530
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
To: peterz@infradead.org, --@madhuparna-HP-Notebook.osuosl.org,
 mingo@redhat.com, -c@madhuparna-HP-Notebook.osuosl.org,
 jolsa@redhat.com, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, frextrite@gmail.com
Message-ID: <20200118030618.GA28502@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: [Linux-kernel-mentees] [PATCH] events:core.c: Use built-in RCU list
	checking
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

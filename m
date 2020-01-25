Return-Path: <SRS0=pD5R=3O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3522CC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jan 2020 21:48:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED20B20716
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jan 2020 21:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED20B20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF56A8675F;
	Sat, 25 Jan 2020 21:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeNnuaUq7QBD; Sat, 25 Jan 2020 21:48:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20521866F0;
	Sat, 25 Jan 2020 21:48:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05699C18DC;
	Sat, 25 Jan 2020 21:48:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2429CC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 21:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14F698675F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 21:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNc-p2+BWAph
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 21:48:07 +0000 (UTC)
X-Greylist: delayed 00:06:54 by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F1D22866F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 21:48:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so6325020wro.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jan 2020 13:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=4Jsw+sl3rZeed96mR3AsM5sE56n8KXiFC5Ae1nN2OVo=;
 b=GnitXsXBtRAuy+g9Cajs93zuTxXTkItXuz4g3lbYD8mm3dx1DAXWOXutYsgc9SsbUJ
 /YHPU/xro5YtVWnSPG6+d/0pRdA4gXhVgUMJxW/kw6E65L7E3ev9ty86XrPRldoOkDKO
 g8mg2reCOddLvG4UOXreiM3r13HvoAA5bWHpNmOgUvpMTES/dalgY0/gNftgbUYN3amv
 BRd9ql7ShAb5wcpEs4/WcQdyYCbOKTnXjDWpSCKW+0dNQooW9DILSJa98SrCC3vl9igN
 qAzCn1ynaYVrpMxA7HRrlm7gdui0csCd81EbEQbXvzh0MFwSUFCvApxyrWJ8JsaQVuJJ
 5RzA==
X-Gm-Message-State: APjAAAWZkHA4lwHQe/0xGgiMSU3pQZaRVnriVAlnmJATy4trMj/0T1sc
 +Aruv/csAqULor7kAhIrzttitqIfuCIxAw==
X-Google-Smtp-Source: APXvYqzTlqw+XUJ74D6yIeyAQeh7UV2lyORpCkFnwkDDWbE38nkVreN+6thxGMbX5/U37+CUG7Hiiw==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr11369912wrl.190.1579988471090; 
 Sat, 25 Jan 2020 13:41:11 -0800 (PST)
Received: from ?IPv6:2a00:20:4003:d1ed:ce46:92a4:be2:c2c2?
 ([2a00:20:4003:d1ed:ce46:92a4:be2:c2c2])
 by smtp.gmail.com with ESMTPSA id g79sm11149436wme.17.2020.01.25.13.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jan 2020 13:41:10 -0800 (PST)
Date: Sat, 25 Jan 2020 22:41:06 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20200124045908.26389-1-madhuparnabhowmik10@gmail.com>
References: <20200124045908.26389-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
To: madhuparnabhowmik10@gmail.com, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, ebiederm@xmission.com,
 oleg@redhat.com, paulmck@kernel.org
From: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <37A3FF92-0958-46DD-AFB1-CE72000B153F@ubuntu.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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

On January 24, 2020 5:59:08 AM GMT+01:00, madhuparnabhowmik10@gmail.com wrote:
>From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>
>This patch fixes the following sparse errors by annotating the
>sighand_struct with __rcu
>
>kernel/fork.c:1511:9: error: incompatible types in comparison
>expression
>kernel/exit.c:100:19: error: incompatible types in comparison
>expression
>kernel/signal.c:1370:27: error: incompatible types in comparison
>expression
>
>This fix introduces the following sparse error in signal.c due to
>checking the sighand pointer without rcu primitives:
>
>kernel/signal.c:1386:21: error: incompatible types in comparison
>expression
>
>This new sparse error is also fixed in this patch.
>
>Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>---
> include/linux/sched.h | 2 +-
> kernel/signal.c       | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/sched.h b/include/linux/sched.h
>index b511e178a89f..7a351360ad54 100644
>--- a/include/linux/sched.h
>+++ b/include/linux/sched.h
>@@ -918,7 +918,7 @@ struct task_struct {
> 
> 	/* Signal handlers: */
> 	struct signal_struct		*signal;
>-	struct sighand_struct		*sighand;
>+	struct sighand_struct __rcu		*sighand;
> 	sigset_t			blocked;
> 	sigset_t			real_blocked;
> 	/* Restored if set_restore_sigmask() was used: */
>diff --git a/kernel/signal.c b/kernel/signal.c
>index bcd46f547db3..9ad8dea93dbb 100644
>--- a/kernel/signal.c
>+++ b/kernel/signal.c
>@@ -1383,7 +1383,7 @@ struct sighand_struct *__lock_task_sighand(struct
>task_struct *tsk,
> 		 * must see ->sighand == NULL.
> 		 */
> 		spin_lock_irqsave(&sighand->siglock, *flags);
>-		if (likely(sighand == tsk->sighand))
>+		if (likely(sighand == rcu_access_pointer(tsk->sighand)))
> 			break;
> 		spin_unlock_irqrestore(&sighand->siglock, *flags);
> 	}

If Paul is happy with this and nobody wants to take it I'll pick this up.

Thanks!
Christian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110D3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 08:11:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA05B2073B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 08:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOftp8Lu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA05B2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69926860FB;
	Sun, 24 May 2020 08:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYGsUzf5x6vR; Sun, 24 May 2020 08:11:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DEA686090;
	Sun, 24 May 2020 08:11:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81BC4C088E;
	Sun, 24 May 2020 08:11:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 221C9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 08:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 17E0987836
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 08:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6r1B-nnKA+3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 08:11:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB1F48781C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 08:11:32 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x18so5141461pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3HmigCjALU51rYyyBGLBKoAkAQrHtdUuG74Co9AoT2k=;
 b=bOftp8LuT45vtlcgLJtjpOry5/pv7Z9eYAW/kDJ4hv9mL1zH6kBeG9rGtJO/SUkxKD
 AhjB9/hQYWO2IvXPAYBQveWvNSMAV7Bi9GyK1m3yDD8ZY11At5npkesASAhZRT5EyiAi
 2ZwJwciZQSZM3eastyOWAcDaCExSo1HNsXVpgDfakIz1I0hnBc3jXebsZnvqj2FINutY
 6un9yGg+cRgpaQOhel7BuhW3f0DmtTJHBaOAca1Rs0jhlVQ1Kkwa65ZozwBS4Y/f8iyb
 nLw11kV+l7FTvOV2lr/HLGPwbUF/HgpexqTQMqFBQbpMFXMaqeZTemVIVg2ks1U1RLrl
 hbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3HmigCjALU51rYyyBGLBKoAkAQrHtdUuG74Co9AoT2k=;
 b=B+ZfabpcX3Ut/w2K+b9pOtIFcKWgn6IwTVlawCMflmZO7194QASRQ3Q//E4XY3rpDS
 Bk/vd040FDCfmplruwhuWiv+IE6nCh+5nCbzF9SoMvB5yQAQWpg8GQtk35wX9nDES1mM
 B8NLttq0qLJn99MBGeSDZ7wpscUf3xJ7o5kOXZVWW6VE26CaOctRL9dYPuMCEidRKMjo
 OK9TSigmEnMd1M9dFKK7HVJCrxMkIPmhbNmzeE3CBKrzLmPFU45medHWlNAIoRdO1o/E
 qcXMpmtPt6gqJH4kEMA4QqjdUaQCPl6G6Ds9eOUC/rMS6p5l1Q7jtOqJVlm+6les92Th
 pEnQ==
X-Gm-Message-State: AOAM533xzdtcYkJlx1jWqmtvUBCgbwUgoR08Y2wCzixfSSTxVHxHo9AF
 zAywrEiEdrPAnb/7Ni6ElOU=
X-Google-Smtp-Source: ABdhPJxZfKElYBNI4glOcgWKrPyJxs5PiTsJpx+QFxqGsjUJty7CXioEENo2hycw40fd49jQga2ajg==
X-Received: by 2002:a17:90a:8989:: with SMTP id
 v9mr14838930pjn.180.1590307892183; 
 Sun, 24 May 2020 01:11:32 -0700 (PDT)
Received: from workstation-LAP.localdomain ([103.87.57.241])
 by smtp.gmail.com with ESMTPSA id p190sm10520227pfp.207.2020.05.24.01.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 May 2020 01:11:31 -0700 (PDT)
Date: Sun, 24 May 2020 13:41:17 +0530
From: Amol Grover <frextrite@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 James Morris <jamorris@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>
Message-ID: <20200524081117.GA29@workstation-LAP.localdomain>
References: <20200402055640.6677-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402055640.6677-1-frextrite@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3 RESEND] sched: Remove __rcu
 annotation from cred pointer
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

On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> task_struct::cred (subjective credentials) is *always* used
> task-synchronously, hence, does not require RCU semantics.
> 
> task_struct::real_cred (objective credentials) can be used in
> RCU context and its __rcu annotation is retained.
> 
> However, task_struct::cred and task_struct::real_cred *may*
> point to the same object, hence, the object pointed to by
> task_struct::cred *may* have RCU delayed freeing.
> 
> Suggested-by: Jann Horn <jannh@google.com>
> Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Hello everyone,

Could you please go through patches 1/3 and 2/3 and if deemed OK, give
your acks. I sent the original patch in beginning of February (~4 months
back) and resent the patches again in beginning of April due to lack of
traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
resend patch. However these 2 patches still remain. I'd really
appreciate if someone reviewed them.

Thanks
Amol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

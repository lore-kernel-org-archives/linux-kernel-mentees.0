Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD815C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 12:02:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5FC20702
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5FC20702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6541E2042D;
	Thu, 30 Jan 2020 12:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaWcaZqNnH3h; Thu, 30 Jan 2020 12:02:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D21B120023;
	Thu, 30 Jan 2020 12:02:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C22ABC0178;
	Thu, 30 Jan 2020 12:02:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87EA0C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 12:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7687E88364
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 12:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZ+Wg7D6yDRD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 12:02:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 150CC88359
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 12:02:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so3906605wmi.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 04:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=Eti0yRnmjwLs2yRe1krSvPdmZnl0PtvNqJ94tkjn534=;
 b=eAMa/MOrDugW6enHS+EQB/nUkSR6rG9YPEKSV8G7m3uaNvh70+pQkgoT5ycNHhjsoJ
 smRvwOAyb08mnFYXAv+XzjZjyNcOd5i7am1DtKCRjjwV4rZ19EObLkFP61803jJ+wigZ
 w6x4C9Ly8XmRay/bK50hq5/SvJ+skN8uoGVvZeusbiog+b+pE/0Rz7yWP+RZ0y/Z4fXY
 40JEMTcDDUlmIq2GL4Os+3I8dcLKw6kv30SQBs138JELy3hiD07KM1i8+RrEWY99dLd7
 yNU2i84EYcXE7e9CYUjqHG0TAfRVse4885K3HzdTTk/Sgr9xkImhTUyy5zUIiPTSW1Oj
 vM/w==
X-Gm-Message-State: APjAAAWJsFHXxj8FusUJnIs49FLzR012LbXJ7hUeGiGYmi00CHvb1rkJ
 kmIJPGrOfo6XgCTIG6/w4KKKyw==
X-Google-Smtp-Source: APXvYqxNJ2gaOJkwmVoFcJMWZ4ZHP8gYRIU3hwNEd8Jbog0G2JtnUuUg0Cz8MDtps+Uu5rm/vUM+/A==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3810733wmb.81.1580385767515;
 Thu, 30 Jan 2020 04:02:47 -0800 (PST)
Received: from ?IPv6:2a00:20:8033:fc11:1c15:76bc:997f:b2bd?
 ([2a00:20:8033:fc11:1c15:76bc:997f:b2bd])
 by smtp.gmail.com with ESMTPSA id h8sm7282645wrx.63.2020.01.30.04.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 04:02:46 -0800 (PST)
Date: Thu, 30 Jan 2020 12:45:26 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20200130113339.GA25426@redhat.com>
References: <20200130062028.4870-1-madhuparnabhowmik10@gmail.com>
 <20200130103158.azxldyfnugwvv6vy@wittgenstein>
 <20200130113339.GA25426@redhat.com>
MIME-Version: 1.0
To: Oleg Nesterov <oleg@redhat.com>
From: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <32DE6B3E-ADC3-49EB-888C-CABCF82330FE@ubuntu.com>
Cc: paulmck@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, madhuparnabhowmik10@gmail.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
	warnings
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

On January 30, 2020 12:33:41 PM GMT+01:00, Oleg Nesterov <oleg@redhat.com> wrote:
>On 01/30, Christian Brauner wrote:
>>
>> On Thu, Jan 30, 2020 at 11:50:28AM +0530,
>madhuparnabhowmik10@gmail.com wrote:
>> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>> >
>> > This patch fixes the following sparse error:
>> > kernel/exit.c:627:25: error: incompatible types in comparison
>expression
>> >
>> > And the following warning:
>> > kernel/exit.c:626:40: warning: incorrect type in assignment
>> >
>> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>>
>> I think the previous version was already fine but hopefully
>> RCU_INIT_POINTER() really saves some overhead. In any case:
>
>It is not about overhead, RCU_INIT_POINTER() documents the fact that we
>didn't make any changes to the new parent, we only need to change the
>pointer.

Right, I wasn't complaining.  RCU_INIT_POINTER() claims that it has less overhead than rcu_assign_pointer().
So that is an additional argument for it.

>
>And btw, I don't really understand the __rcu annotations. Say,
>according
>to sparse this code is wrong:
>
>	int __rcu *P;
>
>	void func(int *p)
>	{
>		P = p;
>	}
>
>OK, although quite possibly it is fine.
>
>However, this code
>
>	int __rcu *P;
>
>	void func(int __rcu *p)
>	{
>		*p = 10;
>	       	P = p;
>	}
>
>is almost certainly wrong but sparse is happy, asn is the same.

That's more an argument to fix sparse I guess?
The annotations themselves are rather useful I think.
They at least help me when reading the code.
It's not that rcu lifetimes are trivial and anything that helps remind me that an object wants rcu semantics I'm happy to take it. :)

>
>
>> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
>
>Acked-by: Oleg Nesterov <oleg@redhat.com>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD78C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:04:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8A024671
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8A024671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF1608212F;
	Wed, 15 Jan 2020 15:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z18wYgylBaWz; Wed, 15 Jan 2020 15:04:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D48BD820E4;
	Wed, 15 Jan 2020 15:04:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB368C1D83;
	Wed, 15 Jan 2020 15:04:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F117C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4689783553
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwnuv6mLOvh7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D8DC84921
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:04:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m24so206848wmc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 07:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xQvK3Khfh8ssHY6UKXAmXLE4MXakJFMEfTNk2HuT3e8=;
 b=TO9BokUKgcR2xM9JYNWeWoFiUHRBO87GriAZz1JKVidyf+ivkTSI50iVrJ6hrhOYiT
 HMkkVAoB8eUVwWn4gOvsC0EIswl9DuIWq6YrhIe6/abBbTSG/kp0cUqDT9j+acKwCFUA
 S1MTRqNKwaXzrSMaxsOnq5bimTwkr9NkUQm6QyIiUr+Renrf+ZYDOoT35fB7v1aY1p/V
 8bQVjW+mAiPHya5yPqz2F0DCLKXqN/7ngReAhY11smzE/XkXtfWOmSkvRz5Yb853bRSg
 O2xMoOoB8FX9SQqwKdTJtFELd9Q6S+539F8Ibn1sM2hiw6NEVOFoqUxf12jmOE7O6KRK
 40iQ==
X-Gm-Message-State: APjAAAXe9IEh9nmhLXPfSEAPzMON/D18C82RVysb8pttRO8XaZglUOz7
 hz+t6PLU7d9sAQmftxdbZ9k=
X-Google-Smtp-Source: APXvYqy279tPnlZqttod0cBi9Mva6wkZHlFzeLjXHeZe9tBQL0b+hXbPpd8U2Ldc2U+oX97PYuyAOw==
X-Received: by 2002:a1c:2187:: with SMTP id h129mr244143wmh.44.1579100669759; 
 Wed, 15 Jan 2020 07:04:29 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id b137sm133936wme.26.2020.01.15.07.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:04:28 -0800 (PST)
Date: Wed, 15 Jan 2020 15:04:26 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Message-ID: <20200115150426.svapzpux2tbbgvmn@debian>
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
 <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Wei Liu <wei.liu@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 paul@xen.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netbank: hash.c: Use
	built-in RCU list checking
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

On Wed, Jan 15, 2020 at 07:36:38PM +0530, Madhuparna Bhowmik wrote:
[...]
> 
> > The surrounding code makes it pretty clear that the lock is already held
> > by the time list_for_each_entry_rcu is called, yet the checking involved
> > in lockdep_is_held is not trivial, so I'm afraid I don't consider this a
> > strict improvement over the existing code.
> >
> > Actually,  we want to make CONFIG_PROVE_LIST_RCU enabled by default.

I think you meant CONFIG_PROVE_RCU_LIST.

> And if the cond argument is not passed when the usage of
> list_for_each_entry_rcu()
> is outside of rcu_read_lock(), it will lead to a false positive.
> Therefore, I think this patch is required.

Fair enough.

Wei.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

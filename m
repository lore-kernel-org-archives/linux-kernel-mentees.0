Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A23C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 13:23:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C0372076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 13:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ay1FYh8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C0372076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CEE212014B;
	Mon, 21 Sep 2020 13:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gedJZ21H5Wpu; Mon, 21 Sep 2020 13:23:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EDE4620023;
	Mon, 21 Sep 2020 13:23:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD3D4C0889;
	Mon, 21 Sep 2020 13:23:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30937C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D24E845A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3NRWHE3F44a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0A91283F11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 13:23:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l17so12704948edq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=dI7WkMnuX426h49UwNs3TZGYdroPs/XrbEXY+Wy+9Ew=;
 b=ay1FYh8t2+9Ak+fnjFGIoMbzuVe1DwH6PGaJp/D/vJup2c6L4+CI/4KmLVhPmrQR0Y
 7uYqKp8+ZuVk2SII7Z8P++BvMiSYecXLoPl0/NGrQzIxdrERuI/PxdH1PhXLigZ2XyBT
 LhydgUYcdQrQa0zfKT5RFW9kO4uWCnkk3W8iWfCaSLKO7N69+h6OCDUg8HpzRObCCHvU
 2XI/f8jCFlN5VmG3HEy2cyF9TNQT0bWiFiR052W79if3IlpXycXdFfOGG8ilWGr/rqMH
 w++2aH9cbN36OM372DnVCyJwJWdH1vtXqIp7/Y+DDD91OVJgD6FoKQmqkIC1dwl0p8ut
 qSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=dI7WkMnuX426h49UwNs3TZGYdroPs/XrbEXY+Wy+9Ew=;
 b=HFYeRFevRJFuMTtCNMoi98weNy7HCS37ftO5A7J67xulIwkyoUxtvqiu0CTYzRfKau
 i4dkaCvwKA9bpw8UClPLgRJDH6N5GejpTeyqGckt3hQ6F4rDSdf6TUewkLkV7rqE3+sc
 hVck1UN18H0/IGAD4VOpwQHsxapl9blRpTaMPl9AMgSEiVKZGeXbUOGXl80qHKwkH90s
 TRf1dd6Q7A+LVfJqJytRE8MbRtuBkIp8kHKEQxlJNXuvYpJvOJTaqj5lO8YT436qMKWH
 URKadWnLDiU9g0wNV8d7cM+GiIDZyjHO3NigCXn6tIMFR5YfTxQYbMNfF1C/87f2eIyD
 zlxQ==
X-Gm-Message-State: AOAM530IrrKw7+nlbQErw3tXyXQqA6T/OSrRCdWNp3kbfqw/AOLt9uVJ
 uw5mNDVq+q9eLys5zSO1N3k=
X-Google-Smtp-Source: ABdhPJzJczcd0cqlMwhV8vFrck4RNoRieXVK020qiEyctrto5+P18dN0kcsk5iWt8PJnuUv+2ydgFA==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr54260730edm.100.1600694600507; 
 Mon, 21 Sep 2020 06:23:20 -0700 (PDT)
Received: from felia ([2001:16b8:2d52:a400:b8f0:7fc9:d2d5:7244])
 by smtp.gmail.com with ESMTPSA id i26sm8652190edq.47.2020.09.21.06.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 06:23:19 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 21 Sep 2020 15:23:14 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009211515030.19489@felia>
References: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl improvement:
 NO_AUTHOR_SIGN_OFF warnings for users with multiple emails
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



On Mon, 21 Sep 2020, Dwaipayan Ray wrote:

> Hi Joe and Lukas and others,
> I would like to elaborate a bit on the issue and the solution I
> have thought of for fixing Missing Author Signed-off-by
> warning for regular committers who use multiple email
> addresses.
> 
> The problem:
> While running checkpatch on previous commits to the kernel,
> there were multiple such instances where the author had
> signed off using a different email address rather than the one
> which he used to mail the patch.
> 
> From Lukas's data:
> 
> $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv  | cut -f 7 | sort  | uniq -c |
> sort -nr | head -n 8
>     175 Missing Signed-off-by: line by nominal patch author 'Daniel
> Vetter <daniel.vetter@ffwll.ch>'
>      68 Missing Signed-off-by: line by nominal patch author 'Trond
> Myklebust <trondmy@gmail.com>'
>      43 Missing Signed-off-by: line by nominal patch author 'Thinh
> Nguyen <Thinh.Nguyen@synopsys.com>'
>      40 Missing Signed-off-by: line by nominal patch author 'Pascal
> van Leeuwen <pascalvanl@gmail.com>'
>      36 Missing Signed-off-by: line by nominal patch author 'Alex
> Maftei <amaftei@solarflare.com>'
>      31 Missing Signed-off-by: line by nominal patch author 'Valdis
> Kletnieks <valdis.kletnieks@vt.edu>'
>      24 Missing Signed-off-by: line by nominal patch author 'Luke
> Nelson <lukenels@cs.washington.edu>'
> 
> So most of them belong to the case where they have signed off
> using a different mail address. I believe these can be handled
> better.
> 
> Proposed Solution:
> The .mailmap file contains mappings of the following types:
>   name1 <mail1>
>   <mail1> <mail2>
>   name1 <mail1> <mail2>
>   name1 <mail1> name2 <mail2>
> 
> Thus loading .mailmap data and matching email addresses for
> the same author would resolve many of these warnings.
> 
> Now the remaining problem at hand is to have a data structure
> by which this query can be handled easily without much extra
> overhead.
> 
> One possible solution is while parsing the author, also load mailmap
> and load associated email addresses to the author and load it
> into a hash. Next when a signed-off-by line is encountered and
> the email is found in our hash ( or maybe some other ds ), then
> the signed-off-by match should be positive.
> 
> Is this feasible? I would be looking at other possibilities too. But it
> would be great to have your view on it!
>

This sounds like a plan.

I expect that this task would roughly take you 40 hours of work to get
a first patch ready to the state for review at lkml.

Please use the linux-kernel-mentees mailing list for early versions of 
your work before that.

Then, I expect another 40 hours of work to get all reviewers/maintainers 
happy and get it towards final acceptance.

I suggest that for the first mentorship milestone, we also add to have
some basic documentation and some patches directed to the developers
we can already see with special setups, e.g., Daniel Vetter, with suitable 
entries in .mailmap for them. They can then ack those .mailmap patches and 
integrate them.

Let us aim to have 10 patches for those most regular developers sent out 
and at least one being accepted.

Would you agree to that for the first milestone?

If so, please state here and provide all needed information in the 
community bridge system. Then, we will proceed in the system, such that 
you get an official go and you can start fleshing out these patches.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

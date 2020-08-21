Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F40C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 07:25:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9A820732
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 07:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXuJ+s4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B9A820732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56DD486B92;
	Fri, 21 Aug 2020 07:25:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOdbfgOqIVNI; Fri, 21 Aug 2020 07:25:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC70484EF0;
	Fri, 21 Aug 2020 07:25:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C45AFC07FF;
	Fri, 21 Aug 2020 07:25:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1D71C0051
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E649688543
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWhbNiAEoHmf
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 09FBD8853D
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 07:25:10 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id o18so1166739eje.7
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lQbA8kDA64UpnkmMvqwZyKmrftyr3xg5bwJsBPEBMk8=;
 b=EXuJ+s4mEUXhPnA5kgCOA8PLrteXT34Oa6MjSm5xguXMqOo5x6kiAYu0NrDIcDqlv9
 /jJrX5Yqa6dlevh6uXucaJ+BN/SrNOpNLwC85GCNbHkI6b0/Bk1jetZkPQ9eGXjRkZ7O
 Cf/IODuURjA5Ww2TThBGZZaQXa38KByqUydOPR/jc/wrfSxc2EGWQDGgJfIgHHtwzTif
 92G/BgK3ZHAiUHc1qpGPLAmS4zoov8gmbhgb7uQiylFhi0GU6w9f8wZaqg544rECiF9r
 ZJNAOa9vzJYwPDVMc8e+su3WplCcNs3ypnLx6crocfN+TmDvDTYfYe98lQpEuu/rTyJm
 Ws3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lQbA8kDA64UpnkmMvqwZyKmrftyr3xg5bwJsBPEBMk8=;
 b=A1AZz/nzI/meTYuR88FgK7IBxVojO9LpEJrcmBPdmt7EfwJ3JCH8mWH4Lt1oaVNEVo
 iSaYoIXO9kAGyzJOTeIQs2+JKN4wsTB9mewISCC6geVhtEeGu2zfdhOAaT/1Ry9jRJ8w
 iZf0qdBv/qDhr+kYd0uUCQzNv5IYDJ/YhvStab0vBZMmciPHO2DskeYJ0Hm+y3zmWqK9
 I4dosNBgObncdFuCpsjcmJ8TU/4Nu7tmZ5vvXRzG3rwIU8RgNV5UgFVMIJ+hVFv42pBd
 zIZSW42z7kQfabIJrj4cD3n+VjpApMucg472FYt9n8jtEqr4uaxFZHkVQyih6Ms7VKLr
 0XoA==
X-Gm-Message-State: AOAM533MeC+Y5NyIBYveo5yhJqZqNhEscvH8KbAlg2Hi8X2F3unfBhHg
 wbXtetyUhvT5KWMALXJrrfY=
X-Google-Smtp-Source: ABdhPJz56rwf9RJ48E17cEkAUxXmt+YH46j7sevhJLrUBBGSnJVI7E6PRS5Vu5S9C1iMrtfORIVoGw==
X-Received: by 2002:a17:906:bc9a:: with SMTP id
 lv26mr1569807ejb.392.1597994708304; 
 Fri, 21 Aug 2020 00:25:08 -0700 (PDT)
Received: from felia ([2001:16b8:2d49:ff00:c48:28cf:8c03:d14d])
 by smtp.gmail.com with ESMTPSA id rs5sm775381ejb.44.2020.08.21.00.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 00:25:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 21 Aug 2020 09:24:58 +0200 (CEST)
X-X-Sender: lukas@felia
To: Piyush Thange <pthange19@gmail.com>
In-Reply-To: <0e4f5ecc-0708-b64f-288b-a232afc46ac6@gmail.com>
Message-ID: <alpine.DEB.2.21.2008210921370.27424@felia>
References: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
 <alpine.DEB.2.21.2008171132050.8645@felia>
 <0e4f5ecc-0708-b64f-288b-a232afc46ac6@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linux-foundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch
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



On Fri, 21 Aug 2020, Piyush Thange wrote:

> > 
> > Hints to the first task:
> > 
> > Can you create a list of all non-merge commits that were added in the
> > version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> > and not already in v5.7?
> > 
> > Can you share the script/command you executed and the resulting list on
> > github?
> > 
> > Can you run your script on all commits of this list above and record
> > all checkpatch.pl reports, and store them in your github repository?
> > 
> > Can you suggest ideas how to aggregate the findings and create a
> > statistics? For example: Which type of error is reported most?
> > Can you implement that idea?
> > 
> > 
> > I also suggest to have a look at
> > the options ./scripts/checkpatch.pl --list-types and
> > ./scripts/checkpatch.pl --show-types. The option --show-types changes
> > the output of checkpatch.pl to list type identifiers, so it is easier
> > to parse and aggregate the output.
> > 
> > Please also share the script you create for that purpose on your
> > github repository.
> > 
> > 
> > 
> > The second task is to pick one warning that appears often and improve
> > checkpatch.pl to handle that better and get it accepted by the kernel
> > community.
> > 
> > Hints to the second task follow when the first task is solved.
> > 
> > If you fail on any of those tasks, you are out of the selection process.
> > 
> > 
> > Lukas
> > 
> 
> Hello everyone,
> As mentor Lukas Bulwahn have provided the first task 1, I've collected some
> results for the patches on kernel v5.8
> Please do check. And If any issues please respond
> 
> https://github.com/its-crypted/Evaluate-and-Improve-checkpatch.pl
> 
>

I had a look and it is a starting point of task 1.

My request below is not addressed yet:

> > Can you run your script on all commits of this list above and record
> > all checkpatch.pl reports, and store them in your github repository?
> >
> > Can you suggest ideas how to aggregate the findings and create a
> > statistics? For example: Which type of error is reported most?

Can you answer the question: Which type of error is reported most on all 
commits from v5.8?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

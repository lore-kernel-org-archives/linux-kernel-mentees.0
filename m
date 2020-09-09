Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4ADC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 06:45:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B3E20936
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 06:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qfb+F9Sj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B3E20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41D7886D6B;
	Wed,  9 Sep 2020 06:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnAdzuJzWpz6; Wed,  9 Sep 2020 06:45:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C2AD086D50;
	Wed,  9 Sep 2020 06:45:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEFAEC0052;
	Wed,  9 Sep 2020 06:45:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E686C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 06:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1D63186D5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 06:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVhFSQGrnRoB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 06:45:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 34BE186D50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 06:45:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id p9so1917365ejf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=O7XJummFZbdyGfDyYAOdhIr1DSe3QxDtYXQ2VmZLJSk=;
 b=Qfb+F9Sj1pLvulL4ariOFTJfDd4u6M6oRMVz5g92yHevqVtne2ADHMsI8AItmF5wWn
 UWgu3MHZp9w3UrX0q1kauTwN+Httbc4cUl0eRsL3jGG5t0Tt/rknLG8XnyTThkxX8TFC
 FZQzwfg+6SUNtNCAquR2c/lwdaLBfMad8uGwZwH5tZ/tgxTij0uJr0U9hLNE+7EYyDqM
 DGE9JZqkxLdJ1ml3mgfIfy2rsE/0q7FOpGgwbi3Df7alYPq47W4Ru8WU+xmVjkvlcSof
 IYxYR4722XEQ1bZAeoXgH9v/36LX+1PaRor1pjECvbinxRovBFQ2AX95i3rtIcC5USni
 xk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=O7XJummFZbdyGfDyYAOdhIr1DSe3QxDtYXQ2VmZLJSk=;
 b=hzV6zS8NtSmVlFsxFVM3t5GoNJz1By9YdddyPUoUpd5C3Xv/hYzS/pg0iNUe8S2+s+
 rxOs9At88LO2hwBY/Qq7UPL3D7qCrrMJA6rO1Dly/FgIU1nVbcZjF1NaH0ShlCMWNvTp
 DJIo5CabCugaI6Xv6UjMH1MlM7bspp2wRT8Dr4jgvP0QmOtdy87nZX67U9c9r73js5JX
 qYcCKxn0ikrKhiZKy+Yp9bpDM5hPQOrarmUElR/HFPLBn21HlfNuo/2oX+BR0QcQYdzO
 4H59zX4025E92OSQcvP6zohbOZl1Jr39Lug1LJ37ZHCMO64KWMTpWC9ZctI5fWHBbfmd
 tqfg==
X-Gm-Message-State: AOAM533QtMv99fzMhQlbw4h3ugUGb2QxTTVfzY+3dQ+B5rN09aw5NgDs
 WtdeOVHz64b26+qSE2UdWyM+zhaVCBeJxQ==
X-Google-Smtp-Source: ABdhPJz9RpHguMJW/zoJDHWOifXUpL0PxGyTafKM1uHqsTFHu0Z+E4TyanTVykBkw7uJywjfKVfb1A==
X-Received: by 2002:a17:906:1b11:: with SMTP id
 o17mr2355809ejg.67.1599633948695; 
 Tue, 08 Sep 2020 23:45:48 -0700 (PDT)
Received: from felia ([2001:16b8:2d44:6000:6108:df55:7b8e:67d4])
 by smtp.gmail.com with ESMTPSA id d13sm1122886edl.68.2020.09.08.23.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 23:45:48 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 9 Sep 2020 08:45:46 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <a5104e46-c652-ce52-3604-c33000234718@gmail.com>
Message-ID: <alpine.DEB.2.21.2009090839110.5622@felia>
References: <a5104e46-c652-ce52-3604-c33000234718@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch: general
	doubts about project
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



On Wed, 9 Sep 2020, Ujjwal Kumar wrote:

> Hello Lukas,
> 
> I'm Ujjwal Kumar, and this is my first mail to the community :).
> 
> Recently I came across the following project on Community Bridge:
> "Linux Kernel: Evaluate and Improve checkpatch.pl"
> 
> I'm interested in the project (as I think of it as a head-start for me with
> Linux kernel development).
> 
> While I was going through prerequisites and mailing list archives, some doubts
> came to my mind. These are:
> 
> 1. The prerequisite says: "Show that you are able to modify checkpatch.pl and
> get a change accepted in the community". Because I'm a bit late I am wondering
> if it is even possible to get a patch accepted and hence to complete the
> prerequisite. As you are not familiar with my abilities and knowledge, please
> consider answering this based on your experience.
>

You will need to be experienced with perl, basic English writing skills, 
and need to show some basic scientific thinking, i.e., understand how to 
evaluate a change on a larger dataset to estimate pros and cons.

> 2. I already see some people working around the project, so I have this
> specific doubt. Does the nature of this particular project allow selection and
> hence the contribution of more than one mentee?
>

The project provides different areas of focus and there is enough work and 
investigation to look into. Multiple mentees can be mentored on this 
project.
The selection is based on the most promising learning curve and the 
mentee's ability to structure and show that they can identify an issue and 
find reasonable solutions through the discussion with the mentor and the 
community.

The first task is to set up a working environment that allows contribution 
of changes to the kernel community and the follow-up discussion.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

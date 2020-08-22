Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A34CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 08:07:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB192072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 08:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrjnGclw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB192072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C506B86C5D;
	Sat, 22 Aug 2020 08:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6XUCxj1UalM; Sat, 22 Aug 2020 08:06:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C640D86C41;
	Sat, 22 Aug 2020 08:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFBA8C0889;
	Sat, 22 Aug 2020 08:06:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E68C8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 08:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF21987EBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 08:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMNRsxBltH6P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 08:06:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 881CB87E93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 08:06:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f18so2616335wmc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=uOxzi+MeaANrz6BNbK1+FXcxZrz6chQJnwvaRgx9+0g=;
 b=VrjnGclwMeY7TtMKMQxu/nWydquNZVS43EaUEoHI+wWqZ+cP9+Nvou4t9kO+1xDPz3
 97R7qKPutaLQctqnV2fE0y2YcKvvzLGgaK3s5N3fKvj44uQw62b2EZmBY/5Q4b3GjR42
 jkLP0FacF+whzIjJVqsAFCXZq+tPYqLT0U46/RqWT7bW9hK560gOWvKBGrlUkgiq+la3
 0YXKZ9sqNZ904yHAn9oVhcAV80xAkFOoBdAMegmF1xfcG2FEQjDNh5H98ssEKAgM11Ld
 4tP+8JFjaWpY53aOsB/SDYi+W9/4vEk5rCUODwqPdpC1swHr0ejkIyANVH1sSAmfbIHX
 toxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=uOxzi+MeaANrz6BNbK1+FXcxZrz6chQJnwvaRgx9+0g=;
 b=JJBzCj//XL3yeb45/XXThlqOvnZ46dgaSAak3KGkTOEDhJUH8vf/00fVr1R67zfTgl
 feFtHwD1E4oemJFHcaI1Q0BWsCpzcXnKfpiLFaDzX0AhAqpmQjIZyt7RXo7Ly14cVIwq
 jdnr52KsDogUakOwP0YIRSc3PMFFqynU30EuYTcu2Ldm+7UD8+JVtU7Qg8YmU4B9M/V5
 ZMl014Tuh3PPsEcePVoBf3svtps+dBzNE+d8gju8fscKmxbsPB/x1glN9UrxsMaZdUqF
 KcSRa2mLvuLkI43fXhxcpiFL2MkPLb4+pqR25Yihv4+Gi0M4JoJ7FlamAwAfnQNf/ChF
 U00g==
X-Gm-Message-State: AOAM533d/Pv0JEsboBN91brjrZZVuJEdnRyf1UE4Ha5uWQXafYR08Z63
 KXdUYuKg0MdSDODhK1EMBYM=
X-Google-Smtp-Source: ABdhPJzFXYcXtiZf4H4WW7v0L4E+ZSpSRCJFZEXKWvBHtf0F3pDn+Hxv3ANsg3zzZX9M5p+anqI5iw==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr7084835wmk.47.1598083615773; 
 Sat, 22 Aug 2020 01:06:55 -0700 (PDT)
Received: from felia ([2001:16b8:2df2:8300:99a:78d3:1c97:95fb])
 by smtp.gmail.com with ESMTPSA id z66sm10248595wme.16.2020.08.22.01.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 01:06:54 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 22 Aug 2020 10:06:49 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <4f5612540c184970157a98d103d7cd04@disroot.org>
Message-ID: <alpine.DEB.2.21.2008221002290.12792@felia>
References: <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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



On Fri, 21 Aug 2020, Ayush wrote:

> August 17, 2020 3:13 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
> 
> > Dear Ayush,
> > 
> > The zeroth task is to learn suitable netiquette for the communication with 
> > the kernel community.
> > 
> > First, please do not top-post.
> > 
> > A: Because we read from top to bottom, left to right.
> > Q: Why should I start my reply below the quoted text?
> > 
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > 
> > A: The lost context.
> > Q: What makes top-posted replies harder to read than bottom-posted?
> > 
> > A: Yes.
> > Q: Should I trim down the quoted part of an email to which I'm 
> > replying?
> > 
> > Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
> > 
> > Third, set up your email client according to the kernel community rules.
> > 
> > Then, the first task is to run checkpatch.pl on a few kernel patches and
> > collect the results. When you have that, please share your script with
> > me, e.g., in a github repository.
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
> > I also suggest to have a look at
> > the options ./scripts/checkpatch.pl --list-types and
> > ./scripts/checkpatch.pl --show-types. The option --show-types changes
> > the output of checkpatch.pl to list type identifiers, so it is easier
> > to parse and aggregate the output.
> > 
> > Please also share the script you create for that purpose on your
> > github repository.
> > 
> > The second task is to pick one warning that appears often and improve
> > checkpatch.pl to handle that better and get it accepted by the kernel
> > community.
> > 
> > Hints to the second task follow when the first task is solved.
> > 
> > If you fail on any of those tasks, you are out of the selection process.
> > 
> > Lukas
> 
> Sir,
> 
> I have attempted the task 1 and pushed the same to GitHub.
> 
> Please have a look and suggest improvements.
> 
> https://github.com/eldraco19/evalute_improve_checkpatch_pl
> 
> Please let me know if there are any issues with this.
>

So far, so good.

Here are the questions we want to answer:

- So what are the 20 categories that occur most?

You are getting close to that answer, but you are not there yet.

Then look at the findings. For those 20 categories, are there specific 
findings that are multiple times false positives?

So, the script complains about something, but it does not get that the 
patch author wrote something completely unrelated to the error message.

Lukas

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

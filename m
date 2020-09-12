Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC92C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:03:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F226620855
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 11:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+wnMinU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F226620855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7E0C86D19;
	Sat, 12 Sep 2020 11:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y79sQXSQt0td; Sat, 12 Sep 2020 11:03:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5914861D5;
	Sat, 12 Sep 2020 11:03:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA431C0859;
	Sat, 12 Sep 2020 11:03:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF01C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2860B86E2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG3vPW3EaxuH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:03:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DD83786D19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 11:03:03 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id t16so12909624edw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=36BOB9Ri4vteSi6jI7oSo+ME3KYzHoXHSodUlbnV7Wk=;
 b=F+wnMinUIhxmS5QlS7f/6OwWsX97RC9VzmlrVJZwkBJcVQnWMGkHtI1wLNzMcK4Vkt
 Dg6a3ijYdVrii2m5/uE6oRF81jjrVdWhaZKZoxCrg8TvWYB5m5XMAXbXdYc69bkbcrHK
 pEvepy40Mqbfmkswn5rILXAzH8Zo/TTL8eXgvSflP1Js3w3hUXQg59F8iPew8e3zT39D
 oex0VsyxCObYNhKO1DXdp5uvhn26M7tmrwrnb07OtQFN8tInrFEfxTtp4MX7gsk2xAMT
 imGMcJcCLJT/naYXZGOY2zHZG8CA5sP3sArIgYRjga+Mbw/56bwU2GkzalWR3qBtoYPd
 mMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=36BOB9Ri4vteSi6jI7oSo+ME3KYzHoXHSodUlbnV7Wk=;
 b=NY8Hwh9fmZV0j2bPSbKPm5d04FSDUdYo31y8QAWKuygn+JBSlTljiQGq1TTJ7d6a+T
 ZjzRJOnC9frdkJYKPyIdFz3YQFp8xKzlFHAkW7garSF3wvvwq9L2QnfcJ5xZsgdYkjBj
 b0djKtPEWhtIWBMFewvHmGCe8ehWLIVuZNgpiuF9UKOPxjoWopzgrDo1boDUKYPrJJbn
 52DLluaVe5KJY+qrIvAJNBQjGLksBxY1VOi1KeVOWseMMbBwue0tlOtwIsKaCEVsP783
 w5KkpyApaRHjxLZTLGp45/OcFVSnIxM9VXgK4ET0vWnGWfpMbLowl96Vut+LowYSs8E7
 negA==
X-Gm-Message-State: AOAM533hrnGBn5QziNtRwX2VQIg/uGFx+7yWP6ulWLoxgNRBTnv6TMi4
 sVBYqfGDC+WhCDdlkEm948o=
X-Google-Smtp-Source: ABdhPJxARHR52hA9/m+ZOytxpZsOMm46YhsSRolFrK2MI0/soklit/tEsyU6i8FGx0pC4U7uX3dcfw==
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr7978227eds.366.1599908582240; 
 Sat, 12 Sep 2020 04:03:02 -0700 (PDT)
Received: from felia ([2001:16b8:2dd9:a000:782a:45ff:c1e1:cfe9])
 by smtp.gmail.com with ESMTPSA id r15sm4329290edv.94.2020.09.12.04.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:03:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 12 Sep 2020 13:03:00 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009121252280.13082@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1637917147-1599908581=:13082"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1637917147-1599908581=:13082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 12 Sep 2020, Dwaipayan Ray wrote:

> 
> 
> On Fri, Sep 11, 2020 at 12:59 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>       Dear Dwaipayan,
> 
> 
>       The zeroth task is to learn suitable netiquette for the communication with
>       the kernel community.
> 
>       First, please do not top-post.
> 
>           A: Because we read from top to bottom, left to right.
>           Q: Why should I start my reply below the quoted text?
> 
>           A: Because it messes up the order in which people normally read text.
>           Q: Why is top-posting such a bad thing?
> 
>           A: The lost context.
>           Q: What makes top-posted replies harder to read than bottom-posted?
> 
>           A: Yes.
>           Q: Should I trim down the quoted part of an email to which I'm
>       replying?
> 
>       Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
> 
>       Third, set up your email client according to the kernel community rules.
> 
> 
>       Then, the first task is to run checkpatch.pl on a few kernel patches and
>       collect the results. When you have that, please share your script with
>       me, e.g., in a github repository.
> 
> 
>       Hints to the first task:
> 
>       Can you create a list of all non-merge commits that were added in the
>       version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
>       and not already in v5.7?
> 
>       Can you share the script/command you executed and the resulting list on
>       github?
> 
>       Can you run your script on all commits of this list above and record
>       all checkpatch.pl reports, and store them in your github repository?
> 
>       Can you suggest ideas how to aggregate the findings and create a
>       statistics? For example: Which type of error is reported most?
>       Can you implement that idea?
> 
> 
>       I also suggest to have a look at the options ./scripts/checkpatch.pl
>       --list-types and ./scripts/checkpatch.pl --show-types. The option
>       --show-types changes the output of checkpatch.pl to list type identifiers,
>       so it is easier to parse and aggregate the output.
> 
>       Please also share the script you create for that purpose on your
>       github repository.
> 
> 
>       The second task is to pick one warning that appears often and improve
>       checkpatch.pl to handle that better and get it accepted by the kernel
>       community.
> 
>       Hints to the second task follow when the first task is solved.
> 
>       If you fail on any of those tasks, you are out of the selection process.
> 
>       I could implement that with just a few lines of code changes, but please
>       do not underestimate the learning curve here. I hope you are very fit in
>       Perl, that is required for this project.
> 
> 
>       Lukas
> 
> 
> 
> Hello Sir,
> I have gone through the zeroth task and I am aware of the mailing rules now. 
> Also I have implemented the first task and I would like you to review it.
>

Hmm, your email client still seems to be broken :( If you answer to my 
email, it should use ">" not tabs. Maybe you can fix that.

> The task was to run checkpatch.pl on some commits and aggregate the reports. 
> 
> The first subtask was to collect the non merge commits between versions 5.7 and 5.8. 
> I aggregated the commit hashes and author names into a single file using git's log
> and pretty format directives.
> 
> The next subtask was to run checkpatch.pl on all the given commits.
> I wrote a perl script to this effect which reads the commits stored in the 
> file and runs the checkpatch.pl script with the commit hash. Also I used the 
> --show-types directives in this stage which allowed me easier collection of
> warning and error identifiers.
> 
> The final subtask was to aggregate and parse the data. Looking at the checkpatch's output 
> format, I determined it was enough to parse only the first two tokens from each line.
> I calculated three possibilities:  "WARNING:{warning_identifier}", "ERROR:{error_identifier}",
> "Commit {commit_abbrev_hash}", and aggregated these values.
> 
> Finally I used them to find total commits read, total errors, total warnings,
> and the most frequent warnings and errors from checkpatch's output. 
> 
> I have uploaded the scripts and output files to https://github.com/raydwaipayan/lkm-task-1
>

I looked at your scripts, I did not run them. They look as if they would 
do the job you claim they do. They are more complicated than needed, but 
it was not the task to find a simple solution. So, let us try them.

Please have a look at this patch:

https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/

The author states:

This issue was discovered through a thorough analysis of checkpatch.pl
errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and 
v5.8.

Before applying this patch, checkpatch.pl reported 342 errors of type
GIT_COMMIT_ID. After applying patch, errors reduced to 284.


If your scripts work, you should be able to confirm the statement.

The tasks are:

1. Run your scripts and create a full statistics of all error types with 
their according count for v5.7..v5.8.

2. Apply the patch with git am.

3. Run your scripts again and create a new statistics.

4. Compare before and after

5. Make all results available on your github repository.


Lukas
--8323329-1637917147-1599908581=:13082
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1637917147-1599908581=:13082--

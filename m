Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669EFC636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 16:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBD861159
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 16:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBD861159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0C56606EF;
	Sat, 17 Jul 2021 16:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcPNu9hOyMof; Sat, 17 Jul 2021 16:16:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A91ED606F8;
	Sat, 17 Jul 2021 16:16:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81314C0010;
	Sat, 17 Jul 2021 16:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A77BFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95957404A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdoqdnyTwQm3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:16:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 194B340108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 16:16:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id r135so20063103ybc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h7jpZi4WTab7PTLc9+gc0j+xGvn49ruXm7MftXb4oFk=;
 b=Z3VUYJZagAkOexiFRbaQrow7grXduD4aNnaBzu/p6LTNk42bXwjPm33NoEV8ejlB1g
 ALeuR9QwRFm29XWV/iV7SCu6al9tNxbWGzy8m6cbj6g8RTFWZPEJpwLCpF/bKljwJ4xp
 vK3dRB7Lv4ZwG9yMagoFXFHPxlx6w3pW68YX9XkN6u7pKz+1b3ifvZAszm8hde8fTynJ
 X9u5lTBeEGApW4QrqPINUtGcIjycii0Q97iWqmoBN+HjviwXEUwPy+yAywYQlTDMDBV6
 PNPWEOESj5ia/oXjbE2KRka3KvRZ7/uQR8uegj1yeHX6KaRdwMo927JbixjcqBQYhShj
 w0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h7jpZi4WTab7PTLc9+gc0j+xGvn49ruXm7MftXb4oFk=;
 b=TulamrdGCa05Yei1BuD0VPH/q3aHquEpAu/C34h+DgpAYM5YwcIcjys2OZGfXBirid
 8+cKf425HjlGO8Z3Usw462d/06IzDw7xH5p/zIbQUQOrH9kt7L5Vh+MTHjK28wzxQF15
 aIvBeSvwYU59JX9pXigFaiCB78ErohpcJFWk7uJIWT0oSftmd7NhhPRuhli0ZrRtk2hP
 T3L5NtO1U9z8hYW/Yf2VzMrmdW6di3OHVpoQHbqTI7n8VbEwiy1joIkYONIBQK76uKqN
 W37Ig/96g/GL7Hz/lpx9oJttf5cbLA+Z6HG3DW2PP/ODaspNrFzGMe/ctaszVhvN7195
 sA+w==
X-Gm-Message-State: AOAM530jLNuA+XnPq+D9i8JskILLlZG3H3N1hi1Ex5TuGJ/3Ry+DqMV7
 gRic7tBoHMQij+LgoCpxaHzIrqkFJAfD4wAe/8E=
X-Google-Smtp-Source: ABdhPJw9RcLKLbYoJNwC9khT+/7CQzFctoC0k7Co871b7WFi8QGSnFP8PIuoCICrg/T3qe+rJ9pgCd3goqPbCJr4CdA=
X-Received: by 2002:a25:8b86:: with SMTP id j6mr19096208ybl.470.1626538608999; 
 Sat, 17 Jul 2021 09:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQwXtiEpzO_8T7VC8dFp3tieV+1JpW1O7m0MTgw4vvdy09gsg@mail.gmail.com>
 <CABJPP5CgAFP8ejqjha62T9GEW2gau=-GC3CTO1s6eq=_ADsnOA@mail.gmail.com>
 <CAEQwXthguwDuB19NMEkfuftxta+wNvsTVzD+UbB=Pa4CM9fK7A@mail.gmail.com>
In-Reply-To: <CAEQwXthguwDuB19NMEkfuftxta+wNvsTVzD+UbB=Pa4CM9fK7A@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 17 Jul 2021 18:16:38 +0200
Message-ID: <CAKXUXMy2djTKxXso_U-NVOJEU6XD-ZyfExyfB=pPJC-ws0sM4g@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship Project
To: Ashutosh Sharma <b18010@students.iitmandi.ac.in>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 17, 2021 at 6:02 PM Ashutosh Sharma
<b18010@students.iitmandi.ac.in> wrote:
>
> Hello,
> I am enclosing my submission for assignment 1. For this assignment I went through the checkpatch documentation which I found on https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html and then I looked at the implementation of checkpatch and tried to understand what is happening by the comments.
> Thanks
> Ashutosh

Ashutosh, you unfortunately failed on step 0 to learn suitable
netiquette for the communication with the kernel community. Sorry, we
will not answer your email and not continue to exchange with you until
the suitable netiquette for the communication with the kernel
community is followed. Please go back to step 0, consider the rules
for communication with the kernel, check what you did wrong and
improve all those issues and try sending your email properly again.

Our mentorship program is an offer to learn; so read the available
documentation on communication with the kernel community, and give it
another try. When you learn now at the beginning, your continued
journey in the kernel community will be much more successful later on.

Good luck.

Lukas

>
> On Sat, Jul 17, 2021 at 1:29 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> On Sat, Jul 17, 2021 at 1:09 PM Ashutosh Sharma
>> <b18010@students.iitmandi.ac.in> wrote:
>> >
>> > Hello Dwaipayan,
>> > I am writing this email to you regarding the Linux Kernel: Checkpatch Documentation project. I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>> > I have been a SDE intern at Amazon where I have worked on AWS, React and Java, Other than that I have also worked as a student developer in GSoC 2020 under The Mifos Initiative organisation. Currently, I am looking for opportunities to learn and grow my skill set. I am really excited about the project.
>> > Hoping for a positive response.
>> > Thank you
>> > Ashutosh Sharma
>>
>> Dear Ashutosh,
>> Thanks for your interest in working with the checkpatch documentation.
>>
>> The zeroth task is to learn suitable netiquette for the communication with
>> the kernel community. Below are some basic rules and pointers for this
>> mentorship. More information on kernel netiquette is also at
>> https://people.kernel.org/tglx/notes-about-netiquette.
>>
>> First, please do not top-post.
>>
>>     A: Because we read from top to bottom, left to right.
>>     Q: Why should I start my reply below the quoted text?
>>
>>     A: Because it messes up the order in which people normally read text.
>>     Q: Why is top-posting such a bad thing?
>>
>>     A: The lost context.
>>     Q: What makes top-posted replies harder to read than bottom-posted?
>>
>>     A: Yes.
>>     Q: Should I trim down the quoted part of an email to which I'm replying?
>>
>> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
>>
>> Third, set up your email client according to the kernel community
>> rules. Here is some information to that:
>>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
>> https://www.kernel.org/doc/html/latest/process/email-clients.html
>>
>> Generally more information on submitting patches and responding on
>> replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>>
>> Once the zeroth task is understood, you can now move on to the first
>> task: Running checkpatch on a specific file.
>>
>> Get a clone of the Linux kernel repository.
>> The script checkpatch.pl is under the scripts directory.
>>
>> Then, the first task is to run checkpatch.pl on a few files below
>> andshare the results:
>>
>> drivers/scsi/bfa/bfad_bsg.c
>> drivers/soc/fsl/dpio/dpio-service.c
>>
>> Which information on these rules that checkpatch warns about
>> is available in the Checkpatch Documentation?
>>
>> If documentation of these rules is available, explain your
>> understanding of the rules in your own words.
>> If no information is available in the documentation,
>> explain your understanding of the rule.
>>
>> In any case, explain the violation that is checked and raised in the
>> checkpatch script, i.e., what is implemented in checkpatch to check
>> the rule and possible violations. Which code in the checkpatch script
>> is raising the warning? What does it check and how is that
>> implemented?
>>
>> Explain how to possibly fix this code with regards to that violation.
>>
>> Once you succeed on this first task, we inform you about the further
>> second and third task. If you fail on any of those tasks, you are out
>> of the selection process.
>>
>> The selection of the mentee will happen according to schedule,
>> at earliest on August 12th and at latest at the end of August.
>> More information is available at
>> https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.
>>
>> Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

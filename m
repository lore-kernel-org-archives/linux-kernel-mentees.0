Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBFCC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1426113A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1426113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F74A60731;
	Tue, 20 Jul 2021 05:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CC_YIk38V_L; Tue, 20 Jul 2021 05:58:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 20E7C6068A;
	Tue, 20 Jul 2021 05:58:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF30EC0010;
	Tue, 20 Jul 2021 05:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2AA0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75A7B401E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJv8A0iovtSd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 161F8401D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:58:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f30so27515664lfv.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISTxmukspj39xyhrfDUlotonK/HDAxjjxWBHGViSBiY=;
 b=vEf6H7GY22fo2V+pDbkxyOzec6mqd/WPk2s9tYKlN+NUK9WuXDkfnSc7zE9XcGDVdQ
 6r4yp1hsCqyzNVyid/xHCTAM//WdUJieuiFBX/EmPaI0dj4DusQoZrb++zNzivrP/2f4
 PezeBVV+ZqlKCiykrMeXXMoe4rNkEISunPRBPHVJdgUD7O0QsawVld7wngh16Iji5Umk
 eEnM+lR7V8qZ2x9pt0RgZd8KcwtTql8nPP7S1CE8YTdHy5mr7F199IIchvpzqdEIOPwt
 oKSlVpZohe5wU5mGDv9sPdPAk5TySUUnuTtL5Kb2YkvseAp3s+/NZf7bDXYqX0ZMYJ/3
 Aa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISTxmukspj39xyhrfDUlotonK/HDAxjjxWBHGViSBiY=;
 b=GMy85eHa+ngDr0QABkfYzYgj2BCDupNGDwpduulQidhmdko0SvRXSQuRdubtuvfR5R
 4EBH/5Y2GGcO7kxTNd5do/LG/JzqiK+aGF9yDVaWU63wdyxXIFpsky6BqhDWnNwwwE7X
 i/ozDPZg1/JPcvkWfVFtfBlNdpkaHB094WX33SFhRSLamncm6JKycE6VuHxF7ibO9DXz
 WjOuUG0s6ybDTMkdZpJMJ3crIKnfsmwgoKCVEF5iIpaE/dNjNARlD06ZJPtSWUTQAPHM
 VG6XJtcvKc17ohfHSgV4ghpJJHZMAQ3dx3vMiDt9c66nHdfZbbqxaLeiUHaID4GkIOsv
 Kx9Q==
X-Gm-Message-State: AOAM532v/6q9AiCFbQiWF+ZP0ISLlwMeEYDijzsxkKm6t9EbKYRcZCdS
 StUQ0ln/zhCmDYh4cSIgLdBtF2iuLHABWVJzwKA=
X-Google-Smtp-Source: ABdhPJwCMMbuMeabZxkKTOAhua4W1sJDP5snQPQpUvMKiN5szfXuwabF0Y1Z9c9aHIgkLFVwUlp5Kw0QikswsqzzqiU=
X-Received: by 2002:ac2:4206:: with SMTP id y6mr20299559lfh.206.1626760730991; 
 Mon, 19 Jul 2021 22:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR07MB54564D3A83E09F186DB1D3B3D5E29@SN6PR07MB5456.namprd07.prod.outlook.com>
In-Reply-To: <SN6PR07MB54564D3A83E09F186DB1D3B3D5E29@SN6PR07MB5456.namprd07.prod.outlook.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 20 Jul 2021 11:28:37 +0530
Message-ID: <CABJPP5Cotm117-E-PGKSBiXht2Hn8cmhvnznWEvA8Q26Ke_Prg@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation
To: Ameya Deshpande <ameyanrd@outlook.com>
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Tue, Jul 20, 2021 at 11:07 AM Ameya Deshpande <ameyanrd@outlook.com> wrote:
>
> Hi,
>
> Greeting!
>
> My name is Ameya Deshpande, CSE undergraduate at NITK Surathkal.
> I am an open-source enthusiast and have experience contributing to
> open-source organizations like Wireshark and ns-3.
>
> I have some experience working with Linux Kernel development (IPv6
> networking), and always excited to learn more.
>
> I am interested in the Checkpatch Documentation mentorship program
> and I would like to work on the tasks for the mentee selection.
>
> Thanks,
> Ameya Deshpande

Thanks for your interest in working with the checkpatch documentation.

The zeroth task is to learn suitable netiquette for the communication with
the kernel community. Below are some basic rules and pointers for this
mentorship. More information on kernel netiquette is also at
https://people.kernel.org/tglx/notes-about-netiquette.

First, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm replying?

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

Third, set up your email client according to the kernel community
rules. Here is some information to that:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/email-clients.html

Generally more information on submitting patches and responding on
replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Once the zeroth task is understood, you can now move on to the first
task: Running checkpatch on a specific file.

Get a clone of the Linux kernel repository.
The script checkpatch.pl is under the scripts directory.

Then, the first task is to run checkpatch.pl on a few files below
andshare the results:

drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
drivers/infiniband/hw/qib/qib_sysfs.c

Which information on these rules that checkpatch warns about
is available in the Checkpatch Documentation?

If documentation of these rules is available, explain your
understanding of the rules in your own words.
If no information is available in the documentation,
explain your understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check
the rule and possible violations. Which code in the checkpatch script
is raising the warning? What does it check and how is that
implemented?

Explain how to possibly fix this code with regards to that violation.

Once you succeed on this first task, we inform you about the further
second and third task. If you fail on any of those tasks, you are out
of the selection process.

The selection of the mentee will happen according to schedule,
at earliest on August 12th and at latest at the end of August.
More information is available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.

Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

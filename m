Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BADC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 11:11:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B46206B6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 11:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArFaKz/B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15B46206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88EBB86FDF;
	Tue, 10 Nov 2020 11:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XFOElDg0Qmt; Tue, 10 Nov 2020 11:11:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E0D3586FAF;
	Tue, 10 Nov 2020 11:11:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE947C088B;
	Tue, 10 Nov 2020 11:11:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D72CBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B982986FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFOBCF5yYtft
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:11:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 07DFF86FAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:11:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m13so1703565pgl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 03:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iUPHg4zcpUK0Xa4+RM4YXMz9RrXvvxvzRzCUHjyVzpQ=;
 b=ArFaKz/BrOFENgrR7tcKKkB/nAMVzJnLuu1UUOnbnIsKgO+9t0bjk5M4dm23yGM9Mk
 5S6+SQeHe0pNC2Deg6GYryMlHi1DSnjZTgtdtPvgVB1XTEH0FUTtmxIu9996h+dDb5L0
 qhGTDIUSMYLLlrzYlhFoD5BX+hnk8xZPPEJdqHfd9hPNKggdMuW2UkYzYRSTPIex8g8G
 XVAptS97B3YqoUS103l01Hp/35VmVBRKGdXFJDL8mtvFNUw/jmP3pA9v2IEEOaXubcBa
 1R5T0+eyjjM9jw7PreWyXXOYbhsnLz9b2IRpkW8UjEJBDvSRzJT6r4muj53whgBYan6y
 mbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iUPHg4zcpUK0Xa4+RM4YXMz9RrXvvxvzRzCUHjyVzpQ=;
 b=kKvd2D/FiGD2SU4MWGlzA7Dvk4J+MbN3GqszqogMUcssJm3Z9Q+6fusQRhbfXAMitf
 3K3vUIwsjYRrx/ho+/rZkpfOB+ZEIz5j9bSHdoGWVPIVknclL7rFqcZYmcwknVaW/o1W
 6Dv45id9nqwrAxNPK1puZwZWsnui+hWDUdM5yvHGbNR5RepyY2Gr3SVxC1Ue1RjgLkMI
 vAkEcaeVsJZVe4/Rzxu9UZD7HC9f7wMyb2hhKc4xl2RsVseQWw99M6pF6G4+wPbcRxKa
 0MmnDAbUck4wzA3xVNyCIexKcCvO6TTzg8bYVm+mcAnlIuVbLB6U4dItDfpJmR2ZAfwx
 0k8A==
X-Gm-Message-State: AOAM5332O7Vc4hI97vGuNSVI01kG3CnvDgjNvdU5UiA1tsVscMsqqcPl
 B087rCqI6KBp1VEhqjBhnI0+tCgQzj3Jjg==
X-Google-Smtp-Source: ABdhPJyUDFxYmpKrIIMG8eaiqCXr1UqwNN8QG5SSMTc6pHgaDwrIz+qFpdVyXDZVzovhXFefJ1tDyQ==
X-Received: by 2002:a17:90b:994:: with SMTP id
 bl20mr4590411pjb.34.1605006669221; 
 Tue, 10 Nov 2020 03:11:09 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id t74sm13999217pfc.47.2020.11.10.03.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 03:11:08 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201110100554.15995-1-yashsri421@gmail.com>
 <CAKXUXMy2RG3UP_PEzH+KHhZNv7ehSgR9+oz_5mrQUyNO89HkHA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c4be24c1-6fa7-232c-df25-04de47eac72c@gmail.com>
Date: Tue, 10 Nov 2020 16:41:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMy2RG3UP_PEzH+KHhZNv7ehSgR9+oz_5mrQUyNO89HkHA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On 10/11/20 4:01 pm, Lukas Bulwahn wrote:
> On Tue, Nov 10, 2020 at 11:06 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>> for the patch.
>>
>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>> Completely remove --version flag") reports this error:
>>
>> ERROR: Missing Signed-off-by: line(s)
>>
>> Provide a fix by adding a Signed-off-by line corresponding to the author
>> of the patch before the patch separator line. Also avoid this error for
>> the commits where some typo is present in the sign off.
>>
>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
>> for quirk") we get missing sign off as well as bad sign off for:
>>
>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>>
>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
>> signature and avoid MISSING_SIGN_OFF
>>
>> A quick evaluation over v4.13..v5.8 found out that 4 out of 11 cases
>> for this error is because of missing sign offs in reverts. Add
>> documentation regarding it for the future users.
>>
>> Suggested-by: Joe Perches <joe@perches.com>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> 
> Split this patch into two patches. One for documentation and one for
> the checkpatch.pl change.
> 
> The documentation patch needs its own commit message to explain why we
> think this should be pointed out.
> 
Okay

>> ---
>>  Documentation/process/submitting-patches.rst |  2 ++
>>  scripts/checkpatch.pl                        | 17 ++++++++++++++---
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index 83d9a82055a7..ff065e1f6a25 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -404,6 +404,8 @@ then you just add a line saying::
>>
>>  using your real name (sorry, no pseudonyms or anonymous contributions.)
>>  This will be done for you automatically if you use ``git commit -s``.
>> +Also reverts should include a Signed-off-by. ``git revert -s`` does
>> +that for you.
>>
>>  Some people also put extra tags at the end.  They'll just be ignored for
>>  now, but you can do this to mark internal company procedures or just
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index cb46288127ac..849e4a510767 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2404,6 +2404,8 @@ sub process {
>>
>>         my $last_blank_line = 0;
>>         my $last_coalesced_string_linenr = -1;
>> +       my $patch_separator_linenr = 0;
>> +       my $is_signed_off = 0;
>>
>>         our @report = ();
>>         our $cnt_lines = 0;
>> @@ -2755,6 +2757,10 @@ sub process {
>>                 if ($line =~ /^---$/) {
>>                         $has_patch_separator = 1;
>>                         $in_commit_log = 0;
>> +                       # to add missing sign off line before diff(s)
>> +                       if($patch_separator_linenr == 0) {
>> +                               $patch_separator_linenr = $fixlinenr;
>> +                       }
> 
> Why do you use fixlinenr here? How is that different from linenr?
> 
I used $fixlinenr here as we need to later use it for
fix_insert_line(), where we are passing fixlinenrs' always. So, to
keep it consistent, I used $fixlinenr
Should I use $linenr instead? I think they differ by 1

>>                 }
>>
>>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
>> @@ -2771,6 +2777,8 @@ sub process {
>>                         my $space_after = $3;
>>                         my $email = $4;
>>                         my $ucfirst_sign_off = ucfirst(lc($sign_off));
>> +                       # to avoid missing_sign_off error as it most probably is a typo
>> +                       $is_signed_off = 1;
> 
> Probably is_signed_off is the wrong name here.
> 
> Other than that, this change looks good.
>
Okay

> Check if the patch applies on top of Dwaipayan's latest patches he sent.
> 
Yes, I have made the changes after applying this patch:
https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/

>>
>>                         if ($sign_off !~ /$signature_tags/) {
>>                                 WARN("BAD_SIGN_OFF",
>> @@ -7118,9 +7126,12 @@ sub process {
>>                       "Does not appear to be a unified-diff format patch\n");
>>         }
>>         if ($is_patch && $has_commit_log && $chk_signoff) {
>> -               if ($signoff == 0) {
>> -                       ERROR("MISSING_SIGN_OFF",
>> -                             "Missing Signed-off-by: line(s)\n");
>> +               if ($signoff == 0 && !$is_signed_off) {
>> +                       if (ERROR("MISSING_SIGN_OFF",
>> +                                 "Missing Signed-off-by: line(s)\n") &&
>> +                           $fix) {
>> +                               fix_insert_line($patch_separator_linenr, "Signed-off-by: $author");
>> +                       }
>>                 } elsif ($authorsignoff != 1) {
>>                         # authorsignoff values:
>>                         # 0 -> missing sign off
>> --
>> 2.17.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

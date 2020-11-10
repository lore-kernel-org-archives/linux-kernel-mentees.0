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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95F9C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:59:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DF6220780
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRWqy3kn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DF6220780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4CAB87245;
	Tue, 10 Nov 2020 18:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKuZ75cVk2Pt; Tue, 10 Nov 2020 18:59:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0769687024;
	Tue, 10 Nov 2020 18:59:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0ACEC0889;
	Tue, 10 Nov 2020 18:59:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA28C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8C94D864E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sg5H6qRCd0lK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:59:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DD9E4853D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:59:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x13so12257444pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xtYUbXwk/IU4ZRt93jtmQsmaT9U+ov4uuUloe8+7I4c=;
 b=MRWqy3knY9+XzlonP+Ja7nRGZgO20lg3aiL+DalEhF/jc1uiwwD5QVpMhTA540lOA0
 KZtdA0xvsuKVZVefoK0WPooaLODtMAUpGymfyUm+vAmmW8/4Y37/coEfVofqGRMh9m+3
 S997a5sEt16K3xHg/O9vnm0ViikFMOIqPaciMc5XhuN9USadTtZ8OFJVSZQNO/cwKGFk
 Z4KU257Bi3dZe3hLiqWD31a61ohHGyEs57z2fJ2ULRzNCWQdZ3cYxCGQY7Lx2xpt0fX/
 HDcXPHO9PFoBuPayoY4fkKcQKbSSVi4nQgj8yw0245nhGQHBvDN9wtwBMEczjWzkBT7T
 vLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xtYUbXwk/IU4ZRt93jtmQsmaT9U+ov4uuUloe8+7I4c=;
 b=mvpi/vRPMEfV9eowBGhbrlK2aLtfRVPCYWhmtelNaoNKR9oTPS7XgvxWm/8GFamQFc
 6m7iEJL3OMu5h4KS7Xdi9evbPHdZmljnl+8AekZrNT9nDOOar0ueRLnlhto18/X5BOJj
 P1Ydy3pqEK7XwkVMFm0UqYN1d9WitKnaeRcpg2JhIBAQyIvUNUE7FTgTsN0EeLGwA08x
 vg2dy2kWGo7BySPBMyv6yiwRtGp5CA6SL7YiNwS9gYIhMgF0PwJVO0EPVSTJD/R1BTjL
 bOd6pXTLFFYgwlnMeSloEwOxGkqvr+2mqQ9BZrCdEZGtxl+vAkMBNUlnqCn5KwdKqBtv
 u4eQ==
X-Gm-Message-State: AOAM532TiKSwvM511vU43raBu+1qohfoHns2962cVg39P3yvz4S6ZKUW
 zcaHgsyqy8bVTlIhcZ5DE1ZJcM9BwEKmBafy
X-Google-Smtp-Source: ABdhPJz5lO3ToRfuEqbQRvQ19/83DLMCcxOLj3PqrmC9cnSIYHUMGTotnGQceAsBxssKIbG1aqD3kQ==
X-Received: by 2002:a63:450a:: with SMTP id s10mr18346517pga.275.1605034766070; 
 Tue, 10 Nov 2020 10:59:26 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id c127sm14979971pfc.115.2020.11.10.10.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 10:59:25 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201110130602.22359-1-yashsri421@gmail.com>
 <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
 <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
 <CAKXUXMzdMuXaY02Lz2fvMyGBB+5vNxtT4XJemEGaZdYcXzrR0g@mail.gmail.com>
 <d0a69d66-83e0-092e-af7b-dc63e04b0a9a@gmail.com>
 <CAKXUXMyNTXJ6u0SQfBEBoT5ifDZ9gu4bRLZS2vZDvszvr6XjXA@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <7dcfdb0b-3433-26bb-49ea-ee805e46abb7@gmail.com>
Date: Wed, 11 Nov 2020 00:29:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyNTXJ6u0SQfBEBoT5ifDZ9gu4bRLZS2vZDvszvr6XjXA@mail.gmail.com>
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

On 11/11/20 12:13 am, Lukas Bulwahn wrote:
> On Di., 10. Nov. 2020 at 19:13, Aditya <yashsri421@gmail.com> wrote:
> 
>> On 10/11/20 8:52 pm, Lukas Bulwahn wrote:
>>> On Tue, Nov 10, 2020 at 4:13 PM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> On 10/11/20 7:30 pm, Lukas Bulwahn wrote:
>>>>> On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <
>> yashsri421@gmail.com> wrote:
>>>>>>
>>>>>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>>>>>> for the patch.
>>>>>>
>>>>>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>>>>>> Completely remove --version flag") reports this error:
>>>>>>
>>>>>> ERROR: Missing Signed-off-by: line(s)
>>>>>>
>>>>>> Provide a fix by adding a Signed-off-by line corresponding to the
>> author
>>>>>> of the patch before the patch separator line. Also avoid this error
>> for
>>>>>> the commits where some typo is present in the sign off.
>>>>>>
>>>>>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
>>>>>> for quirk") we get missing sign off as well as bad sign off for:
>>>>>>
>>>>>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>>>>>>
>>>>>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
>>>>>> signature and avoid MISSING_SIGN_OFF
>>>>>>
>>>>>> Suggested-by: Joe Perches <joe@perches.com>
>>>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>>>> ---
>>>>>> This patch was made after applying
>> https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
>>>>>> and my last changes at
>> https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
>>>>>>
>>>>>>  scripts/checkpatch.pl | 18 +++++++++++++++---
>>>>>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>>> index cb46288127ac..2deffd0c091b 100755
>>>>>> --- a/scripts/checkpatch.pl
>>>>>> +++ b/scripts/checkpatch.pl
>>>>>> @@ -2404,6 +2404,8 @@ sub process {
>>>>>>
>>>>>>         my $last_blank_line = 0;
>>>>>>         my $last_coalesced_string_linenr = -1;
>>>>>> +       my $patch_separator_linenr = 0;
>>>>>> +       my $non_standard_signature = 0;
>>>>>>
>>>>>>         our @report = ();
>>>>>>         our $cnt_lines = 0;
>>>>>> @@ -2755,6 +2757,10 @@ sub process {
>>>>>>                 if ($line =~ /^---$/) {
>>>>>>                         $has_patch_separator = 1;
>>>>>>                         $in_commit_log = 0;
>>>>>> +                       # to add missing sign off line before diff(s)
>>>>>> +                       if($patch_separator_linenr == 0) {
>>>>>> +                               $patch_separator_linenr = $linenr;
>>>>>
>>>>> Well are you sure linenr is correct? (As I wrote, I do not know, but
>>>>> you should know.)
>>>>>
>>>>> I think you would need to create a patch for testing your feature
>>>>> where multiple things are fixed within the same patch and then check
>>>>> if the fix is added at the right place.
>>>>>
>>>>
>>>> I checked the fix over following patch.
>>>>
>>>> I have modified the patch such that it has co-developed-by as the
>>>> author(nominal patch author warning, which requires this line to be
>>>> deleted)
>>>>
>>>> Also 'occuring', which is a typo(where the typo needs to be replaced)
>>>>
>>>> It works as expected.
>>>>
>>>
>>> Well to really check if it works as expected, you need to have a test
>>> patch where a fix adds multiple lines into the fixed patch before the
>>> line you try to record.
>>>
>>> Then, fixlinenr and linenr are probably more than just 1 line apart,
>>> but really multiple lines apart and only if you record the right
>>> variable it really works.
>>>
>>
>> Actually we currently don't have any new line insertion fixes for
>> lines above patch separator.
>> So, I modified checkpatch a bit to insert (instead of delete) for
>> co-developed-by.
>> ie here:
>>
>> if (WARN("BAD_SIGN_OFF",
>>          "Co-developed-by: should not be used to attribute nominal patch
>> author '$author'\n" . "$here\n" . $rawline) &&
>>     $fix) {
>> -       fix_delete_line($fixlinenr, $rawline);
>> +       fix_insert_line($fixlinenr, $rawline);
>> }
>>
>>
>> When repeated a few times and removing signed-off-by, this provided an
>> experience of inserting multiple lines before signed-off-by (as for
>> each co-developed-by, it is inserting a new co-developed-by)
>>
>> With this as well, the fix was working as expected, ie, got this after
>> some iterations of removing signed-off-by and keeping co-developed-by:
>>
>> ...
>> It is causing boot failures with qemu mac99 in at least some
>> configurations.occurring
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----
>>
>>
> 
> I did not look into the details. If you are 100% sure that your patch is
> right, let us send it to Joe and the mailing list.
> 
Yes, on the basis of observations, it seems to be working correctly.
Sending out the patch :)

> I think next a fix for bad sign-off that corrects those obvious typos would
> be nice as well.

Sure.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

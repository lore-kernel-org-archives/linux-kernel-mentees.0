Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45E9C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 09:39:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF6A21D40
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 09:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxONvACf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF6A21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53DF52E17A;
	Thu, 12 Nov 2020 09:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ehm+QhTZA1TG; Thu, 12 Nov 2020 09:39:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE16A20348;
	Thu, 12 Nov 2020 09:39:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B12DFC08A1;
	Thu, 12 Nov 2020 09:39:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6564DC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 09:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54B7986DEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 09:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MzZx287Ag8n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 09:39:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9E1F286DC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 09:39:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w6so4029873pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 01:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lrYKnzA4E4+TgmiM/co7B9eVeyrsRjRDAcm+Vziikgw=;
 b=RxONvACfhgRjkwJ38l9hpu2gI5EGWAC8MkKBVsPvRD0sMzuyCpcJJjANZbSC9/H2Yb
 0gJkvwFtu+nSRO/p6ujictMHHJoh+czaW66M+cVGs626i1o9BXG6mcIWk824nL6jLEQe
 UcdW2RyVw4QZ9NUohvxC1iWB6DpAuhfFfwvgouLjNHTOwOeFXnEHGirR+xFEXk7EaLIS
 +7BVMVNwXeistq+SE+LO5645OyxxLxr3APNsiHpD/36F1368jdJibDpCFnKQuEuz5OnW
 B/0TvXpMeCSt2RFEoUNDnEfP+EWtv9wHDnl4VjF6W4PWh1bGLMtVW0b3mqAQh9/tVbK1
 nACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lrYKnzA4E4+TgmiM/co7B9eVeyrsRjRDAcm+Vziikgw=;
 b=UafODuNc6enayhjJsYyKPuosRtIU7mxCYzyfhiG/cQ8/COJelDOl2xsx4R5ePA8Bkf
 Bg4oJGga4KuBWlr0oDECIaUR+gIImyvtGfh9+4PCQnhOEc+f1E3FaMkBUeE8zhrrtBA2
 tPuHgIhfKSh39E79if7+zGAjiirSQAYn80eq8sbEfK/DtwW0LvBofhLwI8XVk04FRqAl
 dbvBmwXttTobRubwlzd+npZEF8MKvHByjJkQ9EOxyNUAMtMA6i4ruTZ3+lysXKrjv9di
 Iwf+FM8vg45lE0UlNcP1i+Su4CFYA1RUrTRyorP3p6eZQsguiqN5jselPFAsw2TJFDH7
 wh0Q==
X-Gm-Message-State: AOAM531t58vd7tBJhqyUdvyAxyW1zMk7KLRj0cVdzM+PiWT5Hb/lZ42M
 x0cJpEX225ChxGfraUKruo90I5sftT3K3mB6
X-Google-Smtp-Source: ABdhPJyV53kSMoI/gHb1sDftIaYqOyQNMkEnKqCyMFICbve4lWdlKN3myDCF0OJ/gIxSpv10ba011w==
X-Received: by 2002:a63:1512:: with SMTP id v18mr25974010pgl.450.1605173984937; 
 Thu, 12 Nov 2020 01:39:44 -0800 (PST)
Received: from ?IPv6:2402:3a80:431:ca3d:d81d:4531:78f5:b367?
 ([2402:3a80:431:ca3d:d81d:4531:78f5:b367])
 by smtp.gmail.com with ESMTPSA id q16sm5554956pff.114.2020.11.12.01.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 01:39:44 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
 <CAKXUXMzLOZYsptUUVQK0CF-FGPhHfJJwEepvA-0eBrL45HhMcw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <262974f5-c839-d80c-a94b-dc8f8a93c82f@gmail.com>
Date: Thu, 12 Nov 2020 15:09:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzLOZYsptUUVQK0CF-FGPhHfJJwEepvA-0eBrL45HhMcw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On 12/11/20 1:24 am, Lukas Bulwahn wrote:
> On Wed, Nov 11, 2020 at 8:35 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 12/11/20 12:56 am, Lukas Bulwahn wrote:
>>> On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently checkpatch warns us for long lines in commits even for
>>>> signature tag lines.
>>>>
>>>> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
>>>> clear Mac Table Digest") reports this warning:
>>>>
>>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>>>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>>
>>>> This is an example of false positive. Provide a fix by excluding
>>>> signature tag lines from this class of warning.
>>>>
>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>> ---
>>>>  scripts/checkpatch.pl | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>> index ac7e5ac80b58..1d257b1f4a4f 100755
>>>> --- a/scripts/checkpatch.pl
>>>> +++ b/scripts/checkpatch.pl
>>>> @@ -2963,6 +2963,8 @@ sub process {
>>>>                                         # filename then :
>>>>                       $line =~ /^\s*(?:Fixes:|Link:)/i ||
>>>>                                         # A Fixes: or Link: line
>>>> +                     $line =~ /^\s*(?:$signature_tags)/ ||
>>>> +                                       # signature tag line
>>>
>>> Can you simply add this check to the expression above?
>>>
>> Yes, we can do it. But then the match will become case insensitive
>> (because of presence of '/i'). Should I do it irrespective?
>>
> 
> I see. Then keep it as is and start the evaluation.
> 

I evaluated this patch on v5.6..v5.8 and generated the list of dropped
warnings for commit_log_long_line here:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/dropped/summary.txt

The difference in frequency is 17 (ie from 1896 to 1879)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

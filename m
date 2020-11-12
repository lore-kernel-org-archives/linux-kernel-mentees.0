Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB80C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:40:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B342100A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 16:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKIl1KCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B342100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6F5387773;
	Thu, 12 Nov 2020 16:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CVKm86szENU; Thu, 12 Nov 2020 16:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EAB68773C;
	Thu, 12 Nov 2020 16:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41D67C0889;
	Thu, 12 Nov 2020 16:40:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA70BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C70D86FB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9qmrKMo2-qD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 13A4786B26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 16:40:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s2so3061770plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LuNeJxcOfDgTn+aphtEe5cqYWC9E4vjwDsq4stJqbTQ=;
 b=SKIl1KCq+0Wnsjx5zG3mv+mkUIV/CodRC6e5klRJG8XzAJdIag9zkFHxuvOEvbz2a/
 Dze0oHaHcs91qM0mBNydNTaZyUO9XrfB2mCIn/i185eMQT2FY1EDlZu/whBafkK3Itzi
 53M0+bwjwtJz4zAwG7WuSt03x/FQ3PIOxqTGDJp6VjynwVko2sIzkQ9q71vNhIlz8j/z
 BjpLy8cxx56LSVpfGWGTUJOvs0wzAGJZ+nBP37USz3s5rWdWQJOSt6sELLtq08NDXonw
 kqQfcL37jMMCYpAfREp/KARbanwh2b0LHuE/WAEBh6jqNhqg/CO62vSsEDmgvXuWcCYv
 uJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LuNeJxcOfDgTn+aphtEe5cqYWC9E4vjwDsq4stJqbTQ=;
 b=QVErF8W+yQ/kijZqtAeA3IxEDe/GvUmWHoz+ViqIZK9JNOAcJSE/wjCt0CATpUeNfK
 j3/z94+69RO7HeNRQ/sSb8j1x0FTbj2AYErNMulQAfRtTJMwQJEABn9YQK3fi2wvdgeL
 CeLoMUIW7a0VZ94oJW9Nff6RySqIX3drlD4bHUYiQjOvh+mEVYNjDqrsOH+/WHbcOmpG
 DUv20T6X7MRUXaMnnB+KOn8tija9JpJui+PFD2nrCLhTTMCp2KRe+Q19YlAPFLVJOoId
 eoerolxDUQzmEeWuorcgVNtNSZ9dpxtmg9kXhlCScSe48HFHrvsjv7bx/0s6uJUv8lMy
 Srxw==
X-Gm-Message-State: AOAM531PPW4bZpU4TxbfcBhO65C27kG9jC6jAl/muqC47xnSM6UkLCM1
 s1nANSE/HsPJOZtgyr+D730=
X-Google-Smtp-Source: ABdhPJzfBdbtXyRiYxqJNl4I2yhpH5DM5LH+K9NX976lQP/+nykIN26Aq2j4XlAixjj2EqwBTbulmg==
X-Received: by 2002:a17:902:56d:b029:d7:c927:2e51 with SMTP id
 100-20020a170902056db02900d7c9272e51mr199819plf.27.1605199225520; 
 Thu, 12 Nov 2020 08:40:25 -0800 (PST)
Received: from ?IPv6:2405:201:9004:608a:cb83:706a:a1b3:fbe7?
 ([2405:201:9004:608a:cb83:706a:a1b3:fbe7])
 by smtp.gmail.com with ESMTPSA id d11sm7544235pfq.99.2020.11.12.08.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 08:40:24 -0800 (PST)
To: Aditya <yashsri421@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <155d1824-799f-8994-ec03-a1207928e8c7@gmail.com>
Date: Thu, 12 Nov 2020 22:10:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
Content-Language: en-US
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 12/11/20 1:05 am, Aditya wrote:
> On 12/11/20 12:56 am, Lukas Bulwahn wrote:
>> On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>> Currently checkpatch warns us for long lines in commits even for
>>> signature tag lines.
>>>
>>> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
>>> clear Mac Table Digest") reports this warning:
>>>
>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>
>>> This is an example of false positive. Provide a fix by excluding
>>> signature tag lines from this class of warning.
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>   scripts/checkpatch.pl | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index ac7e5ac80b58..1d257b1f4a4f 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2963,6 +2963,8 @@ sub process {
>>>                                          # filename then :
>>>                        $line =~ /^\s*(?:Fixes:|Link:)/i ||
>>>                                          # A Fixes: or Link: line
>>> +                     $line =~ /^\s*(?:$signature_tags)/ ||
>>> +                                       # signature tag line
>> Can you simply add this check to the expression above?
>>
> Yes, we can do it. But then the match will become case insensitive
> (because of presence of '/i'). Should I do it irrespective?
>
> Thanks
> Aditya
>
I think the check might be better as case insensitive because:

$ git log --format=email -100000 | grep "^CC:" | wc -l
773

$ git log --format=email -100000 | grep "^Cc:" | wc -l
59475

$ git log --format=email -100000 | grep "^cc:" | wc -l
95

All three cases were used for Cc: ...

Thanks,
Dwaipayan.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

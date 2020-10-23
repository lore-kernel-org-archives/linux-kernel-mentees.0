Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4412AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 06:33:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6CF2192A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 06:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tW+DxZVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6CF2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 50B3820439;
	Fri, 23 Oct 2020 06:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYMWvxeAcTTn; Fri, 23 Oct 2020 06:33:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 254302037B;
	Fri, 23 Oct 2020 06:33:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0998FC0052;
	Fri, 23 Oct 2020 06:33:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6125EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4B25186F57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2HJBihSwJfI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:33:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1303E86F4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:33:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h6so438844pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 23:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uuo4nUiVLSySBOciEaIBUaKDItknrQkVKbQWMateKYs=;
 b=tW+DxZVfWESe5cJt98r3MECDjupJoUYGOLIHdFBMXrhowzHuDMEFxdHv0+MD773W4n
 au4N9iP24CUAj0tS0Ft45RunDbvu4oT9Hknr6zA0YBS+AlM2urBKaaQhSpaj014o0AWu
 f0JPAwSUjbGOZaQ9PYSOw7NZiFGqMi6BVy4W4bFwtsferMXhvBG+1BTkH0oPqam3pH+3
 nrhitWxT/hXnrX5NZEHYCaCoOc7b3hpX/uvDf3hJGfkfzRjsExVFI5WhPewT8w/Qy8xv
 oFhvPskhrMKrs60uTSHUUjhEgCEHzncS3WyuEARUjWRkJRlVTprZFI4LiZUYtre+CZsg
 a1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uuo4nUiVLSySBOciEaIBUaKDItknrQkVKbQWMateKYs=;
 b=GmJdJQ5ItkmpSLt6PfbwjezYfV8cWxp9rqRcD0W7iGeBPvwYt45px3gaMFzGWjWLvA
 Z/2UCQzvMy0PU9jjNVobP2ItrC9dYZpE8RWr24MfE4XqWnLpPZ6pAQmbxMLMSi4BMM0N
 jnDyCkJ2Rp106jUYHuegoeQkj6RC2U+gmKwzE2eNi877qlHQaMqCSdEJymJUiwbVyaOc
 TSL+kcCSDVG0T7dcoM7iRHL5HUShExZo2kfZmJ/PbIv7W/2HQbdaIHzmVXHfH1L0EDQp
 N71wRKeDvcxaSIsaSrNkl15jhxaVQ0Zy0aA3isJm/OIIOc6oeE+GstpjxOHnXMf5vWvS
 RaVQ==
X-Gm-Message-State: AOAM533s9/AfvKz3xDHHVzLddra9Q0RV48oV6L49AATAr4XJpOmcCW82
 NQdm7Vgz65JXsul1ca1i+1o=
X-Google-Smtp-Source: ABdhPJw2EmJlWlFn0DsQOlmkTgPZm4Pz6jzuwE/1ig6MIGiNFiXeW37qUO5GA2h27YyfNPeXC5OerQ==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr926904pgl.305.1603434807452; 
 Thu, 22 Oct 2020 23:33:27 -0700 (PDT)
Received: from ?IPv6:2402:3a80:429:6ba7:30ef:4722:a786:585f?
 ([2402:3a80:429:6ba7:30ef:4722:a786:585f])
 by smtp.gmail.com with ESMTPSA id g1sm825991pjj.3.2020.10.22.23.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 23:33:26 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
 <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
 <5121bf7c-a126-6178-62ff-e54f0bb4cb6e@gmail.com>
 <67247b2d51aa8b2da7377e400e9191733144ed0f.camel@perches.com>
 <edaa9012-d512-26fc-0aca-f0eaf889a050@gmail.com>
 <b853a8ab4daface74075e93d83f94655f13a2979.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <8845d575-596e-b2e0-26c1-16e704074fc8@gmail.com>
Date: Fri, 23 Oct 2020 12:03:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b853a8ab4daface74075e93d83f94655f13a2979.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 23/10/20 4:16 am, Joe Perches wrote:
> On Fri, 2020-10-23 at 02:35 +0530, Aditya wrote:
>> On 23/10/20 1:03 am, Joe Perches wrote:
>>> On Fri, 2020-10-23 at 00:44 +0530, Aditya wrote:
>>>> On 22/10/20 9:40 pm, Joe Perches wrote:
>>>>> On Thu, 2020-10-22 at 20:20 +0530, Aditya Srivastava wrote:
>>>>>> Presence of hexadecimal address or symbol results in false warning
>>>>>> message by checkpatch.pl.
>>>>> []
>>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>> []
>>>>>> @@ -3051,7 +3051,10 @@ sub process {
>>>>>>  		}
>>>>>>  
>>>>>>  # check for repeated words separated by a single space
>>>>>> -		if ($rawline =~ /^\+/ || $in_commit_log) {
>>>>>> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
>>>>>> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
>>>>>> +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
>>>>>
>>>>> Alignment and use \b before and after the regex please.
>>>>
>>>> If we use \b either before or after or both it does not match patterns
>>>> such as:
>>>> +   -rw-r--r--. 1 root root 112K Mar 20 12:16'
>>> selinux-policy-3.14.4-48.fc31.noarch.rpm
>>>
>>> OK, thanks, it's good you checked.
>>>
>>>>> []
>>>>> What does all this code actually avoid?
>>>>
>>>> Sir, there are multiple variations of hex for which this warning is
>>>> occurring, for eg:
>>>> 1) 00 c0 06 16 00 00 ff ff 00 93 1c 18 00 00 ff ff  ................
>>>> 2) ffffffff ffffffff 00000000 c070058c
>>>> 3)     f5a:       48 c7 44 24 78 ff ff    movq
>>>> $0xffffffffffffffff,0x78(%rsp)
>>>> 4) +    fe fe
>>>> 5) +    fe fe   - ? end marker ?
>>>> 6) Code: ff ff 48 (...)
>>>
>>> So why not just match first with /^[0-9a-f]+$/i ?
>>>
>>> Doesn't that match all the cases listed above?
>>>
>>>
>>
>> Then, we'll not be able to account for cases such as:
>>
>> 1) +     * sets this to -1, the slack value will be calculated to be be
>> halfway [For 'be' 'be']
>> 2) + * @seg: index of packet segment whose raw fields are to be be
>> extracted [For 'be' 'be']
>> 3) Let's also add add a note about using only the l3 access without l4
>> [For 'add' 'add']
> 
> Like the use of long, I think you're better off with
> either a list or hash of specific words to ignore.
> 
> 
> 

Ok Sir. Actually, I was proceeding with this approach initially. But
it has some side affects like it won't be able to detect hex such as:

'ff 4d be be be 9f 04 48'

Here although 'be' is part of hex sequence, it will be reported in the
warning.
However, though such cases haven't occurred over v6..v8.

Actually, we could simplify it more on the basis of occurrences in
v6..v8, for eg. if we check for /[0-9c-f][0-9a-f]+/ (instead of
/[0-9a-f]{2,}/), it gives us desired result over v6..v8, but again
we'll miss out cases such as:

'ff af af bc bc ba ba bd bd'

To counter all these, I had implemented the solution in the proposed
way. But, I'll change it as you suggested. The advantage of it can be
that the code complexity is less and the negatives will be few.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

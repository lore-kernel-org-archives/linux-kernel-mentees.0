Return-Path: <SRS0=PhKz=FQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122C9C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 11:27:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FDA22BE8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 11:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FDA22BE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17F0C870A9;
	Sat, 12 Dec 2020 11:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zLOS9FhN1y9; Sat, 12 Dec 2020 11:27:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 895CE86E15;
	Sat, 12 Dec 2020 11:27:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D81EC0FA7;
	Sat, 12 Dec 2020 11:27:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9CA0C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 11:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B03C7870A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 11:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oo6v+BWht4+l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 11:27:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 21E8786E15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 11:27:03 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p4so8804010pfg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=92WBZUDtr+B5ADhkAuLWfGIH7ZZTnhpWICUTAv2ZIrY=;
 b=vY9AOee0+5Dc7dW/WDvEuB/D79BTXDyzh9dp2x9QANMgwDVm95dafYnizqonhG8KO3
 A+B0yJjcWkDHo7mlPvXoQFZi9MKa1p0jCA2i9HCuN52uOLbQmPaz2hZs1biD4JVa0+kK
 C0wjR0O38C/TNsGgrjMvllkqoK0zmYBIXbbLk7M5fT0F16eKpR9UHrp7IjwOXMkXzaJ+
 Xb0jR2NcXjN3fBQCkVIsRE3hKuphhpusI7PH1Ypu3OfmxLQga1d54tb9a+dNpty8U0PT
 0YTHA8sjM1/o2L9mmEgfGrM+k89W/OdAn0YaZEI9FFXHeD0tjh0USOTfDP66Mqkc7hAA
 Ze+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=92WBZUDtr+B5ADhkAuLWfGIH7ZZTnhpWICUTAv2ZIrY=;
 b=eLetbK0pkjRpFHRyotE5dhS2k7KK9+HXzrhEvfF9B2aKgpj+7bZ/w10+bH9Drk+gh7
 slqv/adyB2FEIGy9coRDfKYCAC9r7lfrktjVZEiru9xmIbcN2SMm0Fuaue/Xm4s3CbM6
 mQB0gpZa3/2/HRZCW7OzGf4tdCX6F7Px/6asBuvoqN7V4DF35wRqpm6a2ibw6ttRH65Q
 4TioaW7QX17+LnUuxYyIVmvFG+RUUWdieNcnTKWAGu5Jfeqrp01ZN88b2zmmWnt57JXV
 lgbkt5zqzITUT6ZHqn9clthOi1hIpz6+K5s5VHYQHXMuhtKOz0wzeW2qJk3dymzFqOR/
 s2lg==
X-Gm-Message-State: AOAM532IZzWZK+z/R8l+3wNHSjnsyVjHNx+IKmcsSO/27576Ya7M2skv
 6Ebm9rPul9GgvKD92NVznq/M5ByplH3xcQ==
X-Google-Smtp-Source: ABdhPJxHWGiVa1uVfO+279CJDjBFQm1qnpCox3BT6s97XfP5jfq9eFqHyf2rc8n/JR9LyDNxI56S+g==
X-Received: by 2002:a63:2017:: with SMTP id g23mr14194077pgg.63.1607772422344; 
 Sat, 12 Dec 2020 03:27:02 -0800 (PST)
Received: from ?IPv6:2402:3a80:406:cce5:4c09:a3c0:cad9:9548?
 ([2402:3a80:406:cce5:4c09:a3c0:cad9:9548])
 by smtp.gmail.com with ESMTPSA id q35sm14061176pjh.38.2020.12.12.03.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Dec 2020 03:27:01 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201207124302.17128-1-yashsri421@gmail.com>
 <CAKXUXMxyP9ZhqGihktJcL1rpdbHZW7xCrK3-WmLV=k4gFMo3tQ@mail.gmail.com>
 <fbb2d894-6431-64ce-e952-11a6f5c83c63@gmail.com>
Message-ID: <8f21588b-c6b2-5ae8-fed0-c800202215d8@gmail.com>
Date: Sat, 12 Dec 2020 16:56:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fbb2d894-6431-64ce-e952-11a6f5c83c63@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	CONSIDER_KSTRTO
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

On 7/12/20 8:28 pm, Aditya wrote:
> On 7/12/20 6:24 pm, Lukas Bulwahn wrote:
>> On Mon, Dec 7, 2020 at 1:43 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>
>>> Checkpatch recommends the usage of kstrto* over simple_strto* and
>>> strict_strto*, as these are obsolete.
>>>
>>> E.g., running checkpatch on commit f79b3f338564 ("ftrace: Allow
>>> enabling of filters via index of available_filter_functions") reports
>>> this warning:
>>>
>>> WARNING: simple_strtoul is obsolete, use kstrtoul instead
>>> +       long index = simple_strtoul(func_g->search, NULL, 0);
>>>
>>> Provide a fix by replacing simple_strto* and strict_strto* with kstrto*
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 7b086d1cd6c2..ca5bb5a3f8f6 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -6980,8 +6980,12 @@ sub process {
>>>
>>>  # recommend kstrto* over simple_strto* and strict_strto*
>>>                 if ($line =~ /\b((simple|strict)_(strto(l|ll|ul|ull)))\s*\(/) {
>>> -                       WARN("CONSIDER_KSTRTO",
>>> -                            "$1 is obsolete, use k$3 instead\n" . $herecurr);
>>> +                       if (WARN("CONSIDER_KSTRTO",
>>> +                                "$1 is obsolete, use k$3 instead\n" . $herecurr) &&
>>> +                           $fix) {
>>> +                               my $kstrto = "k$3";
>>> +                               $fixed[$fixlinenr] =~ s/$1/$kstrto/;
>>> +                       }
>>>                 }
>>>
>>
>> Does this only warn on added lines?
>> No, currently it does not seem to check for added lines. However, I
> don't think we need to check for added lines as we are just
> substituting in the line (ie no addition or removal)
> 
>> The fix looks good; I just do not know if the rule is applicable in
>> full generality.
>>
>> You might want to check a few instances if that rule actually makes
>> sense and is accepted.
>>
> I checked for the use of all three formats of function (ie
> simple_strto*, strict_strto* and kstrto*) for all the files.
> 
> The total count of usage of kstrto* is 2854, whereas
> for simple_strto* = 867
> strict_strto* = 7
> 
> This is the complete list of files with their count of occurrences:
> 
> For kstrto* =
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/kstrt.txt
> 
> For simple_strto* =
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/simple_strt.txt
> 
> For strict_strto* =
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/consider_kstrto/strict_strt.txt
> 
> What do you think?
> 

Hi Lukas

You probably missed this mail.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=IZhi=GT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A490C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 14:57:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBC622DBF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 14:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBC622DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5DD3C85FAE;
	Sat, 16 Jan 2021 14:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJxB5xRy9iRq; Sat, 16 Jan 2021 14:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB64185F78;
	Sat, 16 Jan 2021 14:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A136AC088B;
	Sat, 16 Jan 2021 14:57:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BAECC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 14:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8DF368723E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 14:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PA0AcD7JZIc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 14:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DA2687238
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 14:57:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x18so6215072pln.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LHcENUlrPzO5cgvg2F5FrCBor6VkXjuv0vQnM7pyk/M=;
 b=qOoePj2/SQBd4YyUc505LQYV4dvNaT4LnVTBYYKpvm9AfO/sxUmGBnMzQdg9BPv2rS
 ok/iYOmc1Ya6K7uJQ0bKXsmZoTIieIp3C8sUglnQf0HupP51CjXF+G1tCmvOaV9VxnCO
 uqz/QOE0pko3JDkHBeX2pkAVZOTpDdJkDwiMt1oJme5zQ5fu18Rv7HM87g75LI+IcDyE
 Jc5ae6WvYE/1i77HsAgCpIHjjMRt/fChHWWGlWCOX4zMLWDN8yUPVPUZ0kdbMUNOKkSW
 IXXtK/7amGgwPdQVVDw5JmSp7QilzIAZ46f03m8jI4j/TRx0nGCVmxisbcvncipFIDRe
 g2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LHcENUlrPzO5cgvg2F5FrCBor6VkXjuv0vQnM7pyk/M=;
 b=PMunPjFbke3ZJiCG3dYzya4gaHeQDG4r0IpzBG/qRBigWfCNBEKCazeGhotX7xofak
 O7ozp24BhKpHxRjLrjpgb2gC2UrYnSPq9jTpEU3MaG+wVFHHaBv37Z5MBl1OyKnIic36
 B3w7oPhZaeNGg2mB7bR4eBW58FIILTJawp4Au2xkGxtHRy0soo+G4qXwpWyPD88fxMAF
 45LedMxlmSxaiph3bA5sLTNEVAe5D02QkXt430PoPEkp4ukH+K9UMwjp7+bxequoaH3t
 fotHlbJ/dnGUcywL61m51iJTFgG3m+fb6otVvAV38FpHvxueOLWXJ6iD1wUxptF+IYAI
 doCA==
X-Gm-Message-State: AOAM532SGwv3EwypD2Ap1JLUzHrHkphUtmy6vmIee3DGUR4ScKGOa0DN
 vzq/nxTAgnjSf7QjkSAe/NiFTX3ZEXABzw==
X-Google-Smtp-Source: ABdhPJyJxboDdZPIIk7Udr+ANrikiPsxJhH4nRW2lA7HxZerV0vEs0uR1Cvq7c+R+CNeziEpmh+3Yw==
X-Received: by 2002:a17:902:ba84:b029:dc:f27:dd4e with SMTP id
 k4-20020a170902ba84b02900dc0f27dd4emr17713632pls.61.1610809050879; 
 Sat, 16 Jan 2021 06:57:30 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:d5f1:b937:d897:55ba?
 ([2405:201:600d:a089:d5f1:b937:d897:55ba])
 by smtp.gmail.com with ESMTPSA id l7sm10768539pjy.29.2021.01.16.06.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 06:57:30 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20210116122220.27261-1-yashsri421@gmail.com>
 <CABJPP5CxhBreFsM_YZvr3V4_jOdrRVkUX22E2bEwnL+Wf=nYJQ@mail.gmail.com>
 <86deb3fe-0b48-da0c-5f95-448fe9d97c19@gmail.com>
 <CABJPP5D3NNUbEPrdAT0LkHzKcigc1N3TJ+q+pL6YnCCvxFKgNg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <3c27662f-e6b3-81ed-f52e-2bd2d62984ae@gmail.com>
Date: Sat, 16 Jan 2021 20:27:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5D3NNUbEPrdAT0LkHzKcigc1N3TJ+q+pL6YnCCvxFKgNg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On 16/1/21 7:08 pm, Dwaipayan Ray wrote:
> On Sat, Jan 16, 2021 at 6:48 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 16/1/21 6:13 pm, Dwaipayan Ray wrote:
>>> On Sat, Jan 16, 2021 at 5:52 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Local symbols prefixed with '.L' do not emit symbol table entries, as
>>>> they have special meaning for the assembler.
>>>>
>>>> '.L' prefixed symbols can be used within a code region, but should be
>>>> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>>>>
>>>> Add a new check to emit warning on finding the usage of '.L' symbols
>>>> in '.S' files.
>>>>
>>>> Suggested-by: Mark Brown <broonie@kernel.org>
>>>> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
>>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>>> ---
>>>>  scripts/checkpatch.pl | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>> index 7030c4d6d126..87d96a039e64 100755
>>>> --- a/scripts/checkpatch.pl
>>>> +++ b/scripts/checkpatch.pl
>>>> @@ -3590,6 +3590,12 @@ sub process {
>>>>                         }
>>>>                 }
>>>>
>>>> +# check for .L prefix local symbols in .S files
>>>> +               if ($realfile =~ /\.S$/ && $line =~ /\.L\S+/) {
>>>> +                       WARN("AVOID_L_PREFIX",
>>>> +                            "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
>>>> +               }
>>>> +
>>>>  # check we are in a valid source file C or perl if not then ignore this hunk
>>>>                 next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>>>>
>>>> --
>>>> 2.17.1
>>>
>>> From an earlier conversation:
>>>>   So basically, you can use an .L symbol *inside* a function or a code
>>>>   segment, you just can't use the .L symbol to contain the code using a
>>>>   SYM_*_START/END annotation pair.
>>>
>>> So this check warns on all uses of the .L prefix
>>> I think that might be incorrect.
>>>
>>
>> Hey Dwaipayan,
>> I think you missed this:
>>
>>> - If the line contains ".L" prefixed symbol, give user a
>>> warning/check, so that they can ensure that the line is not inside
>>> START/END block. (As we may not be able to make sure about the same,
>>> if the START/END line is not in the patch; otherwise we could run a
>>> while loop)
>>
> 
> Then again what percentage of users actually intended to use
> it in a local scope? That is actually a correct usage and checkpatch will
> keep complaining - there will be no way to remove the warning.
> 
>> At best, I think, we could use $context_function, which should work
>> for patches, but again, this will not work for files.
>>
>> Do you have any suggestions?
>>
> 
> Does $context_function work for .S files? Am not sure.> But again that will not help much.
> 
> The main concern is not to allow .L prefix within a
> SYM_*_START...SYM_*_END annotation pair.
> 
> That means something like this will be disallowed:
> 
> SYM_FUNC_START(memset)
>     .L ... etc
> SYM_FUNC_END(memset)
> 

Yes, $context_function works inside .S files.
So, I think if it is inside one of the SYM_*_START contexts, it should
work for us.

> One possible way can be to extract the context after getting
> a SYM_*_START. Following which the lines could be checked
> for a .L preifx.
> > But complexity wise I dont know if it would be worth it.
> 

I think, we could do this for files.

But I am not sure about the complexity part.
Lukas, what do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

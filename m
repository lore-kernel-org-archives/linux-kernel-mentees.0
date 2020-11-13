Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3881C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:36:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020C22078B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kn6ZfSsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020C22078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FBA1878A5;
	Fri, 13 Nov 2020 14:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3iC5bCbW-jK; Fri, 13 Nov 2020 14:36:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03222876F2;
	Fri, 13 Nov 2020 14:36:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2C27C0FAA;
	Fri, 13 Nov 2020 14:36:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DBFEC088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 68FD120335
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCqqv+CJv55l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:36:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 5C55320243
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:36:01 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t21so896968pgl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Zmg/8EkwRNjG1FfFksZ/SfrIK70Hq71k9XJnwdcu+4=;
 b=kn6ZfSsMQO0EV8IioVsVYjfkabvsmmyUtN03FNJvfQUACMxwqUz2iNeuZoV1SgoXuc
 /RZho3zXWgtXFyekiAMqgH4jn4U2l6rudawfFXndw+2QlYMGJpmPU5BeY/cEPBIAIOou
 FpXcEDJGe9fpGI/kjVXGmdnU5uCDuCa/X45S5NEGtMnNJs3D6UQTyNiFGKnDhCo/7w81
 yIrvOtQULFTXfEc/AkNjlstANMIQfj0Ge6LUXe4zHs12y34eJ3xEPb651JFnsgcAEeCU
 l6BiFClxyKMgbThl9XCGRYMUmcXReiJCMSO9jQ+zTXUbFJR/3l5dFJe+JUZMwSR2Av/+
 raXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Zmg/8EkwRNjG1FfFksZ/SfrIK70Hq71k9XJnwdcu+4=;
 b=bA6MhvfSb3c8Y6J1ySp5TkanSiGh/IUoIWnx/2BDLV2tCvV1FiOju/kGFZ9mtROUuo
 WBauedwFY8YKPj1z4yzM6/t59VFmnWQDcaP2Lfg/JmtcGuJ2F3/Alv6uwlXDCEoIXxpW
 nBvVVfIQu/QaOjJDG5w3Z86IbtIIZxI8Gtnp6SULKCOuxWaIX1qr1fklQKES/nGwXvZS
 /xS7gv2QD8eGUU+/C7GVcpOFmR5OJo8Be0UFDGbhtpUCfPu8dEHVyeAOFJj7Xnjzbh9u
 TG+9NDsmN4C/TWEcgC22/2BEsO5M8OE4KDmSIHoo4LsFGu6ROnb2SYVE1UDqOHxaGik9
 kwww==
X-Gm-Message-State: AOAM533IUOOrP4h3XWBHNtFVMqcdDKEXNpJqRN0j8EpDKbDzbVUdDNx4
 +OkmqhLtDrhDOxzjxLw2BXWHYSck2nO6/g==
X-Google-Smtp-Source: ABdhPJxa8HEVSoL/NE3qON9VUIBkFhGJ4O/FnmraeVLpL/jySpbhzUsm4MtK62Cgmf/4bCzEh+fzNw==
X-Received: by 2002:a63:2483:: with SMTP id k125mr2258178pgk.357.1605278160363; 
 Fri, 13 Nov 2020 06:36:00 -0800 (PST)
Received: from [192.168.43.245] ([42.111.139.114])
 by smtp.gmail.com with ESMTPSA id w4sm10595356pjh.47.2020.11.13.06.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 06:35:59 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
Date: Fri, 13 Nov 2020 20:05:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

On 12/11/20 1:34 am, Lukas Bulwahn wrote:
> On Wed, Nov 11, 2020 at 3:13 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> Hi Sir
>> I have analyzed the checkpatch report for BAD_SIGN_OFF(over
>> v4.13..v5.8) for non-standard signature and generated reports for it.
>> Some mistakes are more frequent than others, whereas some mistakes
>> even have a frequency of 1.
>>
>> Non-standard signatures occurring with their frequency:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt
>>
>> Complete warning messages:
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/warn_msgs.txt
>>
>> Should I implement the fix similar to TYPO_FIX, where we have a
>> separate file for common misspellings and corrected words? Or should I
>> make a hash of these misspellings in checkpatch.pl file as well?
>>
>> Also should I include all these misspelled words in it? Or omit words
>> below certain frequency?
>>
> 
> I think the best way would be to compute some kind of edit distance to
> the known signature tags and if this edit distance is below a certain
> threshold, suggest that signature tag as the fix. We can then evaluate
> to determine the best suitable threshold. The edit distance between
> the different tags are so large that this should always work as
> intended.
> 
> Then, we can look into these other creative tags and propose suitable
> existing tags for the more frequent ones that are non-standard. Or in
> the case, none of the existing ones fit we can start the discussion on
> proposing some new standard ones.
> 

I have generated a list of non-standard signatures and their fixes on
the basis of edit distance.

This is the common list of non standard signatures and fixes (in
detail):
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/min_dists.txt

As I observed, I think, we can consider '<=2' as the threshold edit
distance.
List for non-standard signature and their proposed fix with edit
distance<=2 :
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt

I have also generated lists for 3 and 4 edit distance separately for
reference:
Equal to 3:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt

Equal to 4:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_4.txt

For the rest I guess we'll need to hard code eg. for 'Debugged-by',
'Requested-by' etc.

These are the complete lists of non-standard signatures:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/non_standard_signs.txt

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

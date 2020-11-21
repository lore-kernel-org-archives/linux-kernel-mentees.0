Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61F6C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:59:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77133217A0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGqJtJIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77133217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A35787472;
	Sat, 21 Nov 2020 12:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ak6jLacx4h0k; Sat, 21 Nov 2020 12:59:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8CA1187484;
	Sat, 21 Nov 2020 12:59:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72AFAC1825;
	Sat, 21 Nov 2020 12:59:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB806C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C2BC987476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isiRpIPOgpm4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF77C87472
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:59:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u2so6381894pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wzGtrbSWHqRyLzK53BGUd2FEpxlIP+IfcG/pVwCdIQ0=;
 b=AGqJtJIGhrDYWhSIpIKhow/g20u6VTNdturDgH8v/xsW6GBA46iD8M8YTxd7U0y3aX
 mA8P6cL7iUEIak1n/8dcFNKeSlgVATAz9Ey0ulXAq3zByiMIUcwtLApTItIeRTOlh1mU
 cUKAP+LuzY4hLq5NufXQoPBx3AgygGDcwL9bJE4HmVRQwAezTx9bTPKQTtbfWC7wIFKU
 jbS2JZKMBki6YA1eHCwGYnhNt8CmdNg69NT8H572SCMHStC2QfFidYyxozG/hDaMnM5C
 /2mIKY8OUC7JJDilBzKnFzIhePhP7lrIeHyD40xDIqMoSGtvTCKNhk44BPZHh5kcGi8Y
 th2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wzGtrbSWHqRyLzK53BGUd2FEpxlIP+IfcG/pVwCdIQ0=;
 b=g4Gmfs0X1w2DtrEraJNqRUoin6es5rscQaAp7rSrVdcp/4/peQATJJVwqZ9l79nZEK
 k67yXNPho4WmCERXDrXnZuYcmwhPlZlj/EgFXJMGu8F7wrpx0Okpp3XK/pXSDKGWrFCJ
 fAC2ID5l6qFZmcg52r5cTpKltqBkphyPOVsIQyJ8/vRrZnapW6bWxoMAcZjRUvbI/UCC
 BsBQBa5bMssqdiotk6syivBNxPyVyM73wp9M8XzqD9rj5j9USeZMz/NeQDseF/Dzjnvk
 rddj5EFD1FQQkarOzLZPfEXTmXdYx9RQ/H+N6Ag4qkCTxnJljU0FeHNGAE3ryAX44ZFv
 EIPA==
X-Gm-Message-State: AOAM530yOYmdpGYf7teT8uc+vY+h3b5zhSr0qOveIiHooi72E48OHyrl
 U84KuXmjfiu1J/76qOygfn8xttHPeOtoFw==
X-Google-Smtp-Source: ABdhPJzyTMIjuXwfYYuSffmG1loS+Y6ZKg7MAeT26ybCdhiEEOvFqvDqvZI5LDfAN2LjqGRJ4ctzqg==
X-Received: by 2002:a17:902:c14b:b029:d6:ab18:108d with SMTP id
 11-20020a170902c14bb02900d6ab18108dmr18026099plj.20.1605963545139; 
 Sat, 21 Nov 2020 04:59:05 -0800 (PST)
Received: from ?IPv6:2402:3a80:400:4498:ed91:20bf:333c:1bc4?
 ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.gmail.com with ESMTPSA id h18sm2323041pfk.17.2020.11.21.04.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 04:59:04 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
 <20201120101254.17712-1-yashsri421@gmail.com>
 <88ca7da2-9204-e061-7b67-1128a16a7852@gmail.com>
 <CAKXUXMy2J6+RSZ1oesVAD_9+fXpCUF8ANRfpmq486_zw+Mrhpg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <1c775585-9097-d596-61b2-ec989130685d@gmail.com>
Date: Sat, 21 Nov 2020 18:28:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMy2J6+RSZ1oesVAD_9+fXpCUF8ANRfpmq486_zw+Mrhpg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: MAINTAINERS: add
 information about parse-maintainers.pl
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

On 21/11/20 3:27 pm, Lukas Bulwahn wrote:
> On Fri, Nov 20, 2020 at 11:16 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 20/11/20 3:42 pm, Aditya Srivastava wrote:
>>> parse-maintainers.pl is a script which can be used to automatically
>>> order the contents of MAINTAINERS file in preferred order (i.e.
>>> 'MRLSWQBCPTFXNK').
>>>
>>> But currently we don't have a documentation on it.
>>>
>>> Add documentation regarding the same in MAINTAINERS file.
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>> the patch applies perfectly on latest next-20201119
>>>
>>>  MAINTAINERS | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5db753fa1295..7ad00af7acd4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -136,6 +136,9 @@ Descriptions of section entries and preferred order
>>>             printk, pr_info or pr_err
>>>          One regex pattern per line.  Multiple K: lines acceptable.
>>>
>>> +This order can be generated automatically for you using
>>> +``scripts/parse-maintainers.pl``.
>>> +
>>>  Maintainers List
>>>  ----------------
>>>
>>>
>>
>> Rationale for my changes:
>> I did not go into much detail of its working here.
>> A bit detail on this can be to use 'scripts/parse-maintainers
>> --sorted' which produces the sorted file in MAINTAINERS.new by
>> default. The input and output default files can be changed using
>> '--input' and '--output' options. However, here I have omitted these
>> details as running with '--help' option already provides this
>> information in detail.
>> So just making user aware of the script should serve our purpose.
>>
>> What do you think?
>>
> 
> It makes sense not to put that into MAINTAINERS.
> 
> Do you understand how to use ./scripts/parse-maintainers, though?
> 
Yes. From what I have understood, parse-maintainers.pl orders the
maintainers lists in ASCII order.

So, the list for '3C59X NETWORK DRIVER' will be displayed before
'3CR990 NETWORK DRIVER'.

It further orders the entries inside every list in this alphabetical
order: 'MRLSWQBCPTFXNK'.

> So if the warning with checkpatch is shown on a patch, what would you
> need to execute to get a corrected patch?
>

We can directly use this command 'scripts/parse-maintainers.pl
--output="MAINTAINERS" --order' to replace the MAINTAINERS with the
correct order.
However, I wouldn't recommend going for it. This is so because:
1) The MAINTAINERS file at that time might not be ordered properly for
all the different lists in it or among each other. This will result
into producing more numbers of changed lines as desired.

For eg, currently MAINTAINERS is not ordered properly. Running
parse-maintainers.pl on it results in placing 'DELL WMI NOTIFICATIONS
DRIVER' before 'DELL WMI SYSMAN DRIVER' and so on. (producing changes
with 112 Removals and 113 Additions, for simple ordering)

However if we are sure that these misplaced orders should not be
placed in that way, we can add a warning and fix for this too ie for
mutual ASCII ordering of the lists.
But this might need the list to be ordered once, otherwise for any
further changes to MAINTAINERS, it will emit this warning.

The best option currently though might be to use
'scripts/parse-maintainers.pl --order'. This creates a new
MAINTAINERS.new file, without harming our 'MAINTAINERS' file.
Now, one can check if their entries are correct manually and fix it
accordingly.
However, we can maybe automate this (as I think) by:
Read MAINTAINERS.new and store these lists entries as hashes and
replace it somehow (maybe using line numbers) in MAINTAINERS with the
sorted one.

> So if the warning with checkpatch is shown on a patch, what would ou
> you need to execute to get a corrected patch?

Again coming to this question, I don't think we can modify the patch
alone, as the line numbers and other informations in the diff
generated may change drastically. So, I think the user should probably
consider making changes in MAINTAINERS itself and then creating patch.

What do you think?

Thanks
Aditya

> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A54C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 14:31:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C69206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 14:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOClQL7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70C69206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2294286090;
	Sun,  8 Nov 2020 14:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P4hJu0hKJMW; Sun,  8 Nov 2020 14:31:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63D138604A;
	Sun,  8 Nov 2020 14:31:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4694CC0889;
	Sun,  8 Nov 2020 14:31:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEF97C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 14:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C666C86078
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 14:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-LItyq3D8tA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 14:31:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23C1E8604A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 14:31:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id oc3so1911102pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 06:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+ordL98g3SY6cD0nhcOVHU2/XlBdIRfl7g8WmAflhLA=;
 b=HOClQL7qBtXOb/6yKcWalIkJYM9ZfxXqk+I94IgJP55xUIG0ZnYTU1kn3lJDdk2lw5
 bW/22PBhrtgq7Z/D94zAxj6z6nTVy7eX9+dh1asXqBOZBl33oBlfIix8TTrGWR0Hjy3n
 JMNQmRIooUlHoy6I4x9Tq49Zjx0zWwYoB25J7PH7AoS6eAwm5wHD5BtDLStyBUivPUgI
 PSJovHCbbwLFNrFAmHNIySCtlrjYd70jCfobIvePUHQ9g/EJkcc1Eju4uXHDyTyxXn3E
 iCM1MzY7Pif4qWLFzFVNoDKh9ODDNXYv5A4+/gEXyJsbv/bVfCcozw55GCnZHUnvoZE6
 VFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ordL98g3SY6cD0nhcOVHU2/XlBdIRfl7g8WmAflhLA=;
 b=rrEn9hNQkk9wdAzJahfQpVYUeDKAoB43uqUB4Trmd60NStRPoynpfxRey0GqOhrW3t
 fNk+a91DaXEKX+2YrD3Vqm0FSojSQPC6md7ODz3Ibz85ABeUXqPJ7AQAUSkfX6oxK1bv
 fDT//D7pQk/uOdrYw11dXIcmCiOM7evAu9cxi0fibQEiYbw3BVZawMF7VvA5d1WYj2KY
 DnkyYLkvMq+QYu/C9Y5l+MjZjFufOxpKw+rUiJYFn/IBq9lAVtnxioAkU0WG2V1jmAAx
 aHyaJpivmxM0M9V4bv8Y7r5Fp2nmHid/ZZOVWPq8CLb7KAj/Ld8nrASltyAkzuHbMD+9
 QIFg==
X-Gm-Message-State: AOAM5319cUja38gb03XmwSQszRkj8L95CWV4IKDGwntKt21gqlL+sXMy
 bpWZnfWlsIwsotospFsodLQ=
X-Google-Smtp-Source: ABdhPJxI6tIw85Ha4re+ZP3B8u35S2YQoXQOSmyFBAcwk9HAbV4/H+CBNCykEBAI4l2l5N+r7dHAgw==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr8258168pjb.0.1604845902527; 
 Sun, 08 Nov 2020 06:31:42 -0800 (PST)
Received: from ?IPv6:2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3?
 ([2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3])
 by smtp.gmail.com with ESMTPSA id h5sm9000736pfk.126.2020.11.08.06.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 06:31:42 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201107121742.27144-1-yashsri421@gmail.com>
 <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
 <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
 <96a7795a-1a95-b1d7-3faa-113fb8c7d048@gmail.com>
 <alpine.DEB.2.21.2011080748070.4909@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <e5388ca7-847a-5d31-757f-2564fd1a54a2@gmail.com>
Date: Sun, 8 Nov 2020 20:01:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011080748070.4909@felia>
Content-Language: en-US
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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

On 8/11/20 12:52 pm, Lukas Bulwahn wrote:
> 
> 
> On Sun, 8 Nov 2020, Aditya wrote:
>>>
>>> Why do you not implement a proper word wrap function?
>>>
>>
>> Actually, I had searched on the web regarding it before implementation.
>> Here I have implemented text wrap only and regex is the best way I
>> could find of implementing it. Also the same was advised at
>> stackoverflow. I took help from the same.
>> Link:
>> https://stackoverflow.com/questions/956379/how-can-i-word-wrap-a-string-in-perl
> 
> And stackoverflow is not always a good reference.
> 
>> Apart from it, perl also provides a wrap function using module
>> Text::Wrap, but I wasn't sure if I could use this module in my
>> changes. So, I proceeded with regex.
>>
> 
> You can look into that, understand it a bit and then just implement a word 
> wrap from scratch as we would need it here in checkpatch.pl, it should not 
> be that complicated. 
>  
Okay.

>>> A single commit tells us very little if this rule in checkpatch.pl really
>>> is a good rule or not. A proper evaluation of typical cases of long commit
>>> lines would help much more to improve this rule.
>>>
>>
>> I generated a list of commit_long_long_line warnings with the line for
>> which they are occurring at:(v4.13..v5.8)
>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/summary.txt
>>
>> As I could see, most of these messages are plain english. But there
>> are few instances of links, hex, file locations, such as:
>>
> 
> I see many false positive warnings; so most are cases where I would not 
> break the line.
> 
>> 1)https://lore.kernel.org/lkml/1559767582-11081-1-git-send-email-info@metux.net/
>>
> 
> How about detecting all likely URLs and suggesting a proper Link: tag in 
> front of them?
> 

Should we add another warning description for this one? Or while
fixing, just prefix it with 'Link:'?

>> 2)  /home6/tmricht/linux-next/tools/build/Makefile.build:96: recipe
>> for target 'libbpf.o' failed
>>
>> 3)	8b 35 7b fb e2 00	mov    0xe2fb7b(%rip),%esi # ffffffff82db9e64
>> <nr_cpu_ids>
>>
>> I think we can use a better regex like:
>> s/(.{1,75}|\S{76,})(?:\s[^\S\r\n]*|\Z)/$1\n/g
>>
>> I tested this regex with the above cases, in which
>> 1) remains unaffected
>> 2) gets wrapped at "..recipe for" (which is 69 chars in length)
>> 3) gets wrapped at "# ffffffff82db9e64", which is 64 in length
>>
>> I guess I can generate another file with how these lines will be
>> changed, when used with fix option.
>> What do you think?
>>
> 
> I think 1, 2 and 3 should not be wrapped.
> 
> 1) should be fixed by adding a Link: prefix

Okay.

> 2) should be warned to just drop the absolute path or so.

We are already warning for the absolute path for this case. All these
warnings are emitted for:
Commit 1ce6a9fc1549 ("bpf: fix build error in libbpf with
EXTRA_CFLAGS="-Wp, -D_FORTIFY_SOURCE=2 -O2"")

I guess for (2), we can check if a line is reported by
USE_RELATIVE_PATH, we can omit it for long line warning

> 2) and 3) need to detected to be tool output and hence, we accept a longer 
> line limit here.
> 
So, we should wrap these lines after more characters? Or can we treat
them as false positives for this warning and just avoid checking such
lines for this class of warning?

> I also see a few tags and long commit log warnings.
> 
> Does checkpatch.pl also warn on long tags? That should be excluded from 
> that check.
> 
Yes, checkpatch warns currently if we use long commit logs. Eg for
commit '47987970175 ("ASoC: Intel: create haswell folder and move
haswell platform files in")'

we get:
WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description
(prefer a maximum 75 chars per line)
#13:
commit ba57f68235cf ("ASoC: Intel: create haswell folder and move
haswell platform files in")

But probably it will be best if we can wrap these line. I feel so, as
users tend to use these along the common english lines, and not always
in a different line, such as:

- MC-aware mode was introduced to mlxsw in commit 7b8195306694
("mlxsw: spectrum:

for the commit f9d5b1d50840.

Also I feel that wrapping it might not affect readability as well. For
eg, I have wrapped the commit messages for my patches as well.

E.g., at,
https://lore.kernel.org/lkml/20201030114447.24199-1-yashsri421@gmail.com/
I wrapped the 'E.g.' line which describes that I ran checkpatch.pl,
and contains the commit message.

What do you think?

> Also, I noticed quite a few 'References: <git-sha> ("<git commit 
> message>")'. I think there is no standard for this yet, but maybe that is 
> worth a discussion to agree on something and then add documentation and a 
> check for that.
> 
Thanks for pointing it out. I observed all the lines prefixed by
'References' and found out that they are either followed by link or
commit log, except once ie
"I/O hangs after resuming from suspend-to-ram"
(https://marc.info/?l=linux-block&m=150340235201348).
Here user is probably quoting his line and referencing it to the link
where he might have seen it.

I guess we can either avoid the line prefixed with 'References:'
completely or selectively avoid links and treat commit logs similar to
whatever we decide for above.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

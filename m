Return-Path: <SRS0=NdEt=HH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E4C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 19:56:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA40664FCA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Feb 2021 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA40664FCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 367D02E131;
	Fri,  5 Feb 2021 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zsS6TbE9POw; Fri,  5 Feb 2021 19:56:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2CD77203A5;
	Fri,  5 Feb 2021 19:56:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C58AC08A1;
	Fri,  5 Feb 2021 19:56:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74C79C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 19:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 703D886C26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 19:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPb9WnD52KBR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 19:56:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 42D9C86C24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Feb 2021 19:56:18 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id o63so5286331pgo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Feb 2021 11:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NTEtHIIzyowbBdxcuRYYNsCgwpIOM5OqRW8iLEqzcLw=;
 b=vg5pnI53XdNPfenxQZH8mptgrCo5PD82NBEwjz+7m1lPJCRHklC7W4gB4/ZCjU1CZb
 a7AZne0/9IcKvWawBlZoBxcCWGrKX0Gs4ht1MWAPViDqMhu3uf0s6uJkHS88HF57s+L8
 1iTEUH7+BTvaHu8IwYRWLlWdN4HuHHJxEbM7XKNbjQdSca0VnXz4xGGMJW/hUoYv00Rh
 646n00KKKw+p1FeuB1ulQM5L/XcShIppoO2+2w3rotiIkLdZ1AzBJTM8Cd1TF8uy7Khz
 7MTr6asEWIu1T72ENZfr1dD3ONSGm9x00fBselSKWHJRrTUiXyR0A0cAdLLavzipLJYU
 W7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NTEtHIIzyowbBdxcuRYYNsCgwpIOM5OqRW8iLEqzcLw=;
 b=NGGHzwfJzn9zJh5Cl+PczRSmOYh3AqaqGeemwJe0GYd0jGKtUP2Bx16mFySZWcCTPN
 lG8lujrIUYWJVhKcfOPfgYDmVkrmyaweeqIzOz9pxMz9ZLIGO1fFPruLnnKQGEIb3rm7
 MlaJbvB8pHniBa5NaOiJqO8ZsyCvEalagJKsjLyiBbrH+5sR6IEjfv50JAZ3Gqu9oLpz
 ep6KtV+WsRJNonJdh/ycSzmWangBisDPalMIaS2qAWcktAQ3HCITMYvJj6vPzYXHE6Jn
 pWrVzH253zr0YBwhTKagP4WTTxBeCBk3xpe8miP8tuUHu9rwd9j+fzti2Ab6C6lA1/mi
 6OAA==
X-Gm-Message-State: AOAM531qbwcSKvW4L3JyNEfK1Om4xVDraVSyozhVCNsD5GJPO3jRJ0cQ
 BJsXsGNukeCtSGC7Y2zLi22eN6jy1XkIZg==
X-Google-Smtp-Source: ABdhPJwaizhzPYr7sE0P1BDfiObXfLCcE5y9CMI8BhqcIzkUCtuE2Gdzz1HAh3avfcEWxQnh9T0erw==
X-Received: by 2002:a63:3686:: with SMTP id d128mr5747931pga.240.1612554977490; 
 Fri, 05 Feb 2021 11:56:17 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:307f:87a1:7a93:274?
 ([2405:201:600d:a089:307f:87a1:7a93:274])
 by smtp.gmail.com with ESMTPSA id z12sm808396pjz.16.2021.02.05.11.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 11:56:16 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
 <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
 <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
 <CAKXUXMy7XbmWmj5HOrAJ-fYAdZmK0kd9NnP_i4cpOaS7eqCnrw@mail.gmail.com>
 <CABJPP5At6mYOCDyQWLf72guKaWV1xJxyYPELk+_4WQ8E+f9jfg@mail.gmail.com>
 <fea0e147-4016-b039-f8d0-0ab88ef60484@gmail.com>
 <CABJPP5BbNdHibThixX0H4m_CF-RWpSwesZ2QpK+it_h7Xe9XfA@mail.gmail.com>
 <CAKXUXMxK8szuXv0Zj4M-htBQYKt-X9N=VUrkwQj-j9q5Kz9msA@mail.gmail.com>
 <e68c3e52-4a89-2df6-6910-a6dbb0829281@gmail.com>
Message-ID: <af1fa463-3938-d8b8-4426-135877600fab@gmail.com>
Date: Sat, 6 Feb 2021 01:26:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e68c3e52-4a89-2df6-6910-a6dbb0829281@gmail.com>
Content-Language: en-US
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
 test-branch and run clang-format
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

On 23/12/20 6:46 pm, Aditya wrote:
> On 22/12/20 4:23 pm, Lukas Bulwahn wrote:
>> On Tue, Dec 22, 2020 at 11:34 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>>
>>> On Tue, Dec 22, 2020 at 3:55 PM Aditya <yashsri421@gmail.com> wrote:
>>>>
>>>> On 22/12/20 1:17 am, Dwaipayan Ray wrote:
>>>>>> Okay, I downloaded and tried it:
>>>>>>
>>>>>> perl ./scripts/applypatch.pl --clang-format test.patch
>>>>>> --branch=test-clang-format-bfq-cgroup
>>>>>>
>>>>>> but it failed:
>>>>>>
>>>>>> git checkout test-clang-format-bfq-cgroup
>>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>>> git am $patchtest.patch
>>>>>> fatal: could not open '.patch' for reading: No such file or directory
>>>>>> Clang formatted patchfile generated at:
>>>>>> test.patch.EXPERIMENTAL-clang_format-fixes
>>>>>> git checkout test-clang-format-bfq-cgroup
>>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>>>
>>>>>> How about setting up a minimal travis.ci check that runs this command
>>>>>> on a small git repository with one file and one patch on top for
>>>>>> testing purposes?
>>>>>>
>>>>>> The script does not have error handling yet, so the next steps are
>>>>>> just executed blindly even if the one before failed and is really
>>>>>> required for the next one to do the right thing.
>>>>>>
>>>>>> I generally like the script, let us work a bit on tuning it for proper
>>>>>> error handling, add some basic tests and then discuss it with Miguel.
>>>>>>
>>>>>> Lukas
>>>>>>
>>>>>
>>>>> Hello Lukas,
>>>>> Sorry for being late on this update. I have my college exams going on
>>>>> right now, so that caused a bit of delay.
>>>>>
>>>>> Nevertheless I have applied some changes along with some error handling fixes.
>>>>> The script is available here:
>>>>> https://github.com/raydwaipayan/apply-patch
>>>>>
>>>>> The script has the following options now:
>>>>> usage: $P [options] patchfile(s)
>>>>> Options:
>>>>> --branch=<branch-name> => test branch name
>>>>> --format => Use clang format
>>>>> --clang-format-diff=<s> => clang-format-diff path
>>>>> --help => show this help information
>>>>> --root=<root_dir> => root dir location
>>>>>
>>>>> By default script searches for "clang-format-diff.py" in path. If it goes
>>>>> by any other name that should be supplied using
>>>>> --clang-format-diff="FULL_PATH_OF_EXECUTABLE"
>>>>>
>>>>> I ran the script like this:
>>>>> $ ./scripts/applypatch.pl
>>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format
>>>>>
>>>>> Expected output:
>>>>> git checkout -b test-master
>>>>> Switched to a new branch 'test-master'
>>>>> git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>>> Patch applied successfully:
>>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>>> Running clang-format
>>>>> Diff written to clang-format-fixes.diff
>>>>> git checkout master
>>>>> Switched to branch 'master
>>>>>
>>>>> Lukas, could you check if this script works on your system as expected?
>>>>>
>>>>> Also Aditya, I think the latest clang-format-diff goes by the name
>>>>> 'clang-format-diff-8' on debian based systems. While in my arch based one
>>>>> it goes by 'clang-format-diff.py'. Can you verify whether the script works
>>>>> directly or is the executable path flag needed?
>>>>>
>>>>
>>>> For debian based system, the user will have to add
>>>> --clang-format-diff="/usr/bin/clang-format-diff-8".
>>>>
>>> I think that is currently an extra step for the user. Maybe we can
>>> target most used flavours and fill the binary location automatically.
>>>
>>>> A few more improvements can be made. For eg., the script should exit
>>>> if the patch isn't applying. Currently, it continues a step further
>>>> and stops after giving error: "Error: This script requires
>>>> clang-format-diff to be installed.".
>>>> Also, this puts the git status in mid of git am, which needs to be reset.
>>>>
>>> Yeah maybe instead of die we can just return by saying "clang-format won't
>>> apply".
>>>
>>>> Maybe we can improve the error message by displaying them about
>>>> "--clang-format-diff" option and giving install options in the error
>>>> message. This should make the script easier to be used.
>>>>
>>>
>>> In that case we may have to give instructions for all the available
>>> distributions. Maybe we can point them to the LLVM page?
>>>
>>
>> Good discussion. Consider that the first users will fight with the installation.
>> So, the tool should carefully check if the environment is set up
>> before trying to do any steps; otherwise, it might be in some strange
>> intermediate stage and it requires a lot of scripting to roll back
>> operations etc.
>>
>> Also, developers do read README; so, any hints there are always helpful.
>>
>>>> One more improvement I guess we can make with the .diff file, by
>>>> renaming .diff after patchfile name. This way it won't be overwritten
>>>> each time and also be in consistency with checkpatch.pl --fix.
>>>>
>>>
>>> About this I was thinking we should avoid creating individual diffs.
>>> Since in the future the script may apply a patch series too, we can
>>> just generate a single diff and name accordingly. That way in a single
>>> step the committer can apply all fixes.
>>>
>>
>> Well, the developer that has a patch series would want to have the
>> stylistic patches to just fold into their original patch order.
>>
>> So, you have two reasonable alternatives:
>>
>> 1. You simply create some diff commits on top of the patch series,
>> i.e., one diff commit for each patch in the series. That allows the
>> developer to review the format change for each patch and then, the
>> developer can simply squash the stylistic cleanup on the appropriate
>> patch in the series.
>> 2. You simply "automate" that workflow in option 1, where you generate
>> new patches with the format patch applied, just as Aditya suggested.
>>
>> For now, as we are still experimenting, I am in favor of 1; simply
>> because it is easier to review for now, when somebody applies it for
>> testing. Option 2 is probably good once it works reliably and we have
>> trust in the formatting setup.
>>
> 

Hi Lukas

I and Dwaipayan have been working on clang-format script. We have
refined it to a great extent. Now it is not dependent on version
specific clang-format-diff as well, as was the case earlier.
I have also tested it with patch series, and it works fine.

All the formatted changes(with patch commits) are made to the test
branch, while the original branch is left untouched.
We have also managed to handle command errors and break the script
execution at relevant places.

The file and the steps to be followed can be found here:
https://github.com/raydwaipayan/apply-patch/tree/dev

I have also added test patches for easier testing.
You can follow these steps for quicker testing of script:
https://github.com/raydwaipayan/apply-patch/tree/dev#steps-to-test-the-script

The readme has also been updated correspondingly.

Please test it and let us know your views on it :)

I think one of the limitations currently is that
clang-format-fixes.diff gets overwritten and just tells the diff wrt
last patch.
I am working on it. Probably, I'll be able to fix this by tomorrow.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

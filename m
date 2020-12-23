Return-Path: <SRS0=TKGw=F3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1996C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Dec 2020 13:16:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7E7221F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Dec 2020 13:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7E7221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 155478721F;
	Wed, 23 Dec 2020 13:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QoV9LP9+Lrcd; Wed, 23 Dec 2020 13:16:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 18747871C5;
	Wed, 23 Dec 2020 13:16:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 036FFC1825;
	Wed, 23 Dec 2020 13:16:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96F40C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Dec 2020 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 84FE38721F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Dec 2020 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tnpa9iKTjQ2z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Dec 2020 13:16:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A89E871C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Dec 2020 13:16:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id r4so9105504pls.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Dec 2020 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7jk2mxAbXfzpJJ6s9879atZtrVHHMf859tH586Ezvb0=;
 b=bPBw3/K/5mng0BVUretwap//X67neJ1mc7/OwKhI22PWo/oKuDzYDK223LpWN255ks
 iJnJlUC/lIvvPpqG0ZPxXhQ/NszcQWqB9O3BT2Rvv6JNnxMM3IbhlQn7qz3ZoDD8ZEp6
 VBv/ZkrUiW5Tsev8prU5gKGYNgitRJ+8xGXOr0CZupkI8USov1BrCNo2jaXXsLXbyrsE
 pVAssx302sfiRKMb/pOpdGXHWyR75YS6gkoOH7mMZbEWnfEKEqoVBbRKgQ1TH7DWf2hg
 ZfgHK15JHGCaXQciXVsG0uPxl23a8Q0UHg0Pb+EyuWScxuNyJBRHNUjcp2X7BbYTPZal
 2+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7jk2mxAbXfzpJJ6s9879atZtrVHHMf859tH586Ezvb0=;
 b=lE181/U+m7ZpnpCegjs5CcutCji6nMcS48lY70VaRUywh8m19FqnLOTUzwM9LUJqAg
 Dd1Wbmrxexedf8kjgE20PA4qCuOM4zKYlfk9CCB9p5lcah6wOYTYYxK8F3QLKJEzHu7l
 rH1wL2rdaVH8FltQNxAmOGnbdgm8yykUgfj0DErCOPFgr2zJdAXRXKbGdTrZ2H/C8/eN
 VTQ3elvljbF7c7Q9q82yjZ+IGER28XaCSYYpoOGSZZvp6frAWetdy69c69oWR7Mbl/A6
 OhqwgmpqSBSrWlzkY7JGyXnNgIudEQsHUioZabsuezFBtTJ5I0gzkh9o0p0gXPwPF97T
 HLyA==
X-Gm-Message-State: AOAM531ArPOvg9PEm331k1KXJvaLbEitySmuaXuI/tJFCMEnKkSGz+jH
 N1vkIZPbNzNuGyA2TPZznnaYV+8RAlNDTg==
X-Google-Smtp-Source: ABdhPJzDm/uqQyf80wqUHu9pbIIAoxDG3BU/ra5AwRO1fRGMGEsHLsr6RdR8lU0KFr5psS/ZWE/RRg==
X-Received: by 2002:a17:902:ac93:b029:db:c725:e321 with SMTP id
 h19-20020a170902ac93b02900dbc725e321mr19175382plr.41.1608729405345; 
 Wed, 23 Dec 2020 05:16:45 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:5574:d22:f4b0:214:6348?
 ([2402:3a80:413:5574:d22:f4b0:214:6348])
 by smtp.gmail.com with ESMTPSA id p16sm22881355pju.47.2020.12.23.05.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 05:16:44 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
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
From: Aditya <yashsri421@gmail.com>
Message-ID: <e68c3e52-4a89-2df6-6910-a6dbb0829281@gmail.com>
Date: Wed, 23 Dec 2020 18:46:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxK8szuXv0Zj4M-htBQYKt-X9N=VUrkwQj-j9q5Kz9msA@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 22/12/20 4:23 pm, Lukas Bulwahn wrote:
> On Tue, Dec 22, 2020 at 11:34 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> On Tue, Dec 22, 2020 at 3:55 PM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> On 22/12/20 1:17 am, Dwaipayan Ray wrote:
>>>>> Okay, I downloaded and tried it:
>>>>>
>>>>> perl ./scripts/applypatch.pl --clang-format test.patch
>>>>> --branch=test-clang-format-bfq-cgroup
>>>>>
>>>>> but it failed:
>>>>>
>>>>> git checkout test-clang-format-bfq-cgroup
>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>> git am $patchtest.patch
>>>>> fatal: could not open '.patch' for reading: No such file or directory
>>>>> Clang formatted patchfile generated at:
>>>>> test.patch.EXPERIMENTAL-clang_format-fixes
>>>>> git checkout test-clang-format-bfq-cgroup
>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>>
>>>>> How about setting up a minimal travis.ci check that runs this command
>>>>> on a small git repository with one file and one patch on top for
>>>>> testing purposes?
>>>>>
>>>>> The script does not have error handling yet, so the next steps are
>>>>> just executed blindly even if the one before failed and is really
>>>>> required for the next one to do the right thing.
>>>>>
>>>>> I generally like the script, let us work a bit on tuning it for proper
>>>>> error handling, add some basic tests and then discuss it with Miguel.
>>>>>
>>>>> Lukas
>>>>>
>>>>
>>>> Hello Lukas,
>>>> Sorry for being late on this update. I have my college exams going on
>>>> right now, so that caused a bit of delay.
>>>>
>>>> Nevertheless I have applied some changes along with some error handling fixes.
>>>> The script is available here:
>>>> https://github.com/raydwaipayan/apply-patch
>>>>
>>>> The script has the following options now:
>>>> usage: $P [options] patchfile(s)
>>>> Options:
>>>> --branch=<branch-name> => test branch name
>>>> --format => Use clang format
>>>> --clang-format-diff=<s> => clang-format-diff path
>>>> --help => show this help information
>>>> --root=<root_dir> => root dir location
>>>>
>>>> By default script searches for "clang-format-diff.py" in path. If it goes
>>>> by any other name that should be supplied using
>>>> --clang-format-diff="FULL_PATH_OF_EXECUTABLE"
>>>>
>>>> I ran the script like this:
>>>> $ ./scripts/applypatch.pl
>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format
>>>>
>>>> Expected output:
>>>> git checkout -b test-master
>>>> Switched to a new branch 'test-master'
>>>> git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>> Patch applied successfully:
>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>> Running clang-format
>>>> Diff written to clang-format-fixes.diff
>>>> git checkout master
>>>> Switched to branch 'master
>>>>
>>>> Lukas, could you check if this script works on your system as expected?
>>>>
>>>> Also Aditya, I think the latest clang-format-diff goes by the name
>>>> 'clang-format-diff-8' on debian based systems. While in my arch based one
>>>> it goes by 'clang-format-diff.py'. Can you verify whether the script works
>>>> directly or is the executable path flag needed?
>>>>
>>>
>>> For debian based system, the user will have to add
>>> --clang-format-diff="/usr/bin/clang-format-diff-8".
>>>
>> I think that is currently an extra step for the user. Maybe we can
>> target most used flavours and fill the binary location automatically.
>>
>>> A few more improvements can be made. For eg., the script should exit
>>> if the patch isn't applying. Currently, it continues a step further
>>> and stops after giving error: "Error: This script requires
>>> clang-format-diff to be installed.".
>>> Also, this puts the git status in mid of git am, which needs to be reset.
>>>
>> Yeah maybe instead of die we can just return by saying "clang-format won't
>> apply".
>>
>>> Maybe we can improve the error message by displaying them about
>>> "--clang-format-diff" option and giving install options in the error
>>> message. This should make the script easier to be used.
>>>
>>
>> In that case we may have to give instructions for all the available
>> distributions. Maybe we can point them to the LLVM page?
>>
> 
> Good discussion. Consider that the first users will fight with the installation.
> So, the tool should carefully check if the environment is set up
> before trying to do any steps; otherwise, it might be in some strange
> intermediate stage and it requires a lot of scripting to roll back
> operations etc.
> 
> Also, developers do read README; so, any hints there are always helpful.
> 
>>> One more improvement I guess we can make with the .diff file, by
>>> renaming .diff after patchfile name. This way it won't be overwritten
>>> each time and also be in consistency with checkpatch.pl --fix.
>>>
>>
>> About this I was thinking we should avoid creating individual diffs.
>> Since in the future the script may apply a patch series too, we can
>> just generate a single diff and name accordingly. That way in a single
>> step the committer can apply all fixes.
>>
> 
> Well, the developer that has a patch series would want to have the
> stylistic patches to just fold into their original patch order.
> 
> So, you have two reasonable alternatives:
> 
> 1. You simply create some diff commits on top of the patch series,
> i.e., one diff commit for each patch in the series. That allows the
> developer to review the format change for each patch and then, the
> developer can simply squash the stylistic cleanup on the appropriate
> patch in the series.
> 2. You simply "automate" that workflow in option 1, where you generate
> new patches with the format patch applied, just as Aditya suggested.
> 
> For now, as we are still experimenting, I am in favor of 1; simply
> because it is easier to review for now, when somebody applies it for
> testing. Option 2 is probably good once it works reliably and we have
> trust in the formatting setup.
> 

Hi Dwaipayan,
I have made a PR to the repository.
These are the changes that I have made:

- check if the patch applies before applying it. If so, don't apply
the patch.
- remove the user's need to enter file path for clang-format-diff
- fix python version dependency with respect to clang-format version.
Detect required python version on the basis of clang-version.
- Do not run clang-format if patch application fails
- Update Readme accordingly.

A big improvement we have made is that we no longer require
clang-format-8 specifically. It can be any version and we'll invoke it
accordingly with corresponding python version dependency.

In addition, I feel we have overcome the flavor dependency for
clang-format-diff. This is based on my assumption that the file will
either be present as "clang-format-diff.py" or "clang-format-diff".

I haven't been able to test this though for different flavors, but I
believe this will be true as I haven't seen "clang-format-diff" being
used in any other form apart from "clang-format-diff" or
"clang-format-diff.py" in any doc online.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

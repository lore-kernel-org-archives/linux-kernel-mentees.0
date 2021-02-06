Return-Path: <SRS0=0eHf=HI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB5FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Feb 2021 09:21:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0FC64E3D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Feb 2021 09:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0FC64E3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A8A520396;
	Sat,  6 Feb 2021 09:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Abx192cih1Uv; Sat,  6 Feb 2021 09:21:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 15E6F2035B;
	Sat,  6 Feb 2021 09:21:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC5EBC0174;
	Sat,  6 Feb 2021 09:21:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73C88C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 09:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 47FAB8720D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 09:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5j98n3w2CKv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 09:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2346987019
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Feb 2021 09:21:25 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id b21so6293797pgk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 Feb 2021 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pAxH0uVt+1z73NtASVOPNgKCoKuvthaqeDpyniSj/Xo=;
 b=IMT0r+ZcLhxkTrpYlLMen3dIUk8fuDk3rBDkCF5xXQ4rDEHcdxidhcbmcyCG8DDOk8
 96KE5ujBpvB90W0xX6SY7suR8TXrmcMoTYCaEdOmPjX5kmpMPd7MxbXKABzVECcXhAqr
 mnKZSWWA4cCNStubCVdZLj1pC+LlHXHWA96FAisEtEpNiVTPwiwFFIW3UU5QfZMbQsK6
 0ciRt9H+Zo3AwfvecMUCpnp8C3mKuOST1NteKTRFiRPfq9IuIpwWJivcafFg8TLGLo0z
 PTXT15EaQNkTv+j3n00cFVEGo2C7q0GEGAPqVEHPqqDbie4Fwd4AysYo0fv1Z7Fn2LV5
 Ocrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pAxH0uVt+1z73NtASVOPNgKCoKuvthaqeDpyniSj/Xo=;
 b=PzdQS0VJyUPPkAJuiUJ1oDA2OAHW02YOVgy03NX9CXlZRzee4CgbVod6jXxS545NCV
 TXFzhVWiW+DURcNuVAXcx92Eyhe7mrT/qTG8mIOSr/1oTqRizjkFaYSGrbtacZJkOmWk
 +aK083rd0nDNGQGlKMHq14J9moQ0/Wc8iU2HJjT+xugP8xbFNDI2R9vdEiU4FOb92Z3S
 exMWfcaOjjyN+BkOlA3Vaklxof4VEqQG/8vtPOcMk926v+YsAZz1kbI8xCMP3NrCE/VM
 jdMURubMeZMHrg1OZyvplsoTONHnp3fl7yVcFW/xPMeufE+aIg/2JQjvD9Tx5TLWYFhB
 yF6g==
X-Gm-Message-State: AOAM532lL7c/6ECNCgRlwWaC8P9sO4QBNwO2NVjOVwQl2buMT0HH3a9H
 5PXoK7eWZyO65RG/IzOcksd7Jj2K1PtUeg==
X-Google-Smtp-Source: ABdhPJxVmYUa4GysUUnJqh5ITrbI117rQ8Q7dXvshcEaBQgHxtMBx3XITNsnBVJzpOyRjjuaL3HWyQ==
X-Received: by 2002:a63:7f09:: with SMTP id a9mr8376596pgd.63.1612603284239;
 Sat, 06 Feb 2021 01:21:24 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:f007:45fa:79ee:59f2?
 ([2405:201:600d:a089:f007:45fa:79ee:59f2])
 by smtp.gmail.com with ESMTPSA id z12sm4389538pfn.150.2021.02.06.01.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 01:21:23 -0800 (PST)
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
 <af1fa463-3938-d8b8-4426-135877600fab@gmail.com>
Message-ID: <835977a0-ea64-515b-4f67-f436c89fbca0@gmail.com>
Date: Sat, 6 Feb 2021 14:51:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <af1fa463-3938-d8b8-4426-135877600fab@gmail.com>
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

On 6/2/21 1:26 am, Aditya wrote:
> On 23/12/20 6:46 pm, Aditya wrote:
>> On 22/12/20 4:23 pm, Lukas Bulwahn wrote:
>>> On Tue, Dec 22, 2020 at 11:34 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>>>
>>>> On Tue, Dec 22, 2020 at 3:55 PM Aditya <yashsri421@gmail.com> wrote:
>>>>>
>>>>> On 22/12/20 1:17 am, Dwaipayan Ray wrote:
>>>>>>> Okay, I downloaded and tried it:
>>>>>>>
>>>>>>> perl ./scripts/applypatch.pl --clang-format test.patch
>>>>>>> --branch=test-clang-format-bfq-cgroup
>>>>>>>
>>>>>>> but it failed:
>>>>>>>
>>>>>>> git checkout test-clang-format-bfq-cgroup
>>>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>>>> git am $patchtest.patch
>>>>>>> fatal: could not open '.patch' for reading: No such file or directory
>>>>>>> Clang formatted patchfile generated at:
>>>>>>> test.patch.EXPERIMENTAL-clang_format-fixes
>>>>>>> git checkout test-clang-format-bfq-cgroup
>>>>>>> Already on 'test-clang-format-bfq-cgroup'
>>>>>>>
>>>>>>> How about setting up a minimal travis.ci check that runs this command
>>>>>>> on a small git repository with one file and one patch on top for
>>>>>>> testing purposes?
>>>>>>>
>>>>>>> The script does not have error handling yet, so the next steps are
>>>>>>> just executed blindly even if the one before failed and is really
>>>>>>> required for the next one to do the right thing.
>>>>>>>
>>>>>>> I generally like the script, let us work a bit on tuning it for proper
>>>>>>> error handling, add some basic tests and then discuss it with Miguel.
>>>>>>>
>>>>>>> Lukas
>>>>>>>
>>>>>>
>>>>>> Hello Lukas,
>>>>>> Sorry for being late on this update. I have my college exams going on
>>>>>> right now, so that caused a bit of delay.
>>>>>>
>>>>>> Nevertheless I have applied some changes along with some error handling fixes.
>>>>>> The script is available here:
>>>>>> https://github.com/raydwaipayan/apply-patch
>>>>>>
>>>>>> The script has the following options now:
>>>>>> usage: $P [options] patchfile(s)
>>>>>> Options:
>>>>>> --branch=<branch-name> => test branch name
>>>>>> --format => Use clang format
>>>>>> --clang-format-diff=<s> => clang-format-diff path
>>>>>> --help => show this help information
>>>>>> --root=<root_dir> => root dir location
>>>>>>
>>>>>> By default script searches for "clang-format-diff.py" in path. If it goes
>>>>>> by any other name that should be supplied using
>>>>>> --clang-format-diff="FULL_PATH_OF_EXECUTABLE"
>>>>>>
>>>>>> I ran the script like this:
>>>>>> $ ./scripts/applypatch.pl
>>>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format
>>>>>>
>>>>>> Expected output:
>>>>>> git checkout -b test-master
>>>>>> Switched to a new branch 'test-master'
>>>>>> git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>>>> Patch applied successfully:
>>>>>> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
>>>>>> Running clang-format
>>>>>> Diff written to clang-format-fixes.diff
>>>>>> git checkout master
>>>>>> Switched to branch 'master
>>>>>>
>>>>>> Lukas, could you check if this script works on your system as expected?
>>>>>>
>>>>>> Also Aditya, I think the latest clang-format-diff goes by the name
>>>>>> 'clang-format-diff-8' on debian based systems. While in my arch based one
>>>>>> it goes by 'clang-format-diff.py'. Can you verify whether the script works
>>>>>> directly or is the executable path flag needed?
>>>>>>
>>>>>
>>>>> For debian based system, the user will have to add
>>>>> --clang-format-diff="/usr/bin/clang-format-diff-8".
>>>>>
>>>> I think that is currently an extra step for the user. Maybe we can
>>>> target most used flavours and fill the binary location automatically.
>>>>
>>>>> A few more improvements can be made. For eg., the script should exit
>>>>> if the patch isn't applying. Currently, it continues a step further
>>>>> and stops after giving error: "Error: This script requires
>>>>> clang-format-diff to be installed.".
>>>>> Also, this puts the git status in mid of git am, which needs to be reset.
>>>>>
>>>> Yeah maybe instead of die we can just return by saying "clang-format won't
>>>> apply".
>>>>
>>>>> Maybe we can improve the error message by displaying them about
>>>>> "--clang-format-diff" option and giving install options in the error
>>>>> message. This should make the script easier to be used.
>>>>>
>>>>
>>>> In that case we may have to give instructions for all the available
>>>> distributions. Maybe we can point them to the LLVM page?
>>>>
>>>
>>> Good discussion. Consider that the first users will fight with the installation.
>>> So, the tool should carefully check if the environment is set up
>>> before trying to do any steps; otherwise, it might be in some strange
>>> intermediate stage and it requires a lot of scripting to roll back
>>> operations etc.
>>>
>>> Also, developers do read README; so, any hints there are always helpful.
>>>
>>>>> One more improvement I guess we can make with the .diff file, by
>>>>> renaming .diff after patchfile name. This way it won't be overwritten
>>>>> each time and also be in consistency with checkpatch.pl --fix.
>>>>>
>>>>
>>>> About this I was thinking we should avoid creating individual diffs.
>>>> Since in the future the script may apply a patch series too, we can
>>>> just generate a single diff and name accordingly. That way in a single
>>>> step the committer can apply all fixes.
>>>>
>>>
>>> Well, the developer that has a patch series would want to have the
>>> stylistic patches to just fold into their original patch order.
>>>
>>> So, you have two reasonable alternatives:
>>>
>>> 1. You simply create some diff commits on top of the patch series,
>>> i.e., one diff commit for each patch in the series. That allows the
>>> developer to review the format change for each patch and then, the
>>> developer can simply squash the stylistic cleanup on the appropriate
>>> patch in the series.
>>> 2. You simply "automate" that workflow in option 1, where you generate
>>> new patches with the format patch applied, just as Aditya suggested.
>>>
>>> For now, as we are still experimenting, I am in favor of 1; simply
>>> because it is easier to review for now, when somebody applies it for
>>> testing. Option 2 is probably good once it works reliably and we have
>>> trust in the formatting setup.
>>>
>>
> 
> Hi Lukas
> 
> I and Dwaipayan have been working on clang-format script. We have
> refined it to a great extent. Now it is not dependent on version
> specific clang-format-diff as well, as was the case earlier.
> I have also tested it with patch series, and it works fine.
> 
> All the formatted changes(with patch commits) are made to the test
> branch, while the original branch is left untouched.
> We have also managed to handle command errors and break the script
> execution at relevant places.
> 
> The file and the steps to be followed can be found here:
> https://github.com/raydwaipayan/apply-patch/tree/dev
> 
> I have also added test patches for easier testing.
> You can follow these steps for quicker testing of script:
> https://github.com/raydwaipayan/apply-patch/tree/dev#steps-to-test-the-script
> 
> The readme has also been updated correspondingly.
> 
> Please test it and let us know your views on it :)
> 
> I think one of the limitations currently is that
> clang-format-fixes.diff gets overwritten and just tells the diff wrt
> last patch.
> I am working on it. Probably, I'll be able to fix this by tomorrow.

Hi Lukas
I have made necessary changes for this feature as well.
Now, for all the patches in patch series, a diff file is getting
created, and it will be stored alongside the patchfile, as
"patchfile.clang-format-fixes.diff"

This is in compliance with your suggestion here:

>>> 1. You simply create some diff commits on top of the patch series,
>>> i.e., one diff commit for each patch in the series. That allows the
>>> developer to review the format change for each patch and then, the
>>> developer can simply squash the stylistic cleanup on the appropriate
>>> patch in the series.
>>> 2. You simply "automate" that workflow in option 1, where you generate
>>> new patches with the format patch applied, just as Aditya suggested.
>>>
>>> For now, as we are still experimenting, I am in favor of 1; simply
>>> because it is easier to review for now, when somebody applies it for
>>> testing. Option 2 is probably good once it works reliably and we have
>>> trust in the formatting setup.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

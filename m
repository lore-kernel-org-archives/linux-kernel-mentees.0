Return-Path: <SRS0=wyXY=F2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62797C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Dec 2020 10:25:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC27323105
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Dec 2020 10:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC27323105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31375869D0;
	Tue, 22 Dec 2020 10:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxGz1+Roz3K1; Tue, 22 Dec 2020 10:25:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0DF4869CB;
	Tue, 22 Dec 2020 10:25:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FA77C1825;
	Tue, 22 Dec 2020 10:25:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F8B8C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 69767869CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AjnIvl4DBGF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:25:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8045B869CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 10:25:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id c12so8196411pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Dec 2020 02:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=93M40OimmxplrWdOPpcLOaNsp6jZu86evk2FTH9jcfI=;
 b=oJvvociduHiI+sMnQDSG5Yf6/z0z7wdxXze4GJNwj1XnVQFk9Sf3loz8DkxVOzRvpd
 0mLfDltYZl5NQAsffYW/+i/3ldXvVxBhS12iHXrChT+8HwemwavSQJH9UipyAyMi2aD+
 AenzAGCep+gMJnOAVYsFoGYTlBAUE7pg/VlmMc7csfZf5tRZ/dYYBPeUJhGyI9g/Rtrb
 b2xIRtxX+ovMLvYK9PsCZIwUXqfAcMlGczym2Ytn7CbMJTEa8cEZbl4p+t8Fj3euiVuv
 vxjonRKPolPOUS+sWP7e6kzEVSWebjhiz6KRt5/sVcztr3UfEIYJuuLcSeu+egh2F2bS
 8KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=93M40OimmxplrWdOPpcLOaNsp6jZu86evk2FTH9jcfI=;
 b=Th/IIeYkFSo71YwFnjilVSPR8oNExRex3kVJHjwlQbJ6biz8TOISvz/enc2EmB4ATh
 Z2kslhX4qqJz2Xiu1FwgO0c4+YLH2MZbnzHPWBj3WNM6IEp9+dfpywq9bIy6IOnMv6q+
 jSIe4gPpMWrHAz8lcuy0lvFvsoHyCM9iMWA8Yo252dSvgoZY6v+sqrYFhJkgmx4UF2Bb
 QfIssH5WcJE8qRLl94dhD9KP/h2V/wKqcFmO/p2+7a5rpzEAPcWjJexgx66hemsG21lF
 RLXWnOtIJLv2wmzJGlu4b54QMbZ5mAhk3AKnv61gyKro++m/Gw4vyxrm8vPe0wpWcqG+
 fBjw==
X-Gm-Message-State: AOAM533SMDDd3OzWy284cPT4ViiIGWXGiuy6UzQ0o/qzJop1Cor/wmBo
 3MTJvhR+/0I6JrlIlWB9jhk+zku0LbX5lcgu
X-Google-Smtp-Source: ABdhPJx2mdbv31atkQbsJJcg9TE5gZwzij2XZKnUYTHsuSxLxq2e47K4E/gmTvgRubQ5+AofiGIc1g==
X-Received: by 2002:a63:4d5c:: with SMTP id n28mr19397966pgl.88.1608632726552; 
 Tue, 22 Dec 2020 02:25:26 -0800 (PST)
Received: from ?IPv6:2402:3a80:42b:2ad3:7d16:b913:b03b:5037?
 ([2402:3a80:42b:2ad3:7d16:b913:b03b:5037])
 by smtp.gmail.com with ESMTPSA id k15sm20420343pfh.40.2020.12.22.02.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 02:25:26 -0800 (PST)
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
From: Aditya <yashsri421@gmail.com>
Message-ID: <fea0e147-4016-b039-f8d0-0ab88ef60484@gmail.com>
Date: Tue, 22 Dec 2020 15:55:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABJPP5At6mYOCDyQWLf72guKaWV1xJxyYPELk+_4WQ8E+f9jfg@mail.gmail.com>
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

On 22/12/20 1:17 am, Dwaipayan Ray wrote:
>> Okay, I downloaded and tried it:
>>
>> perl ./scripts/applypatch.pl --clang-format test.patch
>> --branch=test-clang-format-bfq-cgroup
>>
>> but it failed:
>>
>> git checkout test-clang-format-bfq-cgroup
>> Already on 'test-clang-format-bfq-cgroup'
>> git am $patchtest.patch
>> fatal: could not open '.patch' for reading: No such file or directory
>> Clang formatted patchfile generated at:
>> test.patch.EXPERIMENTAL-clang_format-fixes
>> git checkout test-clang-format-bfq-cgroup
>> Already on 'test-clang-format-bfq-cgroup'
>>
>> How about setting up a minimal travis.ci check that runs this command
>> on a small git repository with one file and one patch on top for
>> testing purposes?
>>
>> The script does not have error handling yet, so the next steps are
>> just executed blindly even if the one before failed and is really
>> required for the next one to do the right thing.
>>
>> I generally like the script, let us work a bit on tuning it for proper
>> error handling, add some basic tests and then discuss it with Miguel.
>>
>> Lukas
>>
> 
> Hello Lukas,
> Sorry for being late on this update. I have my college exams going on
> right now, so that caused a bit of delay.
> 
> Nevertheless I have applied some changes along with some error handling fixes.
> The script is available here:
> https://github.com/raydwaipayan/apply-patch
> 
> The script has the following options now:
> usage: $P [options] patchfile(s)
> Options:
> --branch=<branch-name> => test branch name
> --format => Use clang format
> --clang-format-diff=<s> => clang-format-diff path
> --help => show this help information
> --root=<root_dir> => root dir location
> 
> By default script searches for "clang-format-diff.py" in path. If it goes
> by any other name that should be supplied using
> --clang-format-diff="FULL_PATH_OF_EXECUTABLE"
> 
> I ran the script like this:
> $ ./scripts/applypatch.pl
> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format
> 
> Expected output:
> git checkout -b test-master
> Switched to a new branch 'test-master'
> git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
> Patch applied successfully:
> 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
> Running clang-format
> Diff written to clang-format-fixes.diff
> git checkout master
> Switched to branch 'master
> 
> Lukas, could you check if this script works on your system as expected?
> 
> Also Aditya, I think the latest clang-format-diff goes by the name
> 'clang-format-diff-8' on debian based systems. While in my arch based one
> it goes by 'clang-format-diff.py'. Can you verify whether the script works
> directly or is the executable path flag needed?
> 

For debian based system, the user will have to add
--clang-format-diff="/usr/bin/clang-format-diff-8".

A few more improvements can be made. For eg., the script should exit
if the patch isn't applying. Currently, it continues a step further
and stops after giving error: "Error: This script requires
clang-format-diff to be installed.".
Also, this puts the git status in mid of git am, which needs to be reset.

Maybe we can improve the error message by displaying them about
"--clang-format-diff" option and giving install options in the error
message. This should make the script easier to be used.

One more improvement I guess we can make with the .diff file, by
renaming .diff after patchfile name. This way it won't be overwritten
each time and also be in consistency with checkpatch.pl --fix.

I'll try to make these improvements and send a PR or a patch to you,
where we can discuss any changes.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

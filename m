Return-Path: <SRS0=xLm4=FU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737DDC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 16:29:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0572A233E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 16:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0572A233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A42EC864C1;
	Wed, 16 Dec 2020 16:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOaqnItnAx78; Wed, 16 Dec 2020 16:29:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C67786100;
	Wed, 16 Dec 2020 16:29:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51652C088E;
	Wed, 16 Dec 2020 16:29:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D95A0C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 16:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C8F5385540
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 16:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDvL_s3xncdk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 16:29:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A6A5A84C16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 16:29:22 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id 4so13219173plk.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9KQjhWTzV69sYV1k35QgECxKLxL4S76NvuRS5EN8l5A=;
 b=d63uqV1tkHp/dg1+cQpmdSrWhC5QhXsTBHuO0mxxN9U9G6QAONc/4B/YqRW0ohthRI
 ePTg5Y20hRGfvHBJy/1n5BYsUc2jW/ai5xc90cGWGIi1Z/+N8tGY38zFgHew/ak+pTwz
 A++WI+VXazTfM5mQKaq5GZ/bAlyk4LQIHuZxxqeXRmx5wAcQhny8EgniV2d/KaNRcRoC
 3I08SS3WsNoCbQ2YRdUPhva23rrtjh5npcPkFyZEtjAWEKnsG/LzY9edDQZPdaKWPoNd
 NrKqyC2V8pfyS6mW1kgxUhTISryS9Y2eopgGVQ5H5AT7NHoyvGyUXCcjQAhI3QOkoFeh
 0xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9KQjhWTzV69sYV1k35QgECxKLxL4S76NvuRS5EN8l5A=;
 b=R5UKyEt/rvUiCWpt4RoNq08A1vyJOeaFNzjtG2l9Akbep9cBr+kt0adoVohLe852mq
 bLGAYPuA1CS7WGIYWU5M3MRUa1N9Mi4itSBLUG1m3q4fV4popQ7D3iB0nFnGoUUxdDbT
 I9eye8MwFLLcRRe9ETKjsKfGn9iHqfcSsooOfKwkmOP/1IgtCRKRBWba62KFvuFDNqwY
 681lXsJmobG+g55yLy5owiBxsxHqibmiNpiBO1ndjO+7KnQogDUfEZCrVrdXgm4sgbdj
 DxqgLTxBTQ0PqlM3bpBkr+UNSuHU2g4yCw9ms5IUQVlxrCJ5jwv0tK60es+WoiAAdnHb
 +csA==
X-Gm-Message-State: AOAM531S0EK5fo8hTYFZMGguXlddZTqeaNP1pezLQUUMxgjfzrkVYSrW
 1nuJvv4Wsyz3ZPXvXYuBcx33oKbZ2QUAxQ==
X-Google-Smtp-Source: ABdhPJxuRPN4yklcshYW8uRKVImKuz0p+wUYYS//NwcLbDaa3WS4MvPglJMo/NouyBMdJpfAqHXU8Q==
X-Received: by 2002:a17:90a:ad7:: with SMTP id
 r23mr3635302pje.149.1608136161882; 
 Wed, 16 Dec 2020 08:29:21 -0800 (PST)
Received: from ?IPv6:2402:3a80:416:5db1:d400:1940:d60a:6bcd?
 ([2402:3a80:416:5db1:d400:1940:d60a:6bcd])
 by smtp.gmail.com with ESMTPSA id a136sm3246721pfd.149.2020.12.16.08.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:29:21 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201216123121.16466-1-yashsri421@gmail.com>
 <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
 <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
 <CAKXUXMwo-xeYb9mHFXKN8j6BU9X7iNe68pkJ+zdGay7p+KxK7w@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <a0629979-751c-711b-47c5-6cdf7d4b869a@gmail.com>
Date: Wed, 16 Dec 2020 21:59:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwo-xeYb9mHFXKN8j6BU9X7iNe68pkJ+zdGay7p+KxK7w@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
 for COMMIT_LOG_LONG_LINE with URLs
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

On 16/12/20 6:27 pm, Lukas Bulwahn wrote:
> On Wed, Dec 16, 2020 at 1:54 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 16/12/20 6:05 pm, Lukas Bulwahn wrote:
>>> On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently checkpatch warns for long line in commit messages even for
>>>> URL lines.
>>>>
>>>> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
>>>> this class, around 790 are due to the line containing link.
>>>>
>>>> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
>>>> Consolidate how dtexts and dvalues are freed") reports this warning:
>>>>
>>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
>>>>
>>>> Avoid giving users warning for character limit, instead suggest them to
>>>> prefix the URLs with "Link:"
>>>>
>>>
>>> Looks good to me. This might be also a good one for a fix option.
>>>
>>
>> I agree. Should I add the fix in this patch itself?
>>
> 
> No, make two patches and send them as a patch series to the mailing list.
> 
Hi Lukas
So, I generated a list of lines, which are URLs and reported by
COMMIT_LOG_LONG_LINE here:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/links/long_line_links.txt

These occur in different forms:

1) A large part of these occur as \s*(http|https).

2) These also occur as [1]: https, [2]: https, etc

3) BugLink: https:// (e.g.: BugLink:
http://lkml.kernel.org/r/20180426045223.GA15307@dragonet.kaist.ac.kr)

4) References: https:// (e.g.: References:
http://mid.mail-archive.com/alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi)

5) Link to v1: (E.g.: Link to v1:
https://patchwork.freedesktop.org/patch/msgid/20190228210939.83386-6-sean@poorly.run)

6) Datasheet (e.g.
Datasheet:http://www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf)

7) URL enclosed within brackets (E.g.:
(https://syzkaller.appspot.com/bug?id=ad7e0351fbc90535558514a71cd3edc11681997a).)

8) Link within sentences (E.g.: suite can be found at
https://github.com/Cyan4973/xxHash/blob/cf46e0c/xxhsum.c#L664)

etc.

Among these I guess we can fix occurrences like 1st by prefixing with
"Link:". But I am not sure about the rest.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B52C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 11:12:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD562389B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 11:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD562389B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91B9E873FC;
	Thu, 17 Dec 2020 11:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrV6U2opLIym; Thu, 17 Dec 2020 11:12:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 51F218777A;
	Thu, 17 Dec 2020 11:12:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46E8EC0893;
	Thu, 17 Dec 2020 11:12:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79BA8C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6687C87851
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKLmWs+77js0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:12:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC06387842
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 11:12:01 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id c12so18799296pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 03:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HMKlYnCBFTbjEG7mJ1XblOdxiu2tgv8kiHqezh3WtiE=;
 b=nhvXuYsyS2W5hRMchYe5AippnEAWG9Ilt0dnCcn01uO1gJp8jZsGssZkaLf46Rnz6b
 /TfHSCyoMP6OAKtOhFjMKwkGAI1hU9xAUST+P2QgneFrr3Z37whBWfu/d396rUf7kpj+
 9isGeBsRoBVgYqjGsNNXKqeOztEb20RlNM8BHPp/2G5iyVV/RtG23Z3GdY/PvdItEYyz
 unr8Z/Dq2k2LE1TbE0noStZuyiycTU8B4g14qpz/eKGAfkXQ/yQXBKdz/gBNK/dPtEzD
 0T3lMwY4cDAoKV7x7j0hkE+vkkxw6+O2Vqe/1kZ+qSkp/lYL1N7bpJqwY95luuWDvr18
 kgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HMKlYnCBFTbjEG7mJ1XblOdxiu2tgv8kiHqezh3WtiE=;
 b=PolNUACotw8BzGnK+GcWxDiKjmTmENEIzAv3gizzgBsYZq7k1TAcOwYUhSYZcbNIPm
 5i9CmLVdlfUbsSJCfJqqM5yu8kYa2qmS9RoIcAyizjcmwGC2qXhdu+q3Ry+Vf3+BaWxy
 TnELqBT/GetphGIdkmJHC6tIn00jSaolxxZqeCpB9sR0ClL5Ojfhw0QIzFwb+z/wr6fT
 GORnl3xfgdofIoyAb1iEkwL8oNEhCPo6ats3qPgl6tTM0zU/Q7t5L/2ruLNq3p+OaZ0A
 g/rFYaus85U63+KidQ7nxOuPAX912/TTgKGEHmwoWW4wsp0WfBA/hOg3k8hsJtC2plch
 eRNA==
X-Gm-Message-State: AOAM532Vwofvkrrqul/sA+0gDuzZ9ve9kw/ODFLNe5E2jBotJfu7d53f
 nz/Y2NowrIUi4b/6PvTk3BPt6giLRQAQEA==
X-Google-Smtp-Source: ABdhPJzf52Cg7kKWZ6T8nJSmG3qCSuXZVpLNUqlI84J7vw1i3AKh4trosbbU2NWztswsH4S13+pz/A==
X-Received: by 2002:a63:f745:: with SMTP id f5mr37275492pgk.119.1608203520919; 
 Thu, 17 Dec 2020 03:12:00 -0800 (PST)
Received: from ?IPv6:2402:3a80:403:493:5d38:be:6298:62ae?
 ([2402:3a80:403:493:5d38:be:6298:62ae])
 by smtp.gmail.com with ESMTPSA id 193sm5701350pfz.36.2020.12.17.03.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 03:12:00 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201216123121.16466-1-yashsri421@gmail.com>
 <CAKXUXMx+Jogibwf_WbC7RQ0jD2+uU=XvpF4JxSWtz+3C_bRWSg@mail.gmail.com>
 <53238abd-2fdc-e9fb-bef5-4b583ccb14e2@gmail.com>
 <CAKXUXMwo-xeYb9mHFXKN8j6BU9X7iNe68pkJ+zdGay7p+KxK7w@mail.gmail.com>
 <a0629979-751c-711b-47c5-6cdf7d4b869a@gmail.com>
Message-ID: <6c6d56a3-134d-acc4-a126-c42a02652dfc@gmail.com>
Date: Thu, 17 Dec 2020 16:41:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a0629979-751c-711b-47c5-6cdf7d4b869a@gmail.com>
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

On 16/12/20 9:59 pm, Aditya wrote:
> On 16/12/20 6:27 pm, Lukas Bulwahn wrote:
>> On Wed, Dec 16, 2020 at 1:54 PM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> On 16/12/20 6:05 pm, Lukas Bulwahn wrote:
>>>> On Wed, Dec 16, 2020 at 1:32 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>>
>>>>> Currently checkpatch warns for long line in commit messages even for
>>>>> URL lines.
>>>>>
>>>>> An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
>>>>> this class, around 790 are due to the line containing link.
>>>>>
>>>>> E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
>>>>> Consolidate how dtexts and dvalues are freed") reports this warning:
>>>>>
>>>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html
>>>>>
>>>>> Avoid giving users warning for character limit, instead suggest them to
>>>>> prefix the URLs with "Link:"
>>>>>
>>>>
>>>> Looks good to me. This might be also a good one for a fix option.
>>>>
>>>
>>> I agree. Should I add the fix in this patch itself?
>>>
>>
>> No, make two patches and send them as a patch series to the mailing list.
>>
> Hi Lukas
> So, I generated a list of lines, which are URLs and reported by
> COMMIT_LOG_LONG_LINE here:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/links/long_line_links.txt
> 
> These occur in different forms:
> 
> 1) A large part of these occur as \s*(http|https).
> 
> 2) These also occur as [1]: https, [2]: https, etc
> 
> 3) BugLink: https:// (e.g.: BugLink:
> http://lkml.kernel.org/r/20180426045223.GA15307@dragonet.kaist.ac.kr)
> 
> 4) References: https:// (e.g.: References:
> http://mid.mail-archive.com/alpine.DEB.2.20.1905262211270.24390@whs-18.cs.helsinki.fi)
> 
> 5) Link to v1: (E.g.: Link to v1:
> https://patchwork.freedesktop.org/patch/msgid/20190228210939.83386-6-sean@poorly.run)
> 
> 6) Datasheet (e.g.
> Datasheet:http://www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf)
> 
> 7) URL enclosed within brackets (E.g.:
> (https://syzkaller.appspot.com/bug?id=ad7e0351fbc90535558514a71cd3edc11681997a).)
> 
> 8) Link within sentences (E.g.: suite can be found at
> https://github.com/Cyan4973/xxHash/blob/cf46e0c/xxhsum.c#L664)
> 
> etc.
> 
> Among these I guess we can fix occurrences like 1st by prefixing with
> "Link:". But I am not sure about the rest.
> 
> What do you think?
> 

I think we can only fix the lines with ^\s*(http|https|ftp) and should
just give warning for the others. The user can then decide how they
want to fix.

Or should we give warning also for ^\s*(http|https|ftp) only?

I guess we can send this patch to Joe and see what he thinks. This
might give us a better idea for the fix.

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

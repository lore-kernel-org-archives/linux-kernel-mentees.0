Return-Path: <SRS0=9dud=GV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C2EC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 18:42:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6E8F2225E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 18:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6E8F2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A74186D11;
	Mon, 18 Jan 2021 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVFsbidq3Xje; Mon, 18 Jan 2021 18:42:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BDF5986C0A;
	Mon, 18 Jan 2021 18:42:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B39B9C088B;
	Mon, 18 Jan 2021 18:42:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4736FC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 18:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35AC386C0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 18:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0a7lsGIbSPOb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 18:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1C3286C94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 18:42:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q131so348812pfq.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o+lvQjtbGTCTbyXXv+hO5rO2Pvd5n4l3136fY+ovWXQ=;
 b=vX83tkSDrnnTiePs5twPulNtcCGC4WSYkV+GsZIFkb7JnhYhzuaxJjvx1aBrY/8dv2
 KaFZJq6LbtvxF4raIadThU6GsYUcnafaYf07TEZJkWprMrzaQOqbx+r7mloHVwgR8mAy
 VgzFAcIT0o124jt9Jb+iB/YalDbmgTWVRrviXs4mKHUCq0h8Fz4Ttqgm3gBI20OMql7R
 HPq/gWwtFnP7zlm1ctXA32ZQfmwJKB6YY9TGgSwieCKkIGjzfYwWNdw6r+MnsSCEccQc
 XBzltwdOzlTFBGibwpW/d6WjWK/En+lNQSMMMlRmX+4BgMf1UX7UmqlPXxV0CqOU5OVf
 uxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o+lvQjtbGTCTbyXXv+hO5rO2Pvd5n4l3136fY+ovWXQ=;
 b=QHlMOy9P5j4yVWWdl5t180ZCpBjTgJZRC73OvtY974x3VtGAACWCbZ6SwDkdpYa3Vj
 Uibl9DTmbZLnn51aNZDoKvZqrMmPKTHtCCZMMfGnC8UKPkWgKSrz1REcYfz2+VMh67PF
 UnK/P5dIhmRD4tX9lmQn+wtAMlNOeSmSCZ9bPR6dzJV4Cye2FgxUaO5TtzAWiUDJr16/
 fqscs5fi8wuTa53GyQWAIw5QbU3RWN+OTU6tPylE/lTlkb0c4d1G3W6IUFueYtxdyyT+
 HpY3bQeG4Pci6Qq64o8ReAKABlzqcRCJytOIFMIRC3mtztTjtfEgfKltRbugUeIzz4Ox
 kCCA==
X-Gm-Message-State: AOAM532qjFozO+AU2qY8RNAg65u/3K1VrxR/kWC8oiTWWxR+Yws1HsXn
 DQyCJLsd8D7BngA8OXGtjG9XEzKHCS0Eww==
X-Google-Smtp-Source: ABdhPJxrX3oLixaDWJrcahi2BzTpBWeR06K8DGzaI4FDa7INgWpMppnhM6rsBDjc4AJSsRPNYey1Jw==
X-Received: by 2002:aa7:8a99:0:b029:1a6:c8b8:1414 with SMTP id
 a25-20020aa78a990000b02901a6c8b81414mr820676pfc.66.1610995335893; 
 Mon, 18 Jan 2021 10:42:15 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:2812:4fd3:d673:ac9b?
 ([2405:201:600d:a089:2812:4fd3:d673:ac9b])
 by smtp.gmail.com with ESMTPSA id e4sm16576195pfh.206.2021.01.18.10.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 10:42:15 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMxA=QrANbxudRZPp90Ox7JqjSt_QNek2=xbUuypA527aA@mail.gmail.com>
 <20210118144410.19217-1-yashsri421@gmail.com>
 <CAKXUXMziorqP-M6P3dtT1sEPRmVyrJiY96-0p=+p7noF=4DTwg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <9000f3ce-0ac2-cc8c-48f8-31ffaac8bd6d@gmail.com>
Date: Tue, 19 Jan 2021 00:12:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMziorqP-M6P3dtT1sEPRmVyrJiY96-0p=+p7noF=4DTwg@mail.gmail.com>
Content-Language: en-US
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 18/1/21 10:54 pm, Lukas Bulwahn wrote:
> On Mon, Jan 18, 2021 at 3:44 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Local symbols prefixed with '.L' do not emit symbol table entries, as
>> they have special meaning for the assembler.
>>
>> '.L' prefixed symbols can be used within a code region, but should be
>> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>>
>> Add a new check to emit warning on finding the usage of '.L' symbols
> 
> to emit a warning
> 

Okay

>> in '.S' files, if it lies within SYM_*_START/END annotation pair.
>>
>> Suggested-by: Mark Brown <bro...@kernel.org>
> 
> Hmm, that is not an email?
> 

Oops, I'll fix it.

> Did you test running it on the patch that introduced the bug initially
> which then led to the overall discussion I pointed out to you?
> 

Hi Lukas
So, the patch led to the initial discussion was probably this:
https://groups.google.com/g/clang-built-linux/c/1C6YoJKBsQQ/m/a8IS1NjGAgAJ

This patch is related to changes made in tools/objtool. So, we
probably cannot test this patch for AVOID_L_PREFIX warning.

I'll walk you through the discussion:

Because of the above changes in objtool, [PATCH] x86/entry: use
STB_GLOBAL for register restoring thunk was proposed
(https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/qWnKkZWFBgAJ)

It was later decided that the changes can be instead made to .L prefix
local symbols here for avoiding the objtool warning:
https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/MtjkJK6LCgAJ

And for standardizing this practice, the suggestion for checkpatch
rule was made here:
https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/4staOlf-CgAJ

However, I have tested the patch on arch/x86/ files and also the patch
proposed here fixing for one of those files.

As expected, I got no warnings for the patch fixing the warnings for
thunk_64.S file, and some warnings for files where the prefix was used.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

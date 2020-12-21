Return-Path: <SRS0=69VX=FZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0FDC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 15:29:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520E322C7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520E322C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA03486B26;
	Mon, 21 Dec 2020 15:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwdL5PsXuQcx; Mon, 21 Dec 2020 15:29:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DD2086B12;
	Mon, 21 Dec 2020 15:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90471C1825;
	Mon, 21 Dec 2020 15:29:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD777C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B96A085784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvLLJU3AyjGg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:29:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 09A8285629
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 15:29:21 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id s21so6609728pfu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 07:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5BiS1XVPZWv2tKiT6XjqGf79fQtDxWBJYi6rgqKs9TQ=;
 b=m3QWc3BgfvdGeOFsu2LunMwAVjgbtnulZLTKkS6hWmFgPsyzz2FaamVYNQVgDMDS77
 KKelnkM9U7SWD6QOtmoD6KRu8Bg1yh6q8FH1brTQwf9BacyiVbHW3XGHdndgXxmvpj5E
 YW+uPF5KDOjmdzc27zNGTG8rCnudRUM0janbuzhZ58f6ND4frTX+TdDKGPqOCmrDfztT
 y8Fc88FHrCxvfrARK+L3RGhC3gwdVvNDooHfvHY88ouXdE7DlElJq2MUOLC8P55ct8Jb
 Z7y0RYDO6DhDonYajodjDDcls77gLHpZs7nm+mOQ2Oa/tVmEZ6zHOBH6ma3VOOq6XUFJ
 YEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5BiS1XVPZWv2tKiT6XjqGf79fQtDxWBJYi6rgqKs9TQ=;
 b=niX0XRkZPwXfi6NTux+xoD8oaQOl1u4uZYJf4GY0hZKPOyYJA+Rg1XK9BLpSf2epxe
 9zJQWt5STpV2203tjqssYosWUFnUnbCZ3Ue3iFd278CJgfej/Ad9tQVDDe/NXBkLbQXJ
 GY4P1WPe5hyMvR92UGL/+rSy0ULIpeRcbY6IoOJtfARC+rRliuXYiQ78u7idEfy41JyV
 egqv2qR69TXrqseUrHkT/9lKJ5EWIHSmJUq25tzUYUeKk5vfxOZoiml4z3wXsZPg9S8X
 3azY+WPC7m0bWGFZUNFnwO7tRAEmN2ceuaMbUhfd9eelaVS/6hcDOKNni5LVQPSoXY6p
 sYWg==
X-Gm-Message-State: AOAM533ObDZQQKxs7B1/kx/BABjjCnD0dW9TmOoXUlO/tm3RnSgIVqQU
 mD66chpSLPGnGmmhG+jOQHa5L/k0w8OucQ==
X-Google-Smtp-Source: ABdhPJyAYMYEeZ5+lPC6gTcsYnmfh2tm+k2p1P6uNwtfhhK9rWXr6L0CqXC3QejFTnBB03k4SLuV3w==
X-Received: by 2002:a63:d141:: with SMTP id c1mr1273129pgj.75.1608564560180;
 Mon, 21 Dec 2020 07:29:20 -0800 (PST)
Received: from ?IPv6:2402:3a80:42f:3f7e:6d48:4aab:936e:50bb?
 ([2402:3a80:42f:3f7e:6d48:4aab:936e:50bb])
 by smtp.gmail.com with ESMTPSA id cu4sm16428966pjb.18.2020.12.21.07.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 07:29:19 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
 <20201220183307.8744-1-yashsri421@gmail.com>
 <CAKXUXMw-AtthCG9y4_wYBKaF36BbxFmdHfzPi7FS+fSJqaK+3Q@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b36da61d-fa2d-0ae1-1408-d89710162e56@gmail.com>
Date: Mon, 21 Dec 2020 20:59:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMw-AtthCG9y4_wYBKaF36BbxFmdHfzPi7FS+fSJqaK+3Q@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: ignore files not
 following NETWORKING_BLOCK_COMMENT_STYLE
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

On 21/12/20 10:57 am, Lukas Bulwahn wrote:
> On Sun, Dec 20, 2020 at 7:33 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch.pl gives warning for NETWORKING_BLOCK_COMMENT_STYLE
>> for files in net/ and drivers/net which do not follow the networking
>> comment style.
>> But some of these files seem to follow the generic comment style instead
>> of networking style and some rather mixed style of comment.
>>
>> For e.g., drivers/net/wireless/ralink/rt2x00 largely follows generic
>> kernel comment style in spite of being inside drivers/net.
>>
>> Provide an ignore file(".networking_block_comment_styles.ignore"), where
>> users can add the files they want to ignore this warning.
>>
> 
> I believe that is a really bad design decision here.
> 
> Imagine that in one directory, the maintainer wants to adjust ten
> rules for checkpatch.
> 
> Are we going to implement this logic for those ten rules individually?

No, only the files which are not following the networking comment
style, and are inside net/ or drivers/net should be added. The files
which are following the networking style already, need not add
themselves anywhere.

I feel, normally maintainer will want entire directory to follow the
same style. So, they can just add their directory in the .ignore file
and it will be ignored from the warning.

> Is the maintainer going to add
> 
> None of that is obviously acceptable: 1. because there are better
> design decisions; 2. because tailoring checkpatch would simply not be
> worth the cost of having all those individual files laying around in
> the repository and the complication throughout the whole script.
> 

We have earlier used a similar approach with ".get_maintainer.ignore",
where the users add their signature to be ignored from being mentioned
by "get_maintainers.pl" script.
Link: https://lore.kernel.org/patchwork/patch/939769/

We just need one file for our purpose (i.e., not necessarily .ignore
file).
Here I have used .ignore file in the root directory, so that it is
easier for the maintainer to edit it and add their directory in it.

If not in the root directory(as the files look scattered), perhaps we
can place it in script directory as .ignore or .txt file, or maybe
just place these directories in the form of a hash in the script
itself. But perhaps we'll need a list of directories to ignore and
then we'll be able to form the hash.

> Also, you already recognized that there is already a feature to ignore
> or select rules through command-line parameters.
> 
> So, how about coming up with a proper .checkpatch config file format
> and then use the already available feature to configure the checkpatch
> run?
> 

The user can add "--ignore NETWORKING_BLOCK_COMMENT_STYLE" line in
their .checkpatch.conf file, and checkpatch will then ignore this
class of warning.

Somewhat similar to this repository here:
https://github.com/openil/u-boot/blob/master/.checkpatch.conf

But this file(".checkpatch.conf") is ignored by git and is not
committed (as different users may require different configurations).
So every user will have to add this line in their individual config files.

Also, if the user starts working on a different file, where the
networking comment style is followed, he will again have to delete
this configuration line from the config file, to get this warning.

I'm not sure, if we can add directory/file specific configuration in
.checkpatch.conf. But again, if it was possible, we'll be specifying
individual files, and telling them to be avoided, similar to the
current approach.

Using any of these solution, if the users ignore this warning, we can
perhaps add a fix for NETWORKING_BLOCK_COMMENT_STYLE warning.

What do you think?

Thanks
Aditya

> Lukas
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

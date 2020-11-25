Return-Path: <SRS0=yuUc=E7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A59C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 07:02:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FFB206E5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 07:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYBxP8zI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94FFB206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 447218679E;
	Wed, 25 Nov 2020 07:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Y1odeOsWtCY; Wed, 25 Nov 2020 07:02:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B038786521;
	Wed, 25 Nov 2020 07:02:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99354C163C;
	Wed, 25 Nov 2020 07:02:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F3B1C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 16196873CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyDcAPe46tgR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D719D873BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 07:02:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w16so1556010pga.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 23:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5aR9BTlbY7Pc5ipT6rOEXrTf0g3fePIKz5BtikqqXl0=;
 b=EYBxP8zIYtCJF6PCRGUvUWhHqrr2DXg2Vtrpw/mkiPHf3ALmPs9/6V67XLTeHnSk5u
 ha0j90jryXUE2VJmx7O5mQGrsobsg7JgAImeRnLhORQemo3FhFqKlMZ4/lJANmSxoXDO
 HZXfOXxqckW5m5B/x511RQ8WP6y8Cd9lp/C3AvPS0HpfOyi5bd8aY1bAWuiZjacTSOlE
 Wj+htJCVLI5WELOQ0D4HlPWb0gcJ0o3x6ep1DwJ1wAbZwF12gvyyZi6dKgEOPaDZdwDD
 492utElLH64E3xSnnlrmLvn22vozGe44W+dUzbDBLKU0WyQIRbhq5eLJfT0lNKhHPRDG
 T0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5aR9BTlbY7Pc5ipT6rOEXrTf0g3fePIKz5BtikqqXl0=;
 b=rgIUbpsYsH7rV+LatgszVH4bfb4BzrkSVkzCMfa/F2S09d0gMM2gi/s+BcbtO+4Fbh
 V8N/mCPlOXzLz9JMoUeUM9Enb8RQ8QRKwuM47mou8f9cSTavahfe2HC8e6nG+KVfXHvT
 5bPGVhxGWbq7fAK1uRAYWiddr+UoM/bbM1ytdNiSOhMl/04WY7Y4zM9CDxWaM0B1Si7c
 L8uMYSym3XZkBKN/87co0sbG+KmcAU0e9tr1YtsAceulikmpfx2Xwj5Cf+7lN6fX49Ft
 q/yXO6IFE4eK8klFQgfHUm9i2Y22yaO5Rw6okuHl4BqILibdNUV+PZS65JEJmVoqb7YL
 v/tA==
X-Gm-Message-State: AOAM533v4Yo8nYuLDqQgHRD6GXT4jjeXt9yothH9IMFNt8ej+gZE8Yij
 lV2QJmtqxzbIqd1VW3Yry9Mw69UJOJ2qKQ==
X-Google-Smtp-Source: ABdhPJyHQOfNTekzv9EZHIJ2BpP8OUHmHn3ydO+LCF48ZCD+q4/R65r21Lt6SI9LdcTgYd5CIx1pRQ==
X-Received: by 2002:a17:90a:e018:: with SMTP id
 u24mr2483135pjy.189.1606287768987; 
 Tue, 24 Nov 2020 23:02:48 -0800 (PST)
Received: from ?IPv6:2402:3a80:420:7007:58b5:e884:d92a:b961?
 ([2402:3a80:420:7007:58b5:e884:d92a:b961])
 by smtp.gmail.com with ESMTPSA id x3sm1368827pjk.17.2020.11.24.23.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 23:02:48 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
 <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b2d1808d-1657-67c8-507e-b317b1ad86e8@gmail.com>
Date: Wed, 25 Nov 2020 12:32:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
 for NETWORKING_BLOCK_COMMENT_STYLE
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

On 22/11/20 12:22 pm, Lukas Bulwahn wrote:
> On Thu, Nov 19, 2020 at 11:44 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
>>> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
>>> wrote:
>>>
>>>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
>>>> if we use an empty '/*' line for comment and contents of comments are
>>>> in next line
>>>>
>>>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
>>>> the refs / unrefs from the transport") reports this warning:
>>>>
>>>> WARNING: networking block comments don't use an empty /* line, use /*
>>>> Comment...
>>>> +               /*
>>>> +                * If the TXQ is active, then set the timer, if not,
>>>>
>>>> Provide a fix by appending the current line contents to previous line
>>>> and removing the current line
>>>>
>>>
>>> Patch generally looks good.
>>>
>>> Can you check how many comments in net actually follow that style and how
>>> many follow another style?
>>>
>>>
>>
>> In drivers/net:
>> Wrong style: 14695 lines
>> Correct style: 147961 lines (ie around 10 times)
>>
>> In net/:
>> Wrong style: 5090 lines
>> Correct style: 30485 lines
>>
> 
> Can you find out where the wrong style is used?
> 
> Maybe the documentation is a bit outdated.
> 
> For example, some drivers and some subdirectories might have settled
> for another commenting style.
> 
> I guess you can submit the fix option, but it could be that the whole
> rule/feature is broken anyway... so I do not know if that fix is of
> any good...
> 
> I think it is better to actually understand, document and encode the
> current rule that applies.
> 
> Can you provide an evaluation where the different styles for
> commenting are aggregated in a good way?
> E.g., consistently within a file with style XYZ; mixed style but
> 80-90% are of style ABC; consistent within a directory.
> 
> If you think some cases are in the wrong style for some specific
> files, simply send a patch correcting the commenting style and see.
>
Hi Lukas
I have generated the reports regarding the comments used in various
files at net/ and drivers/net.
Directory wise reports:

net/:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative.txt

drivers/net:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative.txt

File wise reports:

net/:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_file.txt

drivers/net:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_file.txt

Some files in 'net/' follow the accepted syntax, such as:
'net/batman-adv => 985    0'.

However, some completely not, such as:
'net/ax25 => 0    103'.

Some even follow mixed syntax such as:
'net/netfilter => 87    125'.

Similarly for drivers/net:
drivers/net/ethernet/mellanox/mlxsw => 1071    0
completely follow accepted syntax.

drivers/net/wireless/ralink/rt2x00 => 98, 2082
follow unaccepted syntax largely.

whereas files such as drivers/net/wireless/ath/ath5k => 304, 486
follow mixed syntax.

It seems to me as the documentation might be outdated, as you had also
suggested earlier, or maybe users are unaware of the documentation and
 just use the syntax for conserving consistency of the code.

What do you think?

Thanks
Aditya

> Lukas
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

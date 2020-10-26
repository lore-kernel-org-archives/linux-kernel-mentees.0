Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26C4C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 20:04:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E442E21707
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 20:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCbPvTGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E442E21707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75D3B85F3A;
	Mon, 26 Oct 2020 20:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dfc4KiaXMh9; Mon, 26 Oct 2020 20:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8853F85C54;
	Mon, 26 Oct 2020 20:04:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E803C088B;
	Mon, 26 Oct 2020 20:04:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85DE9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 20:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6DE0D870C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 20:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krtWnxVdJ-dC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 20:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 96F47870B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 20:04:54 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id b3so3468337pfo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D+qAODmf0yCQA13VTzPA3xwkvxItwT0en+RLhmwbxgU=;
 b=XCbPvTGG17EOYmPGc29jyLReqWXK/LsA1CkpQDDsfC40mMHvX4T5WI/LxPGh26h8LV
 dLRScwCm0crTIsqWJbTwf7ztu5HTli3P1EUj4+KKDYcg6ddKs6iOASYCJ6f/cSF5qBgb
 cebp1nBs2EUjEKwh1Qb3ZPKKJ5smuek7kPvuQ3ThRt49zDhR9MgI8YU4BiYfv8UY1ZN0
 9+4uiJ8j33xtNbsP+MbKoAUmKyw47xZTZ8p6wCrVqqLGg1qBLCjmS8IZAdj8yeRArmnU
 AT4fKS8JABHpj0ogZRZOiX73I8QvY4balRFE5etfE+RPhEcX1F40UaH5DnfeoxOQN6Ay
 Kp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D+qAODmf0yCQA13VTzPA3xwkvxItwT0en+RLhmwbxgU=;
 b=YbycKbgEzbTElIDuXwgUtvlP2bTCZ/rWkTX6gjworC9Z5pmxfaHiBjG+kCaSva7Ats
 9EvYLWwAG01O325EPLAe1B1chseAcxMPRkX9m2RPG+PAaoXbFHS1kzqAd1GxEzwTrn8J
 +J9EXz9T1wjGe+Q8FpBvAUACoYbzpsGTmnOmUWJKGy8sJj8pDbyoYrmw/2GE29MexntO
 ncY9GuRQOwWGwKLxd+gZ0M9c/dAolXThLxwrkVjiXLMkHZHYxD1wAj/ichV9C6xvzbtE
 cGma+KiD+X3rb/rvN2ZtalwKh6NlfHu+tQnSNuLaufXOcarHvrxSvLs9SCH4Frnks3+a
 JHrg==
X-Gm-Message-State: AOAM5339+/WhXNTMXPbTm7gC+0cjPV6qz4hif+FEOURLh8XX4zeQrDJc
 0YdqVV8qoKA66NYLBAvzIMMz6lLnlII3PA==
X-Google-Smtp-Source: ABdhPJzHP/w9/sBsoqKYslssVPD9M3/AsaUyGrGTid80Qjep6pWhYRjO7mVB6CWUNN4FvNr9dTUU7A==
X-Received: by 2002:a63:1c4e:: with SMTP id c14mr17618170pgm.98.1603742693807; 
 Mon, 26 Oct 2020 13:04:53 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41b:1338:a441:98ff:af70:2672?
 ([2402:3a80:41b:1338:a441:98ff:af70:2672])
 by smtp.gmail.com with ESMTPSA id x198sm3575295pfd.187.2020.10.26.13.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 13:04:53 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
 <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
Message-ID: <f6539e89-bb5f-d706-99e2-1f8577889cdc@gmail.com>
Date: Tue, 27 Oct 2020 01:34:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Mentee Proposal Feedback
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

On 26/10/20 11:31 pm, Aditya wrote:
> On 26/10/20 10:19 pm, Lukas Bulwahn wrote:
>> On Mon, Oct 26, 2020 at 10:11 AM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> Hi Sir
>>> I have made a proposal based on your suggestion for interactive
>>> checkpatch.pl. Do I need to add more than one task in it? Actually, it
>>> was exceeding the 1.5 page limit as you mentioned so I decided to ask
>>> and get a feedback on this.
>>>
>>> Link of proposal:
>>> https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing
>>>
>>
>> I added comments in the Google Doc.
>>
>> We further would need to determine if you are applicable or not from
>> the terms and conditions of the program.
>>
>> Also, we would need to identify which work you can realistically
>> commit to. If you want we can clarify these points in a quick video
>> chat.
>>
>>
>> Best regards,
>>
>> Lukas
>>
> 
> Sure Sir. I'm free right now.
> 
> Thanks
> Aditya
> 

Hi Sir

Thanks a lot for your feedback. I'll fix my proposal by tomorrow.

Kindly provide me some time tomorrow(27th October), for the video
call, as per your free time. As it is already past 1AM here, I may not
be able to deliver my best currently.

Thank You
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B1C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9E0222C8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ut3YbS4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9E0222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30F0985B3D;
	Mon, 26 Oct 2020 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2ggiSqWn2YB; Mon, 26 Oct 2020 18:01:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5DCD859F4;
	Mon, 26 Oct 2020 18:01:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C7B4C088B;
	Mon, 26 Oct 2020 18:01:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67621C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 47E942E10D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlbQG+Tc2kqu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by silver.osuosl.org (Postfix) with ESMTPS id 7EB502E10C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:01:10 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id b3so3276458pfo.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uk4Qio95hSUOkZnX/89GARXpFh3oZqvUOFr2dkNX2cc=;
 b=ut3YbS4Ybtyu6s36bR/o93NsBcU2fb1FZMIDn5puJZ5T+CVKe+MWm1DdXDqSU1NwpZ
 LL+Q1wyGRBzncaqPc/QfN1XR7FJ4Ib98bb8AXyBwLOfaDovhhxH3k7MaQtH9mPAMpoqH
 kDMaddzPWVsBE5APeGj7KSeeZigwPdpt4QBlPLurughEG8XDM7iY3yQDI8B06aHaQmxL
 Z0JGAubacnDUGZyPA0DbqGYRO7MaVG6aNVhQcTFHJGk83cRBJA74V/uNciaN4gq2Yu+L
 BVbBpx64h6VH6xIRCEWym5gvm8tTVDHONsCuMvo2WdbDqjOUUWsCcV+/xVwLOE1GLbsN
 41bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uk4Qio95hSUOkZnX/89GARXpFh3oZqvUOFr2dkNX2cc=;
 b=aGpxiB2O372kDLpJj2TUe10CthUPCC1dB2STyBLH9R2NpRKltAP5Zbb7QCUBYFGXjY
 Kq5AsstOzqH/Q4Cwn3u2cIEuEYNI3XF7T3i1Jerm1MQNvRBiwegW5DhPdiaWbR/dlsKz
 PIpyrn0VPr0vTp2ax0bznAIG3bP1S71f8gIAvEV+wPdGc2yg7pCq3B9c9Uv9ETNwaai8
 veOEPAESumDCduYKm8sXh9O7CJeL5MIcId3dQLTRQ3nnc4IOZpDCnS68d0L0XW4t/Al9
 BlXphaXoPVGpaLb0m4AlsChlo2eZe8iHvod6s2J3qWhi+SVRl1dvuqIoQrDCIji9zT6B
 10Bg==
X-Gm-Message-State: AOAM530LPfUeSzMWDnpcxt326McLIuI5zeWl7vNdUP/hHQdG2iVOFFD8
 41Npio6DSl8nEF5SI2ai85Tu0br0zN9Xiw==
X-Google-Smtp-Source: ABdhPJwYZU9zgzuRJlQP1FXFpSC0vEgiNeSwVyCRvE2PsLiYF1kLR9X+S2PG5rgUBoS5u8at03q/QA==
X-Received: by 2002:aa7:8f10:0:b029:161:79ae:eace with SMTP id
 x16-20020aa78f100000b029016179aeeacemr10994669pfr.45.1603735269533; 
 Mon, 26 Oct 2020 11:01:09 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41b:1338:a441:98ff:af70:2672?
 ([2402:3a80:41b:1338:a441:98ff:af70:2672])
 by smtp.gmail.com with ESMTPSA id s22sm8445149pfu.119.2020.10.26.11.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 11:01:09 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
 <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <3180d302-0b26-3bbb-4e7a-b19037a95ff1@gmail.com>
Date: Mon, 26 Oct 2020 23:31:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzVn8qe7wOmo==r2z74X7VnhFnOpAdAUtJJcRNr==9Wog@mail.gmail.com>
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

On 26/10/20 10:19 pm, Lukas Bulwahn wrote:
> On Mon, Oct 26, 2020 at 10:11 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> Hi Sir
>> I have made a proposal based on your suggestion for interactive
>> checkpatch.pl. Do I need to add more than one task in it? Actually, it
>> was exceeding the 1.5 page limit as you mentioned so I decided to ask
>> and get a feedback on this.
>>
>> Link of proposal:
>> https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing
>>
> 
> I added comments in the Google Doc.
> 
> We further would need to determine if you are applicable or not from
> the terms and conditions of the program.
> 
> Also, we would need to identify which work you can realistically
> commit to. If you want we can clarify these points in a quick video
> chat.
> 
> 
> Best regards,
> 
> Lukas
> 

Sure Sir. I'm free right now.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

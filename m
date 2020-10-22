Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477CEC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:21:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEDB2225F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZB9/7y4e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEDB2225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8B6D87803;
	Thu, 22 Oct 2020 14:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyNEPJFqKb4S; Thu, 22 Oct 2020 14:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB651877FB;
	Thu, 22 Oct 2020 14:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5437C088B;
	Thu, 22 Oct 2020 14:21:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88191C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8435087159
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xdpp-rA4Tyk5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:21:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BC048713E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:21:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y1so1032550plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OnP2kEC2pGnAemMKHI0Z0iChzTVVq05qRRezqWLWQ4Q=;
 b=ZB9/7y4eY/nWu8vtRp2Ie/+19H/mRAVnJ1XqjhVInskU6yfM9o+JbUo1aldRTMUwW2
 /b1jqE2fZSgp41UNkmvTcIeQkDMpWBLESuDx1NWmFOfL2D1oD4L3HfVOBM6bhY+KHlOu
 NlDjnkJSGVtP6ptDzzVkyqHAPZvQ99SAkLyzNWkxrIjoUTmPbRC8v5MBrptW8hFYij8f
 j23TUh73igr3X42q4SxoSTRgcQFf8g2iPPYGrTW6JS/JRUcUJ7aXmY8enQnvhN+BKlUI
 iG2UIxbQqd9T/WtGjX/hePLoPd6bun4tzT9uHGvnY5swL41yYE4+Z4A48nWsU7lDSNeu
 7GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OnP2kEC2pGnAemMKHI0Z0iChzTVVq05qRRezqWLWQ4Q=;
 b=HtyKcc1jJFzhRtSh8NREWdY6i/OTWQpbK1rAxqsfFIhg+jQ6FlA1KHLsyJ9dM8Czba
 Kh6uTtlrxgdbW9Z7yWzT+jgvZ0DxKwGlTB2fEc/aX5OeR3vcIYDzFKmnvaiBzOwglRMJ
 prRU0vzq9XesCydAjBZYyxZfTjvLe+Gfofbz+apO4govFgjZS1aoVsN6OqCOnDgJeHPY
 QtBnWIzjLnNxa9uOqnzooWOeJqhGFDlWn4bOOg2aGcUE0p5kcubhygnjb4NwRQL5Q6gO
 zclUmd2KidU2gI2lxq4Jwwz//IEIrHoOBW80jCyow0by3A/hP8ced1WH2Q/eearb9LYa
 swNQ==
X-Gm-Message-State: AOAM531vT1pad7cVS0hiQMLoDR/OU2EBtpN7yJjBjqOVr95RfRWSqNE0
 dZh1cKHkyWwQH0vLKANf7lU=
X-Google-Smtp-Source: ABdhPJz6O/b+eigp0eJ8/gCPq+wu5AmvTX6XelGv06jMrd5pKHfA4I/U+oKDyzcZi6WJzGsrb0mSCA==
X-Received: by 2002:a17:902:6a83:b029:d5:e98f:2437 with SMTP id
 n3-20020a1709026a83b02900d5e98f2437mr2576146plk.38.1603376486312; 
 Thu, 22 Oct 2020 07:21:26 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1?
 ([2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1])
 by smtp.gmail.com with ESMTPSA id q6sm2549777pfn.10.2020.10.22.07.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 07:21:25 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <26647abf8cf14595a0dd22f10ec1c32e3dc2a8c0.camel@perches.com>
 <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
 <c4f8aae0-d805-8d09-1a87-ba64bc01c29a@gmail.com>
 <d44e35ec1d923fd09ea6530ca5d1988cc8e59347.camel@perches.com>
 <0871715a-e605-91c0-ffa5-389a313ec34d@gmail.com>
 <CAKXUXMzdjV8aPL=Paf2QJs1iWB5swxYXFJozyPi_JxJVXRArxQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <cfa48542-4654-fe62-e7fa-c7d99c6ab4f5@gmail.com>
Date: Thu, 22 Oct 2020 19:51:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMzdjV8aPL=Paf2QJs1iWB5swxYXFJozyPi_JxJVXRArxQ@mail.gmail.com>
Content-Language: en-US
Cc: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On 22/10/20 12:42 am, Lukas Bulwahn wrote:
> On Wed, Oct 21, 2020 at 8:25 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 21/10/20 11:35 pm, Joe Perches wrote:
>>> On Wed, 2020-10-21 at 23:25 +0530, Aditya wrote:
>>>> Thanks for your feedback. I ran a manual check using this approach
>>>> over v5.6..v5.8.
>>>> The negatives occurring with this approach are for the word 'be'
>>>> (Frequency 5) and 'add'(Frequency 1). For eg.
>>>>
>>>> WARNING:REPEATED_WORD: Possible repeated word: 'be'
>>>> #278: FILE: drivers/net/ethernet/intel/ice/ice_flow.c:388:
>>>> + * @seg: index of packet segment whose raw fields are to be be extracted
>>>>
>>>> WARNING:REPEATED_WORD: Possible repeated word: 'add'
>>>> #21:
>>>> Let's also add add a note about using only the l3 access without l4
>>>>
>>>> Apart from these, it works as expected. It also takes into account the
>>>> cases for multiple occurrences of hex, as you mentioned. For eg.
>>>>
>>>> WARNING:REPEATED_WORD: Possible repeated word: 'ffff'
>>>> #15:
>>> []
>>>> I'll try to combine both methods and come up with a better approach.
>>>
>>> Enjoy, but please consider:
>>>
>>> If for over 30K patches, there are just a few false positives and
>>> a few false negatives, it likely doesn't need much improvement...
>>>
>>> checkpatch works on patch contexts.
>>>
>>> It's not intended to be perfect.
>>>
>>> It's just a little tool that can help avoid some common defects.
>>>
>>>
>>
>> Alright Sir. Then, we can proceed with the method you suggested, as it
>> is more or less perfect.
>> I'll re-send the patch with modified reduced warning figure.
>>
> 
> Aditya, you can also choose to implement your solution;
> yes, it is more work for you but it also seems to function better in
> the long run.
> 
> Clearly, Joe would settle for a simpler solution, but his TODO list of
> topics to engage in and work on is also much longer...
> 
> Lukas
> 

Hi Sir
I have implemented my solution. Should I send the patch in reply to
this mail or as a different mail? Also should I label it as v2? I have
also addressed the warnings out of list command output in it. for eg.

WARNING:REPEATED_WORD: Possible repeated word: 'root'
#18:
  drwxr-xr-x. 2 root root    0 Apr 17 10:53 .

WARNING:REPEATED_WORD: Possible repeated word: 'nobody'
#28:
drwxr-xr-x 5 nobody nobody    0 Jan 25 18:08 .

Sincerely
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

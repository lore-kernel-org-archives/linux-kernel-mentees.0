Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AB6C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:25:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4B32245B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 18:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmJVk476"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4B32245B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 202928751B;
	Wed, 21 Oct 2020 18:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7Buu+-a-nDW; Wed, 21 Oct 2020 18:25:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9906B87511;
	Wed, 21 Oct 2020 18:25:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 854CFC08A1;
	Wed, 21 Oct 2020 18:25:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91E00C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 806A28713A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsElCBVwREVz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 181DB87146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 18:25:35 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y1so1643953plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oCwUPVHXmxnnY6aRxIA+8KH/dcLmV8uQmNFn9+gnWBg=;
 b=UmJVk476/O0Xg0DKRBUYzFFt771Uz8dJHtDqJllsoI2qQEeAMizzMrIl3pNa44P3dy
 eKh1tFtisfFTbqzJXroat1jTnC1CEic2THQTr83y5tcbUB1JfLlGWwIAlbcjE/rhVANc
 445NeUrU0BonSJZxuijqXT0ZXYXsay6mftSVDxyqWfSmVqeEOb/CFXdQ1gMveojHBP4S
 +I+ZwwtK6CwKwXTRUkVAAkFuyqafS45MvbG3kauaOj5Oo0z13Fv/DjH7W5FIpdhTNDBo
 s4mJVn0m0Rm5Cnzp7Cgugwy4h/Kx8m0IKOOzmY03tXT5VhX2P9m/VJATzz0xJdm0vDLX
 5Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oCwUPVHXmxnnY6aRxIA+8KH/dcLmV8uQmNFn9+gnWBg=;
 b=pgVXLp7Z4umIx5BC5PxoCIf+dPrmh7sPDj/rVwLP2FUHWDiirQNlLyZ3IX7WPlKS8w
 NDJYbuia6QIwioLW0qLbn3uDCxGQGbSbSUvOaUrKaP7qsNa2HnRH7Jz8Wm/T5QAqVIiy
 5XdX/lGZwY3M0m8dPtavsd3wmyXwNaE0cKQFCUKDNi20yhJBrF21Z8MlpWViMcXGJBOq
 eNHmNTbI8J0oaTukxQANsJ8uIBGEZuK67K9ny8mlHSIkYUPT7t2uq94o76vz95pCKOQq
 ooxSISQMsZBYHZ/s9ceCA665BPlV7rwHWAngETTSVrwuxWUwdQ7UjU0UjFlUV0HpYnhH
 LmKA==
X-Gm-Message-State: AOAM533h8SFa0mEq6bj7NRlQRn7tW3YkpnKA0YFCdGuE0YUHYfImmRcB
 dcx4ZPSNE2vhSBVoAPL6lRQ=
X-Google-Smtp-Source: ABdhPJxFuXX6DTdOw4GQKqXGhYilBNbPIWongr0A+i62lg+XkPqKelHRRp7ly1wZ1ODpGEo71umk/Q==
X-Received: by 2002:a17:90a:4481:: with SMTP id
 t1mr4642557pjg.216.1603304734524; 
 Wed, 21 Oct 2020 11:25:34 -0700 (PDT)
Received: from ?IPv6:2402:3a80:431:7ac0:8cb2:c45f:197:35d9?
 ([2402:3a80:431:7ac0:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id d8sm1586978pjc.40.2020.10.21.11.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 11:25:34 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <26647abf8cf14595a0dd22f10ec1c32e3dc2a8c0.camel@perches.com>
 <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
 <c4f8aae0-d805-8d09-1a87-ba64bc01c29a@gmail.com>
 <d44e35ec1d923fd09ea6530ca5d1988cc8e59347.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <0871715a-e605-91c0-ffa5-389a313ec34d@gmail.com>
Date: Wed, 21 Oct 2020 23:55:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d44e35ec1d923fd09ea6530ca5d1988cc8e59347.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
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

On 21/10/20 11:35 pm, Joe Perches wrote:
> On Wed, 2020-10-21 at 23:25 +0530, Aditya wrote:
>> Thanks for your feedback. I ran a manual check using this approach
>> over v5.6..v5.8.
>> The negatives occurring with this approach are for the word 'be'
>> (Frequency 5) and 'add'(Frequency 1). For eg.
>>
>> WARNING:REPEATED_WORD: Possible repeated word: 'be'
>> #278: FILE: drivers/net/ethernet/intel/ice/ice_flow.c:388:
>> + * @seg: index of packet segment whose raw fields are to be be extracted
>>
>> WARNING:REPEATED_WORD: Possible repeated word: 'add'
>> #21:
>> Let's also add add a note about using only the l3 access without l4
>>
>> Apart from these, it works as expected. It also takes into account the
>> cases for multiple occurrences of hex, as you mentioned. For eg.
>>
>> WARNING:REPEATED_WORD: Possible repeated word: 'ffff'
>> #15:
> []
>> I'll try to combine both methods and come up with a better approach.
> 
> Enjoy, but please consider:
> 
> If for over 30K patches, there are just a few false positives and
> a few false negatives, it likely doesn't need much improvement...
> 
> checkpatch works on patch contexts.
> 
> It's not intended to be perfect.
> 
> It's just a little tool that can help avoid some common defects.
> 
> 

Alright Sir. Then, we can proceed with the method you suggested, as it
is more or less perfect.
I'll re-send the patch with modified reduced warning figure.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

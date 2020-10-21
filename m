Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4352C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:56:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19985222E9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 17:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeNKjMsk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19985222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C46086933;
	Wed, 21 Oct 2020 17:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUrVC-AhiF-7; Wed, 21 Oct 2020 17:56:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA7D086938;
	Wed, 21 Oct 2020 17:56:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB137C088B;
	Wed, 21 Oct 2020 17:56:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11CD9C088B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0EC368693C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8Kyf7PunY1k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 61627868EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 17:56:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t4so1577857plq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lzul3FMJv/xeo11nXKkbOk4KrDGxaWV8W5UIU+yj0Ho=;
 b=qeNKjMskhs9+4r5kftT5Vpo+Ajd7JYFyChtNH3JmBV4t0pAXc30t/kemLfEu+5SAAm
 QBZ72+1/7uvSRdIiIpkF6EtyBMuwLxS5ZvH+Wkm+WYmToXIZFk89LxX2K1mPP7t+Gnb9
 7Nl/Jf42bt/EeN5W/LqXejB/77GJMRgUn08SWaPhU0nMWNMrmEizaGPwNI6IRu/1IXXx
 Fqj8LnFf8X2rmWF5s0llNbwB3QpaL/ELcdWZgfPnBqLzshjyjFWS3dppHrQKfbo8VtpP
 Bu04su66eGOeb89hxi3plNlmdHwAD+TbaCTli8mccjhSzFTEQh1xBQVrfAe4YDj3y9E5
 wpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lzul3FMJv/xeo11nXKkbOk4KrDGxaWV8W5UIU+yj0Ho=;
 b=X8GFHrbrXlNKc+Y+LfFvewiIAwg7/mg/4VUl78TSZila+PW2wAIMWEap/t+Em03qUd
 oGIMLU8GNCS7UfgPAsAWj2HGEq6ol9AW9T8VgrvKmiu2MrbwcIhPtRa4zBUuy83gbwiB
 f6V6+J21cTENSJkI8Apc5VZwofSyVYhnrzduQOQkfvW1qqByEjKzp6VBSqa5OrbfC+cG
 guNmDn62FK1jz2tKuZKw89vrhlwhrxdXE5ZLBJxr8xEG7vGvs5RD0NrSiyhAhGzuijrA
 NatPR31qEmQFBs4Sv6RPzz1x3zVL2cIJavk9YN69MLsTPs45yD8ocFged0rG3uVox4aT
 or5g==
X-Gm-Message-State: AOAM532Z+GLGCfgRr9M2q9BWcnmJLu/HPS4K6stCNrCw7a09lsmwWqX0
 GvuM7Xjp7ABDCr/fz8quX6M=
X-Google-Smtp-Source: ABdhPJwl5z0xbugm0cEBUmWGWhiuC5cxC7/geDf7Ue2PpHCiJvhOkm/0ua8/MZIQWF73DJHS8nUdZA==
X-Received: by 2002:a17:90b:1096:: with SMTP id
 gj22mr4538856pjb.183.1603302964786; 
 Wed, 21 Oct 2020 10:56:04 -0700 (PDT)
Received: from ?IPv6:2402:3a80:431:7ac0:8cb2:c45f:197:35d9?
 ([2402:3a80:431:7ac0:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id s20sm2947231pfc.201.2020.10.21.10.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 10:56:04 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <26647abf8cf14595a0dd22f10ec1c32e3dc2a8c0.camel@perches.com>
 <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <c4f8aae0-d805-8d09-1a87-ba64bc01c29a@gmail.com>
Date: Wed, 21 Oct 2020 23:25:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
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

On 21/10/20 10:20 pm, Joe Perches wrote:
> On Wed, 2020-10-21 at 08:28 -0700, Joe Perches wrote:
>> On Wed, 2020-10-21 at 08:18 -0700, Joe Perches wrote:
>>> I might add that check to the line below where
>>> the repeated words are checked against long
>> []
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> []
>>> @@ -3062,6 +3062,7 @@ sub process {
>>>  
>>>  				next if ($first ne $second);
>>>  				next if ($first eq 'long');
>>> +				next if ($first =~ /^$Hex$/;
>>
>> oops.  with a close parenthesis added of course...
> 
> That doesn't work as $Hex expects a leading 0x.
> 
> But this does...
> 
> The negative of this approach is it would also not emit
> a warning on these repeated words: (doesn't seem too bad)
> 
> $ grep -P '^[0-9a-f]{2,}$' /usr/share/dict/words
> abed
> accede
> acceded
> ace
> aced
> ad
> add
> added
> baa
> baaed
> babe
> bad
> bade
> be
> bead
> beaded
> bed
> bedded
> bee
> beef
> beefed
> cab
> cabbed
> cad
> cede
> ceded
> dab
> dabbed
> dad
> dead
> deaf
> deb
> decade
> decaf
> deed
> deeded
> deface
> defaced
> ebb
> ebbed
> efface
> effaced
> fa
> facade
> face
> faced
> fad
> fade
> faded
> fed
> fee
> feed
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..79d7a4cba19e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3062,6 +3062,7 @@ sub process {
>  
>  				next if ($first ne $second);
>  				next if ($first eq 'long');
> +				next if ($first =~ /^[0-9a-f]+$/i);
>  
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
> 
> 
> 

Hi Sir,
Thanks for your feedback. I ran a manual check using this approach
over v5.6..v5.8.
The negatives occurring with this approach are for the word 'be'
(Frequency 5) and 'add'(Frequency 1). For eg.

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#278: FILE: drivers/net/ethernet/intel/ice/ice_flow.c:388:
+ * @seg: index of packet segment whose raw fields are to be be extracted

WARNING:REPEATED_WORD: Possible repeated word: 'add'
#21:
Let's also add add a note about using only the l3 access without l4

Apart from these, it works as expected. It also takes into account the
cases for multiple occurrences of hex, as you mentioned. For eg.

WARNING:REPEATED_WORD: Possible repeated word: 'ffff'
#15:
	0x0040:  ffff ffff ffff ffff ffff ffff ffff ffff

These cases were getting missed with my approach.

Also, it is able to detect warnings for hex sequences which are
occurring less than 4 times(frequency 2), for eg,

WARNING:REPEATED_WORD: Possible repeated word: 'ff'
#38:
 Code: ff ff 48 (...)

I'll try to combine both methods and come up with a better approach.

Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D769C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 18:12:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A09D7223EA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 18:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjomsHAR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A09D7223EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 460C1869F2;
	Sat, 24 Oct 2020 18:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0mLE2pfRDAD; Sat, 24 Oct 2020 18:12:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4AE408698C;
	Sat, 24 Oct 2020 18:12:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 272BCC088B;
	Sat, 24 Oct 2020 18:12:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FDD4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 18:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 949B28748B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 18:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDEcqCXZctMU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 18:12:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1241987251
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 18:12:10 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l2so891070pjt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mXaxBMgd3STA90Ceb6+dwFyt3TBhuPB650L6ZqSsYus=;
 b=CjomsHARkF6OFvaUIz5OWUzGWCtl/uIgu/hnqEb8I/qS0hRnAR+7eCLLZoyGyGAJAa
 c8xL2CusNyM85BGVKzufsCK0pdoWBsHFAvRgAgw6XSWTOwVZbJUrahw9+3tXhu82k5Mt
 DAdjO1lgsLUf7qjq5RMywce1ITKE5Y4g2SEuiCvq9s2A072W+p7l/Z8dCcW/9qDwgc8I
 twUeJ1W0J1GIj0dKto2lxnqKw0YAsTCDiS8S5PdLKqgkdURPeYSPY8Zvf7/JublWpp7X
 RQgKH+FhsvdrXpdXhGQGolmcG1SnqAvPGwN9A8dV1PaQUw0lxSfhAWqfflQ9NvKfqiEG
 P9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mXaxBMgd3STA90Ceb6+dwFyt3TBhuPB650L6ZqSsYus=;
 b=VE5ufxNkDT84/En9c4FPXjYgBgupHn8pDwg8RzK/8xiA9oNvkAZSJT/fa/qPGWeFAD
 AeJhysXRSktBx+7+F9nd3K5I41ieGyvKCyLsTJS4f0g1g1Nnmikf75YC6PRJz66uirWQ
 Koe7medFtRypqOcBeC7lErF3cCcr2LghKXTZxd66jHAfVzZUVBcUEU9WqDscjz+/XFat
 ktcQI1ELCUZ0MzQlpOXZmrLf2a6njDfgEEbrZz3KwGw2wnF9Y32TBQXOA3Huae6kGGmx
 ruoOxuBuwnwQK0CHhk+1jrTbMZA46+//BVEf/JjexZpMxAFBwZTfn7s7YlAsncMIO36W
 x/HA==
X-Gm-Message-State: AOAM532rduk5gGWwl9vYWtkxLWfRmgCy5KjCPO+4qNjmwmgMD4HzBI6R
 hmzPoxkLiw2XkQ+kN9CttoE=
X-Google-Smtp-Source: ABdhPJyZXmUv/FreBmEkmRMyIcS9k9Shgusj6xr2EAq/iECeEJiGZu7tyn9Ot7JUB87oFmATxFo2LA==
X-Received: by 2002:a17:90a:9206:: with SMTP id
 m6mr10377241pjo.42.1603563129587; 
 Sat, 24 Oct 2020 11:12:09 -0700 (PDT)
Received: from ?IPv6:2409:4063:228f:175e:55ee:fad5:f15e:347e?
 ([2409:4063:228f:175e:55ee:fad5:f15e:347e])
 by smtp.gmail.com with ESMTPSA id v65sm5529364pgv.21.2020.10.24.11.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Oct 2020 11:12:09 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201023133828.19609-1-yashsri421@gmail.com>
 <alpine.DEB.2.21.2010232104150.11676@felia>
 <c9512657-d7d0-bf04-0e40-b3463c9f5e1b@gmail.com>
 <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <2cbc0068-4e3e-17d5-6260-dda7c9f3a9b0@gmail.com>
Date: Sat, 24 Oct 2020 23:42:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5c11f284872f3b2b017d9d27d4075582c1a40eab.camel@perches.com>
Content-Language: en-US
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 24/10/20 9:03 pm, Joe Perches wrote:
> On Sat, 2020-10-24 at 18:54 +0530, Aditya wrote:
>>> Would you like to work on 
>>> further rules that can be improved with your evaluation approach?
>>
>> Yes, I would like work on further rules.
> 
> Some generic ideas:
> 
> How about working to reduce runtime and complexity by
> making the rules extensible or separable at startup.
> 
> Maybe move each existing rules into a separate
> directory as an individual file and aggregate them at
> checkpatch startup.
> 
> Maybe look at the existing rules that do not have a
> $fix option and add them as appropriate.
> 
> You could fix the multiline indentation where the
> current warning and fix is only for a single line
> 
> 	value = function(arg1,
> 		arg2,
> 		arg3);
> 
> where checkpatch emits only single warning and fix
> for the line with arg2, but not the line with arg3);
> 
> Maybe try to make the coding styles supported more
> flexible:
> 
> Allow braces in different places, support different
> tab indentation sizes, spacing rules around operators,
> function definition layouts, etc.
> 
> 
> 

Thanks for all these suggestions. I'll make observations regarding
these and get back to you :)

Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

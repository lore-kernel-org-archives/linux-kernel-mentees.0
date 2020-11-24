Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9069C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 03:12:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264BC2080A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 03:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXunGBT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264BC2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75644861F4;
	Tue, 24 Nov 2020 03:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nB4EPQHyUOzr; Tue, 24 Nov 2020 03:12:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAD6685E7C;
	Tue, 24 Nov 2020 03:12:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC77AC163C;
	Tue, 24 Nov 2020 03:12:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C79C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD8C98671E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sff7mibrLksp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2E55D811E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 03:12:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k5so3503254plt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 19:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cfq/nfp3VIzB8kJ/4Aoe3//TNwxiq0kRsB2O4wXa0RE=;
 b=IXunGBT9lpxE1Gy8krkmLoqv/tMttjxnyEzpn5GnDMS6x2sVRfT6iaM2mTyERBcwpO
 JGqN3fvtmVJLEcMLVtGbIy97fQ+C5/poj8rqzut2+zr418EkXROU00+uyjUUNbcRtUxX
 Jn+LquVXjlOau82ObZGD3hyah+OELI2ty5PB1IcscqJUcfyVzokfWifzPr64EZo0djvi
 Uk7tnsqigFBsVtAU4r+PexSBl+Eh5lZPosiUCOqGz18y9owFqD3s50AhovMrCx3ZoIPE
 m7MlZqWq4EMzbPR9X9XVjjQ03iNSFrm240qaK0m7ZQQ0DjbvWfs9EQIetii5VEwhwFwr
 lF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cfq/nfp3VIzB8kJ/4Aoe3//TNwxiq0kRsB2O4wXa0RE=;
 b=GzDZaZ79pE2JALBD5mNr2Mh8z6tzggQDRm/W/92IjfG5La8K0KdEj0ssKUQAZxyv20
 v40XeRqWAyGlPKUGn38SvI1h10Rc/uDdNE+82oZ99qFCV+i8u9ypxiHfDfbE2jDKO3N8
 jMQvTQeBQ4lkuUOM4qvUNoFbSawDBNAKRw3n8ciakgkii3C4tSgCPOKa9cy69S+8bW6U
 g+Bl/RsdYHsGc1M7FzAncm9ZnGsfnJ7f0BGfM59qGeJqDylFL11DldXx+oPLKGAIc0fl
 1OCG/RwbEAkZJYr0dBSjNM302NxYNbRrmaf8l3fzxLQ4nmvWTgwlDI4bIlug8qQ4pvqP
 q/HQ==
X-Gm-Message-State: AOAM531ZCQhDWtbEiCtFIs1A6mKYY4TPKMDwPqqJpGhrkqqESpfuZTWx
 mPKQKNl3x2fBlDrOJWWqajQ=
X-Google-Smtp-Source: ABdhPJy/SIbj27bYteQDbCYS+9HoSmJamtqkCHRqx4xz1b6nckV/I6uvO+e91XVibC7lu6fkFBdqZA==
X-Received: by 2002:a17:902:eaca:b029:d6:807e:95b8 with SMTP id
 p10-20020a170902eacab02900d6807e95b8mr2304073pld.33.1606187552480; 
 Mon, 23 Nov 2020 19:12:32 -0800 (PST)
Received: from ?IPv6:2402:3a80:422:4fb2:189e:bfca:2836:414f?
 ([2402:3a80:422:4fb2:189e:bfca:2836:414f])
 by smtp.gmail.com with ESMTPSA id i4sm11544555pgg.67.2020.11.23.19.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 19:12:31 -0800 (PST)
To: Joe Perches <joe@perches.com>
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
 <20201123172430.12854-1-yashsri421@gmail.com>
 <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6b3feb74-5f1d-ee1a-2e1a-8a5f803bed63@gmail.com>
Date: Tue, 24 Nov 2020 08:42:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On 23/11/20 11:03 pm, Joe Perches wrote:
> On Mon, 2020-11-23 at 22:54 +0530, Aditya Srivastava wrote:
>> Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
>> styles.
> 
> I think this proposed change is unnecessary.
>  
>> This warning occurs because of incorrect use of signature tags,
>> e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
>> signature tags, which may seem correct, but are not standard:
> 
> Standards are useful, but standards are not constraints.
> 
>> 1) Requested-by (count: 48) => Suggested-by
>> Rationale: In an open-source project, there are no 'requests', just
>> 'suggestions' to convince a maintainer to accept your patch
> 
> There's nothing really wrong with some non-standard signatures.
> And I think leaving humor like brown-paper-bag-by: is useful.
> 
> Just telling people that they are using a non-standard signature
> I think is enough.
> 

Hi Joe
Thanks for reviewing. We were also planning to provide fix for certain
non-standard signature warnings due to typo mistake in the signoffs,
using edit distance approach. These signatures were probably not
intended by the user.
E.g. for signatures like: 'Reviwed-by:', 'Singed-off-by:',etc.
Here is the list I have generated for non-standard signatures with
edit distance of 2 or less along with their count (over v4.13..v5.8).
(Among total 539 Non-standard signature warnings, warnings caused by
typo mistakes are 85 in number):

https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than2/signs_freq.txt

This is the predicted correct signoffs we are getting (for less than
or equal to 2):
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/less_than_3.txt


The reason I have chosen 2 as threshold is that count 3 onwards, the
results start deviating.
List for edit distance 3:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/non_standard_signature/equal_3.txt

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

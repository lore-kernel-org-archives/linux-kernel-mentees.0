Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C2DEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 13:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B5A80BE6;
	Mon, 10 Jul 2023 13:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B5A80BE6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FCXvc+q7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xY8NzTRQelRx; Mon, 10 Jul 2023 13:03:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7C30A80B17;
	Mon, 10 Jul 2023 13:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C30A80B17
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56E40C0072;
	Mon, 10 Jul 2023 13:03:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEACC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7EC740442
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7EC740442
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FCXvc+q7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEpOYyeHRIRi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:03:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 872F4403D8
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 872F4403D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 13:03:28 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-66767d628e2so2747627b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688994208; x=1691586208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sAy2c0os0GmfNuU+dP0Ym0b6T3GH3G+Bfmw/OZdFCgA=;
 b=FCXvc+q7Ckt/Vm7rCBLYwtu0LzCUVodERKRMLt1iNehEnwPhXk7B7YdwRBZguFQQZU
 uCsN3B9prfW4KSe6tzCLwuCU8pLw+MJJQ4asbzpSB3GI+ttYOXOgIOkvbjTzdQDcIJz3
 rv0xT4r5ZxVziOwUBCIBfCrYvt6SXuNBdmK21NbnIE+1dEd8CTzEep5GURTbqfqPXFKW
 kWYMm5u73PVzTOHJq9bmoUerEGfaMmhfVsX75K22i/PxXrp+4VqdvIi+zESX5Pb5WcQb
 kd3whsdyuOt8JRHeqI0Yzw6qF1mWIhP/1iL1ztH/16xR+IKwAVvrtnqoJnMyw37lNzN1
 3lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688994208; x=1691586208;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sAy2c0os0GmfNuU+dP0Ym0b6T3GH3G+Bfmw/OZdFCgA=;
 b=PNxrLYzzSTAEtq+7ODjLDRFnb02gAXKAcuU39mfbLHn5JRqeCYbiRdbi/yHM7jFr4/
 DHQNnw5MITQ8iH+NbxRKUx7VtL2bLJIxo22HlflNPHLo05hZ8ecTQOuO7faDnrgxqd47
 Tbi3y2W4FaI0Vy2tGqsU+trJzi1HAO0C8Sx2VmMqHIDVC3trMkhQ9xdaQnn3lBWIGGDy
 MqMZzzRDmbOfQZFB7fhFHFIHSsBpjgAziWlGFSy3Eq+eMrrptsiGcJh2gA7ZwohYf4X+
 QukENKju15EhKnclu2PVQ8L5VdgYUQD3XqX9N3tTEOM/mwkPnZwCnI8uNbUObP0MX0up
 xT6Q==
X-Gm-Message-State: ABy/qLYLG2pvw8fEAoid7z3l1tk7EdsnTKOfmMniNy0Yvk9zbIerHAbO
 Ic1Nftv2lrye4OvTcKyWluM=
X-Google-Smtp-Source: APBJJlGKb+QmQtzOeC8zSxJUy+5B2v3C4XCt6WZ+bphJfsuHYCeRR/Jy5UJdbRBMMo0S218d/ywsyg==
X-Received: by 2002:a05:6a20:728e:b0:131:bcaf:9b with SMTP id
 o14-20020a056a20728e00b00131bcaf009bmr2333454pzk.30.1688994207687; 
 Mon, 10 Jul 2023 06:03:27 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a639242000000b00553c09cc795sm7446422pgn.50.2023.07.10.06.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 06:03:27 -0700 (PDT)
Message-ID: <4bf6475b-6688-1b6d-0db1-b0f15d2e1b3d@gmail.com>
Date: Mon, 10 Jul 2023 20:03:23 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
Content-Language: en-US
To: Siddh Raman Pant <sanganaka@siddh.me>,
 Khalid Masum <khalid.masum.92@gmail.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com>
 <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com>
 <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
 <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
 <1893b4bf70a.2c44c261262941.883099013045252156@siddh.me>
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <1893b4bf70a.2c44c261262941.883099013045252156@siddh.me>
Cc: daniel <daniel@iogearbox.net>, "martin.lau" <martin.lau@linux.dev>,
 andrii <andrii@kernel.org>, ast <ast@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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



On 7/9/23 22:36, Siddh Raman Pant wrote:
> On Sun, 09 Jul 2023 20:51:15 +0530, Khalid Masum wrote:
>> However, something to think about is: If future versions of clang, llvm etc
>> do not support compiling our code as it is now, it may become misleading.
> 
> When that happens, the max version can be added in.
> 
> Though, it would be an indicator to problems in the code IMO,
> which would need some updates and fixes.
> 
> So nothing to worry about now.
> 
> Anh should send v3 instead of replying though. I would also suggest
> to shorten the commit title if possible.
> 
> Thanks,
> Siddh
> 

Thank you! Will send a new version accordingly. But I'd like to admit
that the v2 in this patch's title is a mistake. This should be v1 so
I'll send a v2 patch for this discussion.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

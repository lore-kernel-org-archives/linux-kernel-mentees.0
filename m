Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35390C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF1AD611B9;
	Mon,  6 Nov 2023 15:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF1AD611B9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hQD3FnSR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0E5x2Qin-C9O; Mon,  6 Nov 2023 15:21:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B64096074C;
	Mon,  6 Nov 2023 15:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64096074C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D98DC0071;
	Mon,  6 Nov 2023 15:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DA2CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 15:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04C3B41503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 15:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C3B41503
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hQD3FnSR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7SdbfpfcN4T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 15:21:15 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACAEE414F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 15:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACAEE414F6
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so817106b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 07:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699284075; x=1699888875;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P92lxDHD1C4zCfjkheHzuT5lqonsPzQbwvZLdTTLERo=;
 b=hQD3FnSRYGHb2IOnhqkI/VeAlWNJOoAdN/lVEMkN6IqCxn9VlfYU59kp/yXj/oJO81
 RwgKPf267pWqkZmOOUq5k2u3xVafwlNo7e+XW50CeoX5VDJgMLuDdNuLZH/TA1NEvEOP
 n8l6T50E3Mml6/AcAgN/OxQoN/vF+/ZAZS5ZkSSVx9Ap4HxbIBLp/6Vt32IDjYSp9MYv
 /VftgSxo1MnRtqpnwdIW/Ayw0uMC0/hDKK2yDN8oP6lR4LeMNvyWMwfdQCF/DA1goYNn
 sUDyXoaIwxX5LaQ0odtEVm4KQIKX2JArPE4CgIxccrc7/C8geD7mpTLLIxVoa5BdkU54
 sFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699284075; x=1699888875;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P92lxDHD1C4zCfjkheHzuT5lqonsPzQbwvZLdTTLERo=;
 b=eJgP2C/qwXzpASZPYv5omIuP+KjvX7OErMtas7PRQ0D3IDn05NRBID+WsyhpYbnZj1
 fLKNqOHWLN/EYa37y5/Q273buQduBkw9KcoYhf9w8qtm0mZu6hxC92PI1FxkOBDFGi8r
 fMCjUcRMKdCGcRvf/QIOx9TE8LCZIYJruGatht89I3LTOaKmnB71d58hz/9VeZvD0BKP
 ebCibGbUQZLhph1QtAu2Ab6Ilrh0kZWTBtkVyNgiEpBQlD8kfa5lRA008h+WOoGlhpTq
 yeE78i9EXkp5GDl1wP5MaI+h18pDGNmwyMEN5btBVovIQvn/PfONklayUgNo+JF5VjqK
 1apA==
X-Gm-Message-State: AOJu0Yyl9GKampoo5Wmcp8AuXdBxrb2B1TSA1y6gOoOAS2tNj58fvjFX
 umUx8vvDgcVVm32RxRpsr0I=
X-Google-Smtp-Source: AGHT+IE24GvzdFIzXU6AfcREyApaAuOpmL/V9kBcAm3FDckkeCxrMFOO4qFiX+Sawmz7v5gl44NziA==
X-Received: by 2002:a05:6a00:470a:b0:68f:c8b3:3077 with SMTP id
 df10-20020a056a00470a00b0068fc8b33077mr28116172pfb.1.1699284074970; 
 Mon, 06 Nov 2023 07:21:14 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a056a000d6300b006b90f1706f1sm5777285pfv.134.2023.11.06.07.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:21:14 -0800 (PST)
Message-ID: <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
Date: Mon, 6 Nov 2023 20:51:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <87sf5jyvkt.fsf@intel.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <87sf5jyvkt.fsf@intel.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 11/6/23 16:53, Jani Nikula wrote:
> On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>> sparse static analysis tools generate a warning with this message
>> "Using plain integer as NULL pointer". In this case this warning is
>> being shown because we are trying to intialize a pointer to NULL using
>> integer value 0.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>>   drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> index 63a1ffbb3ced..3b645558f133 100644
>> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>>       {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>>       {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>>       {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
> 
> Random drive-by comment:
> 
> I'd just use {} as the sentinel.
> 
> BR,
> Jani.
> 
>>   };
>>   static const u32 SECT_CLEAR_def_1[] =
>>   {
>> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>>   static const struct cs_extent_def SECT_CLEAR_defs[] =
>>   {
>>       {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
>>   };
>>   static const u32 SECT_CTRLCONST_def_1[] =
>>   {
>> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>>   static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>>   {
>>       {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
>> -    { 0, 0, 0 }
>> +    { NULL, 0, 0 }
>>   };
>>   static const struct cs_section_def evergreen_cs_data[] = {
>>       { SECT_CONTEXT_defs, SECT_CONTEXT },
>>       { SECT_CLEAR_defs, SECT_CLEAR },
>>       { SECT_CTRLCONST_defs, SECT_CTRLCONST },
>> -    { 0, SECT_NONE }
>> +    { NULL, SECT_NONE }
>>   };
>> --
>> 2.39.2
>>
> 
Hi, Thanks for dropping by and the suggestion. I thought of using NULL 
instead of {} is because, first the warning itself says that 0 is used 
to intialize pointers with NULL, and second due this link 
https://www.spinics.net/lists/linux-sparse/msg10066.html where linus is 
talking about not using 0 NULL intialization of pointer variable and he 
thinks this is a legitimate issue and not some false positive

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB4C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 18:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF7F828B3;
	Mon,  6 Nov 2023 18:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF7F828B3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=THFtCRNe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTKK8byexXSO; Mon,  6 Nov 2023 18:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C3F0F828AA;
	Mon,  6 Nov 2023 18:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F0F828AA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CFBDC0039;
	Mon,  6 Nov 2023 18:19:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F8ACC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A58161201
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A58161201
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=THFtCRNe
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVyEIBKMrihw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:19:26 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51C70611F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C70611F3
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cc703d2633so7057415ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 10:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699294765; x=1699899565;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tl8ZlpdAg7GwtfMnMLLp2fEwluCCUsAiPSPuqFG5Xz0=;
 b=THFtCRNeH+SQbD337iZI1YcbjptXFcLgotug1tuOUiQaYeYLUHRA0LaLWS/sx4jiZQ
 BgWZiJ5JomcEA38clRj5xgCHQpglmc0hDQb2nHvUOT4wP6zGzTDwXsKrmiQKiOcqy/NX
 US0T4wwAgd3bdGodTEb5OdPQ04K1CR5Y0wC6ySWoHOlusF4H2U2i/UTv9uBjUayp5SXw
 aPydAgbII9o8ejQjldhxxfyHEkphyBy1/nsMGoOLQ2kLxkbpgMVhQpwmA99kq+IMUuRd
 2C8tyKeSP2UpPBNXXZlCcMEycVxNvEsqaRLMMKeJ6DZeWC65olbkjA1nPKoxF/D4l/t2
 3/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699294765; x=1699899565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tl8ZlpdAg7GwtfMnMLLp2fEwluCCUsAiPSPuqFG5Xz0=;
 b=uNU28V6ZN2Qczk42/D8AdhFwVzBEiIFMSEfpKtU/Xc4vr2++bo7UZBhI9HE31HYy9B
 O8p0SZmv2GIUQ9QkX6Xk4iDW7vi4wfl2G+NmMozYqeaLenaSX6eRRPS2aCSIWCezfEjW
 zQWvoSbkNqZaRjssf8HX+1s35c+RTAP2AHNJQl9uFlTK1sY/kW9bnFcYEosuT3m5lqqB
 xA5GtkNNpZvCJZxDnL60AxzP4zr+kHJk+zR3tnXFVTv+S+QKXFWDLsHcZZPqHny8+B3X
 nadyZDotDfNuLuSTUgOgrGiI+alvWd5Kyq1FPIEUC7v2zymSKzIs0hFbqSNNo4MR/qJP
 vP9A==
X-Gm-Message-State: AOJu0YxkYlscaI2pvhAHeB1xEM4i4jaUIPthHkgcw3ynHxJopeDUoQLw
 qRT7lOe9UgCMCuiNoGR+W5M=
X-Google-Smtp-Source: AGHT+IGZuMNhI2zZQoFqXXq3E+/brKmtT53P7YA09Nfn+zaDB3yG15dLm3XBrAxgDZ/f+n0Zz0X0rQ==
X-Received: by 2002:a17:902:f213:b0:1c4:1cd3:8062 with SMTP id
 m19-20020a170902f21300b001c41cd38062mr31371603plc.2.1699294765189; 
 Mon, 06 Nov 2023 10:19:25 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170902e5ce00b001c9b35287aesm6204407plf.88.2023.11.06.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 10:19:24 -0800 (PST)
Message-ID: <ba31f441-80cd-4745-b425-23e5b9e0f9c0@gmail.com>
Date: Mon, 6 Nov 2023 23:49:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <87sf5jyvkt.fsf@intel.com> <a2310260-ba15-428e-9fd1-08abb9565b18@gmail.com>
 <87h6lyzvg8.fsf@intel.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <87h6lyzvg8.fsf@intel.com>
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

On 11/6/23 22:10, Jani Nikula wrote:
> On Mon, 06 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>> On 11/6/23 16:53, Jani Nikula wrote:
>>> On Fri, 03 Nov 2023, Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:
>>>> sparse static analysis tools generate a warning with this message
>>>> "Using plain integer as NULL pointer". In this case this warning is
>>>> being shown because we are trying to intialize a pointer to NULL using
>>>> integer value 0.
>>>>
>>>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> index 63a1ffbb3ced..3b645558f133 100644
>>>> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
>>>> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_defs[] =
>>>>        {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>>>>        {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>>>>        {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>
>>> Random drive-by comment:
>>>
>>> I'd just use {} as the sentinel.
>>>
>>> BR,
>>> Jani.
>>>
>>>>    };
>>>>    static const u32 SECT_CLEAR_def_1[] =
>>>>    {
>>>> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =
>>>>    static const struct cs_extent_def SECT_CLEAR_defs[] =
>>>>    {
>>>>        {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>>    };
>>>>    static const u32 SECT_CTRLCONST_def_1[] =
>>>>    {
>>>> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>>>>    static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>>>>    {
>>>>        {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
>>>> -    { 0, 0, 0 }
>>>> +    { NULL, 0, 0 }
>>>>    };
>>>>    static const struct cs_section_def evergreen_cs_data[] = {
>>>>        { SECT_CONTEXT_defs, SECT_CONTEXT },
>>>>        { SECT_CLEAR_defs, SECT_CLEAR },
>>>>        { SECT_CTRLCONST_defs, SECT_CTRLCONST },
>>>> -    { 0, SECT_NONE }
>>>> +    { NULL, SECT_NONE }
>>>>    };
>>>> --
>>>> 2.39.2
>>>>
>>>
>> Hi, Thanks for dropping by and the suggestion. I thought of using NULL
>> instead of {} is because, first the warning itself says that 0 is used
>> to intialize pointers with NULL, and second due this link
>> https://www.spinics.net/lists/linux-sparse/msg10066.html where linus is
>> talking about not using 0 NULL intialization of pointer variable and he
>> thinks this is a legitimate issue and not some false positive
> 
> But... {} is neither of those things. It's empty initialization instead
> of 0. It's valid in GCC and C23, and used all over the place in the
> kernel.
> 
> BR,
> Jani.
> 
> 
> 
If I understand correctly you want to me change from this "{ NULL, 
SECT_NONE }" to "{}" right? If yes, then according to what I read from 
some online, it is better to intialize variables especially pointer 
because in some cases a non initialized pointer doesnt always point to 
NULL. Not sure if this applies in kernel space as well. But yeah my 
knowledge is pretty limited in C in user space and in kernel space it is 
even more limited :)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

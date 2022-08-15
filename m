Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BF2C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 17:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2CB0400F1;
	Mon, 15 Aug 2022 17:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CB0400F1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gZqQLXqc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eapZAzJvjUxv; Mon, 15 Aug 2022 17:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 006F7400A6;
	Mon, 15 Aug 2022 17:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 006F7400A6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B593DC0033;
	Mon, 15 Aug 2022 17:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFC8EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 17:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95916402E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 17:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95916402E0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gZqQLXqc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3jtsx-drUtz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 17:02:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A72402B8
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72A72402B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 17:02:02 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id z187so7074933pfb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kVI9j3DYdqBdWkziBWW1kk/pn2Ueg4C4jZV3ff8Htjw=;
 b=gZqQLXqcl92oRRJt+5e5u2qjisa8kzB6aZhxd9PIhqUmCxltZj383GoU8Cz3j8Tk4c
 vN3dentoCQF+MRI0FvyRZDu3ppO1yOn+l9OA8GhHnGrLqRWgaIjY5eBqJDZC13icn8hw
 +JAwQvLxC0EWZOG74h3jwKTqvyhuQAgdTqTQO3xsOZuG6xc4trx06//kNQR1Qf0Ld1Qt
 tKFvpd6kAwyjbVJ8t5yuX1bSinVtAAjspK7Ilp9HakXaNORZYJnsYGPk0LyRyExCiuIq
 zgLrz1HmdPJhISBHvYLb3Ttimvk0hFUuuNhLGuw8c59leJyeKyuYyxmeeXGhUtcLAc0k
 0nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kVI9j3DYdqBdWkziBWW1kk/pn2Ueg4C4jZV3ff8Htjw=;
 b=ROF/9bAjf6vVY2Z1DYhUwyCjASe0w+LOd3kCxRPqSTndtyIBmhcKtJMdrykuylT7fm
 oT61+/B+P65sQxTxJiQhmRfUZLZ+d6UMzKfeoDu/L6rlnpx8lWzVgJKBD39Qu8X2Qlc1
 27NmvO4igSSk8Tjx84ZJiu3aVNMxwYdU6CG5XmzVJD3NDHgVm9VnswZCx+7vRmg3iuna
 j24/6ZOaxqRkmzlUtBK0zURk45EfGbqckkxELBR3Xzzv6lZ/W0VZgK53fjAV1f0J/07w
 3KYEUbij6vZwz0oMhVe/Zhult1wtIgM17o01tc4sD0TU2k/tlj1WBV5ZdU6s8yyay0Pa
 YYHg==
X-Gm-Message-State: ACgBeo0t2aQXEPGtfC+xU9ok5xFmp8XN2BIYIXJfve988xb8/HzAoBls
 9KgYTbXYIDqOapTqV6utTGA=
X-Google-Smtp-Source: AA6agR5RZ22iqECqURoT+vxzrH03J8Q9Bvu9e6PkSFwJuTLDiJCN3IdbpLDIa0y8FwM7EIYwWL+bEw==
X-Received: by 2002:aa7:88d1:0:b0:52e:f8e:aab5 with SMTP id
 k17-20020aa788d1000000b0052e0f8eaab5mr17090966pff.63.1660582921848; 
 Mon, 15 Aug 2022 10:02:01 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.138])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a17090b079400b001f89383d587sm4767063pjz.56.2022.08.15.10.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 10:02:01 -0700 (PDT)
Message-ID: <1e720378-8398-3e4a-5a77-e34b2fec58fd@gmail.com>
Date: Mon, 15 Aug 2022 23:01:49 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-US
To: Greg KH <greg@kroah.com>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com> <YvpwVh359EMGa5kO@kroah.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <YvpwVh359EMGa5kO@kroah.com>
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "Zhu, James" <James.Zhu@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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

On 8/15/22 22:12, Greg KH wrote:
> On Mon, Aug 15, 2022 at 09:11:18PM +0600, Khalid Masum wrote:
>> On 8/15/22 20:15, Dong, Ruijing wrote:
>>> [AMD Official Use Only - General]
>>>
>>> Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
>>>
>>> Thanks
>>> Ruijing
>>>
>>> -----Original Message-----
>>> From: Khalid Masum <khalid.masum.92@gmail.com>
>>> Sent: Monday, August 15, 2022 3:01 AM
>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
>>> Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop
>>>
>>> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
>>>
>>> Addresses-Coverity: 1504988 ("Unused value")
>>> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
>>> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> index ca14c3ef742e..80b8a2c66b36 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>>>                   fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>>>
>>>                   if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>> -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
>>> +                       vcn_v4_0_stop_dpg_mode(adev, i);
>>>                           continue;
>>>                   }
>>>
>>> --
>>> 2.37.1
>>>
>>
>> After value is overwritten soon right after the diff.
>>
>> See:
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>
>> static int vcn_v4_0_stop(struct amdgpu_device *adev)
>> {
>>          volatile struct amdgpu_vcn4_fw_shared *fw_shared;
>> ...
>>
>>          for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>                  fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
>>
>>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>                          r = vcn_v4_0_stop_dpg_mode(adev, i);
>>                          continue;
>>                  }
>>
>>                  /* wait for vcn idle */
>>                  r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS,
>> UVD_STATUS__IDLE, 0x7);
>>
>> Here, any value assigned to r is overwritten before it could
>> be used. So the assignment in the true branch of the if statement
>> here can be removed.
> 
> Why not fix vcn_v4_0_stop_dpg_mode() to not return anything, as it does
> not, and then remove this assignment as well, which would fix up
> everything at once to be more obvious what is happening and why.

That makes sense. I shall send a v2 this way. Thanks for your suggestion.

> 
> thanks,
> 
> greg k-h

thanks,
   -- Khalid Masum

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

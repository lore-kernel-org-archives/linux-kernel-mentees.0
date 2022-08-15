Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155ECC25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 15:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9028583FA7;
	Mon, 15 Aug 2022 15:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9028583FA7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UZ9096jj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8gK6RZkwlzi; Mon, 15 Aug 2022 15:11:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7684383F98;
	Mon, 15 Aug 2022 15:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7684383F98
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DED1C0033;
	Mon, 15 Aug 2022 15:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F756C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C878460F99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C878460F99
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UZ9096jj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roKpelgbnV4v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:11:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36D6160F92
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36D6160F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:11:27 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id ha11so7183284pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc; bh=4pmq2cDtg0ydyuU0PpZLDkBCJ0OouWioIf1c6XMyXOk=;
 b=UZ9096jjWqCBf17hXnyVKDrCNj3DJVCItRZWHpeEILmz8aWMZ0dNOD5lz0V5HMWICJ
 51N0i+/iG09bmULlptqybK9Y8WQGz5LvrYsgCPDphgf2sFGpDQui0AonT3eqjI6ff1Mi
 eFa8s26yVIJhSbjAkVhy+wtasrXDwuhQ221yGjmLJPUJ/edPvy7WmC79UsZ+oZYnZNJr
 cMMumf6dA0h7OTPHoqd0mZphf1NX1LcFbNr2b5WvB7itW0anhNODt5wyI1AGfJNimNV7
 4ynQJ7dwM0P6RyIfGLFSpBPFuHy+m2SVp0FbWvLw51w/GhsvGER/dtgU2yekRKDOyoDV
 aq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4pmq2cDtg0ydyuU0PpZLDkBCJ0OouWioIf1c6XMyXOk=;
 b=abbky7hcqhXOl4L3jUS2jayRHdg9KCe1YlsWAHTp/qYaQp8LiKfTZPIBCwasTqzdVR
 fe2ige6eL4AokH3nsPF/pMCGxSDLkZYy9giO3whe15PZOiNk4H0m0fj0ffJ8KbU87XBB
 dCQTzr2acUze+s8QhP8UkWltnpP5mOAwjIpmcIDI9xuJCZxU9K7SEZKQKO4hH9orxW7S
 5+wpbbxKEr4JJMsq0vMSx9jHi0kv5boPj2oQhRkxQ1wIv0qHl5ScQf01jbda3g05B8Wj
 D1Q9RNQ6/KeCbuxJP0me/Rw8eQ1aTp6YtdKUqZWVXaWfZfTlLmAlnFaFdxPNqNwUUbce
 NDzg==
X-Gm-Message-State: ACgBeo2EX+1llMCt9y2nY7JqT797U72Yymi4RCVmQBGDxcYPX1OVhmIG
 iD/xb7rJN0a7Qlq4plXRueI=
X-Google-Smtp-Source: AA6agR7zDZWmDimewQ5T+cgTmvM9ZGGWIVm6LAiRhL7a4FKt7o56LofqV71sHQV80sOx2nI/9Pswvw==
X-Received: by 2002:a17:902:c94c:b0:16e:ce7d:1fe with SMTP id
 i12-20020a170902c94c00b0016ece7d01femr17690162pla.168.1660576286635; 
 Mon, 15 Aug 2022 08:11:26 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.156])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902b94c00b0016ef87334aesm7096733pls.162.2022.08.15.08.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 08:11:26 -0700 (PDT)
Message-ID: <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
Date: Mon, 15 Aug 2022 21:11:18 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
To: "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Jiang, Sonny" <Sonny.Jiang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
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

On 8/15/22 20:15, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> Sorry, which "r" value was overwritten?  I didn't see the point of making this change.
> 
> Thanks
> Ruijing
> 
> -----Original Message-----
> From: Khalid Masum <khalid.masum.92@gmail.com>
> Sent: Monday, August 15, 2022 3:01 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhu, James <James.Zhu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>; Dong, Ruijing <Ruijing.Dong@amd.com>; Wan Jiabing <wanjiabing@vivo.com>; Liu, Leo <Leo.Liu@amd.com>; Khalid Masum <khalid.masum.92@gmail.com>
> Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in vcn_v4_0_stop
> 
> The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten before it can be used. Remove this assignment.
> 
> Addresses-Coverity: 1504988 ("Unused value")
> Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index ca14c3ef742e..80b8a2c66b36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
>                  fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
> 
>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
> -                       r = vcn_v4_0_stop_dpg_mode(adev, i);
> +                       vcn_v4_0_stop_dpg_mode(adev, i);
>                          continue;
>                  }
> 
> --
> 2.37.1
> 

After value is overwritten soon right after the diff.

See:
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

static int vcn_v4_0_stop(struct amdgpu_device *adev)
{
         volatile struct amdgpu_vcn4_fw_shared *fw_shared;
...

         for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
                 fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
                 fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;

                 if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
                         r = vcn_v4_0_stop_dpg_mode(adev, i);
                         continue;
                 }

                 /* wait for vcn idle */
                 r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, 
UVD_STATUS__IDLE, 0x7);

Here, any value assigned to r is overwritten before it could
be used. So the assignment in the true branch of the if statement
here can be removed.

Thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

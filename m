Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E8BC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2FB84187F;
	Mon, 15 Aug 2022 15:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FB84187F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c9IES/GU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hc3p13v1kGti; Mon, 15 Aug 2022 15:54:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3BC5B417D8;
	Mon, 15 Aug 2022 15:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BC5B417D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0785CC0033;
	Mon, 15 Aug 2022 15:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C875C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB8678266C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8678266C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c9IES/GU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNmDlhyLfnl3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:54:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B988261C
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B988261C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 15:54:06 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso14820826pjq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rsucpEsc5D3CWajO1pTl308RBgWxNbG9t1oS7UmiC60=;
 b=c9IES/GUi/YRTnq8ntFq9iy84T/2qbs+aIfYv0AyQOVaTtypUcAHdLJICt2zAB4X/B
 4dYwLy7OnU1nSzGDcBqno4X26p9T2Rg3umFQoxDVNUxYdxj86i442PX0qvGtXBZBJT5O
 3sQ5JTHhnGZBS32J/RkD8vUQ6rKmI+qWTjOgzPlT90vKfz4HJTgGYUiLH6LhUxHnPRWg
 M503lWMUUWF75jkVCwy+h4wAHiI/g8EqkepRunM5afsGvgMLb76BvDnja1k0sJtz48N1
 KfPpIcLxyCXHahCV+A1E+VmS4mGWbTJ5B6r4dj8WQC7yHITiP6iEfPkTD4I+ua+M2mn4
 ob2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rsucpEsc5D3CWajO1pTl308RBgWxNbG9t1oS7UmiC60=;
 b=kfb/ogrN4oqzM89A2epCsrzmNK0i7E3qSYpq+uW7DLYBLcTsb1zf2hmp3j0i4m6zkw
 HCbDGXWoTJzGRgPxioPd2Ts5dSlZezzFdiqWbxvvOhPHtb3LjmKadxIMs2jhCGVUzRZS
 9sREap6nOEmbTbBP8Rt4f7G4rZfGS4yG1DpmV450KtbIV3H3VBwK5iUqS9lJmJ+ZUvKN
 ksrXyWIBO1OY2zxQubUHQXYWtU7wCwC2uwS5vU+w3CxiOORvQsTh9riUzq1FmRoGAJq+
 mY344Y2OLYE240YUlsLZq1YTgwSGrbFNqElwimpu8YaXnb35xcW2mcM4fe5I5+6cOQnc
 mHtg==
X-Gm-Message-State: ACgBeo2/1ND4vcVqmnaL3rNa7t0PHnSPQRskTZE2WfmTlugEc9OujWCX
 QTJrADAsmRAVNw3spAXT40o=
X-Google-Smtp-Source: AA6agR7rXwMmQoFFhV9guzX50xC2Hx5lxc/ntTUb9/whlW1Pw7vwVN3TsUywF9bJ3hq6crg1K1/dIA==
X-Received: by 2002:a17:90a:c38f:b0:1f3:2f26:e7c4 with SMTP id
 h15-20020a17090ac38f00b001f32f26e7c4mr28048030pjt.124.1660578845751; 
 Mon, 15 Aug 2022 08:54:05 -0700 (PDT)
Received: from [192.168.141.45] ([103.230.106.6])
 by smtp.gmail.com with ESMTPSA id
 p67-20020a62d046000000b0052ddaffbcc1sm6719244pfg.30.2022.08.15.08.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 08:54:05 -0700 (PDT)
Message-ID: <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
Date: Mon, 15 Aug 2022 21:53:54 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Content-Language: en-US
To: "Dong, Ruijing" <Ruijing.Dong@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
References: <20220815070056.10816-1-khalid.masum.92@gmail.com>
 <SJ1PR12MB61944B1D53330D5E9531158695689@SJ1PR12MB6194.namprd12.prod.outlook.com>
 <86088c17-585c-4a53-312d-ef339b824538@gmail.com>
 <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <SJ1PR12MB6194C83D51101ACD97B55F0295689@SJ1PR12MB6194.namprd12.prod.outlook.com>
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

On 8/15/22 21:17, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> If the condition was met and it came to execute vcn_4_0_stop_dpg_mode, then it would never have a chance to go for /*wait for vcn idle*/, isn't it?

Hypothetically, some other thread might set adev->pg_flags NULL and in 
that case it will get the chance to go for /* wait for vcn idle */.


> I still didn't see obvious purpose of this change.
> 
>                  if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>       ==>              r = vcn_v4_0_stop_dpg_mode(adev, i);

Regardless of that, this assignment to r is unnecessary. Because this 
value of r is never used. This patch simply removes this unnecessary
assignment.

>                           continue;
>                   }
> 
>                   /* wait for vcn idle */
>                   r = SOC15_WAIT_ON_RREG(VCN, i, regUVD_STATUS, UVD_STATUS__IDLE, 0x7);
> 
> Thanks
> Ruijing
> 

Thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C73AC25B0E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 18:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA31840632;
	Mon, 15 Aug 2022 18:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA31840632
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jdED2coZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MN3C5l511Oqs; Mon, 15 Aug 2022 18:32:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D41A5405AA;
	Mon, 15 Aug 2022 18:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D41A5405AA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95896C0032;
	Mon, 15 Aug 2022 18:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 610ABC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A6F8142C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 18:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A6F8142C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jdED2coZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DzsNbA8dgyJQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 18:32:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BDF81332
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03BDF81332
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 18:32:54 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so7477802pjf.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8bJQmDi/lCA9PqirReS3MPMutajyKB5RDjNh4fqCzaA=;
 b=jdED2coZKjWQwnNfe6vINVdrNYG/s4Ap5/xy5Gcip3nOeogSVmoaiJccuFjEMCn604
 aiAZAQA12xrgovQ0EK7RmswbJp8NFIGlbMK7CJIoj829dlR/YYKVOetZHn6kiWBGYqVw
 iKFOwG4d+6zBCeFAM+4iDS7+9tD9UBi/j3bzxO26XKdYiOx4BB2DNlOWrPLyESziZRHe
 LEaQNj92ErOuotlQ1magSPuxiMp4HGWT4qlqOjqs26rIJlOdgx2ohKm85mKBuL0W3Xiz
 UuCSlnwEL0+m8YK540p/n30zlzjGqOSmL/ZEk6NbS6E6meNvlkJSA2GfQZf+c2O2OWU8
 uGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8bJQmDi/lCA9PqirReS3MPMutajyKB5RDjNh4fqCzaA=;
 b=hIOkRld6bltfwG4+VF9KEVkFrDrus3+I6TcjmiRF/QX13jD3e3R0nhA9q572bKC/k5
 D3hS8TMLJxc2mHZGKdokLlDivQ+HnTFfgv1XAL60f5jOhZtMCvJefmGQfK7dEh2NOks8
 PY2fraE5Ls6zFUD0Yha4+yYeXUvikgquzCmfZOWylH8H0ohq5ifJ+Qt2UQobyAwerWzS
 EIxPAUbxxaVgBSltEM90b1HSDI53RySM2Xl+PdJS1gkPYR7j+j/xzrhepH7FYRO16g0B
 mBj3eCsBgNWb0yEH1dJbTifzq39y86+i8G/RriA8aYL5SxvYzagZDkNEziUm3H0hnSpk
 JxFw==
X-Gm-Message-State: ACgBeo3MJqCEi1/qAAYoMEHluHUNwWnqV9cvSY3BVme1Bnff/ct+bp+u
 d5s3ZMqxkxMX27RIlSC59SI=
X-Google-Smtp-Source: AA6agR6Clbh4D6hp8u1BwYfWLa6d/Cwe/QwEr2ontSg2+IYjxn4HZJNCGeWwoDVqjl6HR/cTznhCPA==
X-Received: by 2002:a17:902:c201:b0:172:6c9d:14b9 with SMTP id
 1-20020a170902c20100b001726c9d14b9mr7195297pll.161.1660588374426; 
 Mon, 15 Aug 2022 11:32:54 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 200-20020a6216d1000000b005289fad1bbesm7034667pfw.94.2022.08.15.11.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 11:32:53 -0700 (PDT)
Message-ID: <83820e90-04ac-16cd-b5be-87e1a0bbfca8@gmail.com>
Date: Tue, 16 Aug 2022 00:32:46 +0600
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
 <f8734af1-6e31-75c9-9556-9519709284f1@gmail.com>
 <SJ1PR12MB6194033EC36251B95A6737A095689@SJ1PR12MB6194.namprd12.prod.outlook.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <SJ1PR12MB6194033EC36251B95A6737A095689@SJ1PR12MB6194.namprd12.prod.outlook.com>
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

On 8/15/22 22:00, Dong, Ruijing wrote:
> [AMD Official Use Only - General]
> 
> Then please update commit message, this change is due to "value r is never used, and remove unnecessary assignment", that makes sense to me.
> 
> Thanks
> Ruijing
> 
Greg also pointed out that the function vcn_v4_0_stop_dpg_mode should 
return void. I shall send a patch shortly with these two changes. Thanks 
for your suggestion.

Thanks,
   -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

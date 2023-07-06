Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5ACEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 15:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A7426101D;
	Thu,  6 Jul 2023 15:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7426101D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZH06GVHD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JkJRjOPlNY3g; Thu,  6 Jul 2023 15:30:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 268A360D52;
	Thu,  6 Jul 2023 15:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268A360D52
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECFB9C0072;
	Thu,  6 Jul 2023 15:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E99C2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B4A41753
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B4A41753
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZH06GVHD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gWJYO_W7YOT6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 526374170A
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 526374170A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:30:31 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98502b12fd4so25341366b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688657429; x=1691249429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Z1BlLxPWPKdxfGdvSEAnfzfEGC5OzbOtHCd5+Jzu/o=;
 b=ZH06GVHDnvnE9AgXnshEk4hPgxA8GrmUM5G0V92E2faBUmRMY96Hf2nHcOtfB22zbk
 vLX91tmLLepP/lIc0K4IqVHfJzFLi0fFPp2N3+LucCE892VFnwn9fskGkpKWnXoW2cmX
 xqRUXwe6iZcQ6oIvEaoYy/KpMmulEzVLy9bwmTHAwLYzwK20yZxIIu7EvEnEt5yfpe8P
 eOgy/5zIUtG+YEUk5Jwpb2xKxXTUU4uAEgB2yx1/2z5j7mI1NFZdn3Yqldqb1369Vn7K
 3kk5WCCI3F/7o+L0raPq+icWmEGiYMmoLSc+hUGLmJKI8xsdFBIKmxhzhQRGBc6hryKy
 lzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688657429; x=1691249429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Z1BlLxPWPKdxfGdvSEAnfzfEGC5OzbOtHCd5+Jzu/o=;
 b=c04IuDCPYNG2DvU4qzrM1LDJgiBVfp8UVyeQIjzx+8/KxlgrsznImxgfwzdPIDEVlU
 xDIE0TENV+jICvrvz+XoaaSs6bPt2o8W2YJ/Hr3FURQqchd6LUbnAinMNsY+4TikAwWS
 JZTDvHyXD/Te91Pdvv0hJYiF4y9tQHv59Y7y7rpass62c49lLHkXDpnWEVj3CBMQqn7O
 JEDWYDQjS+4Ll+Izyzt5pe10DAO3lYGP1Niub8V27ptZEZUs+i4JsRzerxEHD1vOD3Nq
 P/cGSu7vdaWtNwjbYERLI/RqrtZm/FHIIiAohFX75W8puuQy379/VcVCvcPQffIqNs4i
 brQA==
X-Gm-Message-State: ABy/qLZIx26VDHno3YkavxYNqRte4gW3XMhlxcMxzH9dAAjuxEQ1KEH8
 voqEb/fAttWehq5vVc8GD5Q=
X-Google-Smtp-Source: APBJJlEIFlAQoLHChpeApdMXnWcLayighaoM8TllhP6wKqIlXM7j2bfAcw4rAuX7pmcWNgOAK6T8jQ==
X-Received: by 2002:a17:906:7394:b0:974:5de8:b5ce with SMTP id
 f20-20020a170906739400b009745de8b5cemr1731313ejl.2.1688657429245; 
 Thu, 06 Jul 2023 08:30:29 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a1709063bcb00b00993860a6d37sm950186ejf.40.2023.07.06.08.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:30:28 -0700 (PDT)
Message-ID: <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>
Date: Thu, 6 Jul 2023 17:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] Trivial code cleanup patches
To: Yogesh Hegde <yogi.kernel@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1688299890.git.yogi.kernel@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1688299890.git.yogi.kernel@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 7/2/23 14:14, Yogesh Hegde wrote:
> Rename variables in function _rtl92e_dm_check_rate_adaptive
> to avoid checkpatch complains.
> 
> The patches are required to be applied in sequence.
> 
> Yogesh Hegde (4):
>    staging: rtl8192e: Rename variable currentRATR
>    staging: rtl8192e: Rename variable targetRATR
>    staging: rtl8192e: Rename variable LowRSSIThreshForRA
>    staging: rtl8192e: Rename variable HighRSSIThreshForRA
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 

Please use the "staging: rtl8192e:" also for the cover letter in the 
subject for the next patch series you are sending.



Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

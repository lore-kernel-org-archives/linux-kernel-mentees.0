Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4463126DA
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  6 Apr 2026 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508465; cv=none; b=R1etbCHtHeQSRoiUgLIN2A36/FELSWdExkYN2wVS6eoVFutX6/QvbFO5BeH3IWKEjkk1nZcGf16MqqXOLkdEEiybt+Lku/hZ1c0vKACgMxUm6Bq/SQ/w8P34WRDXDi/FP0DUU7z7U5C88fM+DeAJhgi0SldkWq59bBoBcItMLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508465; c=relaxed/simple;
	bh=QyIZ3LiK1hCK/iTxaIe05uL7Wa5dFGvpMCo+BHEtues=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=d57udCT7e9x5KlxQfB4Qdi4+1GY2Qjl4duYif6GtkAG1z6V9JnL2bTKPD0EK0uuZYzllnTiT64YjS+gZq1oS9C9J3a0FSQxdbNtn3HTVUxkMJosCnrCMlPRORaHBKPzn2BjaTa/H9A/DNFssxyUfAGlWf/c5CD/dGsi6uDyvdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+mUr62C; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+mUr62C"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a60975dc5so40132217b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Apr 2026 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775508463; x=1776113263; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6bSpybbve/uppZrHu04AihAoKtS4Osvf69+FKM+5YU=;
        b=L+mUr62C0x03+x3rTN2hqECa9YsRAjRef4l9ILcvHYjL6I7H1q8xPPnXkx1Y6p1NMA
         Mcjb69H1DRiCBg/jSpGqTTRaC7QGwirDIwYHLdXPaDOrh0uCgnKYwxrVUlC12/MIT3e9
         lOog3RuN1tFCSRp/v4igeC6QBNy1zbB7+bSGiw/nHkOJjImoBGtHBVhybVfcJM7+enAb
         S0AK/90yIKG6cAWiYJ+CdRbYoNUoTBSYuShk7bImEVCO5hpd26YLyOiTzUQJouQBHBcP
         S9rCqH+ZdkAdcmmTZ7GECf4uZZqvbMNxtm8+OZIitjYhwhPAF+gzsYwlozXcIhdb1SJa
         X/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775508463; x=1776113263;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6bSpybbve/uppZrHu04AihAoKtS4Osvf69+FKM+5YU=;
        b=Qa8qGF42IHp5FhF1rXe4M+4k7c7TBOeOOs1/DYR6JwNn5rX+hAH60gwKgaFn9PtFOZ
         li5qr7K+0jFExLwvFfSLZ0bJUic0e+o5wC/wMIjHM1uN7yCwiS8ZCuB5tlTxcP8R3IP7
         ioO+Sga1LwMdGuOywkWwU4SZ3+k9aIqDyHbWk8mSr43x4mbY8s/WrrEZKMuHLmgyLce/
         CIp8nVnNNFiYh0e8T45Fd9jnGwq3muwHEDslevje0nKa0p06WbEoxpcCL/B5V+w/71Z9
         Rujz93xZgYHtZNThPMtTlf4ssrGp5+d8RYqplmlFpRneBBs8L9hvJ916qbBWcToHSDNf
         Ysbw==
X-Forwarded-Encrypted: i=1; AJvYcCXuuxE2p7ynJOlfRPeUyn2AUqkg93VfzVE2jgaxKel1f2n14FiEQHxLgh6D41gbcgk31NGdgNy9KhbGIf2EY0YZ2MJISg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEuY3A6g9X+hO4AXpQgnDWvmIDsJXEEhJ8Fb5jgIbjPICpXkKL
	/mRgHxAt4JfRGm81SQ8dIAMmZ6ckauDo9+kFrr+iLi6WW4SSlb7jRQnw
X-Gm-Gg: AeBDieuONa+bD2Joix6tFm5ObuFP89Gvc3/JMTlqpcAA7BFUpeAedU/Lw0UNXmvv/hE
	+Ug5x0IiRyJzWHwb6sHepcBOGdfbFnshj3ofAzjPHAVF41UAY7pEdFBVd6XniqgsQA7x0tmIhjz
	DgIy4F0PSTYvhbR56hQOBRYxQxSK1poaZturqLhLxPCoqDRKcIiXQFxvvgV1v30qZX/Fb84VSGU
	JA0o6H8PzvshglaHdBhyALMV4nvnV1naxJQ9sluri3Tah2vUFecpVTGd/K3gcgzsBvpuiitO3Ab
	JiJAqLD87ChAEk+Fc+40EXAcvRJO8mRZ+3SdufbQNP3DwmtFStknVkZrQq93vhrz7LRhHlNwocz
	HX/qjhu+VN39nId9jwcHeAETJuRJL+v/kMjgpkAsC/PGywD8I60RNis5ThgQS9FM6n8qkAujjcI
	byWfKdVMeUw4T0CqEATbt2TUlODPhiXdnex/koXXnU/h0lBY+pR/QKSxJ8N3XS177SqREvnRQNv
	M9t0ULFjfdGNdm8TgwTUFjmBINK51mL
X-Received: by 2002:a05:690c:81:b0:798:cf16:1c6e with SMTP id 00721157ae682-7a4d3bd7d7amr143486757b3.21.1775508462885;
        Mon, 06 Apr 2026 13:47:42 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42fec3sm58082817b3.4.2026.04.06.13.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 13:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:47:39 -0500
Message-Id: <DHMD7XTRZ3LY.2EP61834E44FS@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [RFT PATCH v3 5/5] staging: rtl8723bs: remove duplicate rate
 checks in PHY_GetTxPowerIndexBase()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Luka Gejak" <luka.gejak@linux.dev>, "Prithvi Tambewagh"
 <activprithvi@gmail.com>, <gregkh@linuxfoundation.org>,
 <abrahamadekunle50@gmail.com>, <b9788213@gmail.com>,
 <straube.linux@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <dan.carpenter@linaro.org>,
 <weibu@redadmin.org>, <knavaneeth786@gmail.com>,
 <ignacio.pena87@gmail.com>, <dharanitharan725@gmail.com>,
 <samasth.norway.ananda@oracle.com>, <karanja99erick@gmail.com>,
 <s9430939@naver.com>, <suunj1331@gmail.com>, <ysinghcin@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260405114132.310774-1-activprithvi@gmail.com>
 <20260405114132.310774-6-activprithvi@gmail.com>
 <B3F00249-F9E5-4077-B863-EC809A556296@linux.dev>
In-Reply-To: <B3F00249-F9E5-4077-B863-EC809A556296@linux.dev>

On Sun Apr 5, 2026 at 7:57 AM CDT, Luka Gejak wrote:
> On April 5, 2026 1:41:32 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gm=
ail.com> wrote:
>>The code previously checked (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
>>condition twice - once for the (BandWidth =3D=3D CHANNEL_WIDTH_20) check =
and
>>once for the (BandWidth =3D=3D CHANNEL_WIDTH_40) check. Fix if statement
>>formatting to move that if check as an outer if check to improve code
>>formatting.
>>
>>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
>>---
>> drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>>
>>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/sta=
ging/rtl8723bs/hal/hal_com_phycfg.c
>>index 9e523491a008..efd1c76f2953 100644
>>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
>>@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
>> 	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
>> 		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>>=20
>>-	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>>+	if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7) {
>>+		if (BandWidth =3D=3D CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
>> 			txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1S];
>>-	} else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
>>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>>+		else if (BandWidth =3D=3D CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
>> 			txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1S];
>> 	}
>>=20
>
> LGTM,
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Doesn't apply to staging-next too.

Thanks,

ET

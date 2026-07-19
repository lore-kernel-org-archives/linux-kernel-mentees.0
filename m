Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF223112A5
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500598; cv=none; b=S6+YIvgMK78eh/6d6j28RawCofyc9uytypgwtAD9/fRit7h9sxS1h1QJXuZ7cE/N4v81hf4AEa90+RG0Nelvlp87Ldp74OSz63Vj1Ld83EleaejKhfoc8pfKWNAZbcauZzxY4FbnHVBp1MUHPJo46X9Cs7rsFV78eftTL5FOCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500598; c=relaxed/simple;
	bh=TvHQr7mR8zbyNCsbYrCFEQMuGfn5VssLHfQxXppL0/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nR25CaEpP2HAC2N7UUlF0GAXjfMskVRH2uw99yka8pCuDTdM/D+U59RCi/6xFI2AWBa0XuFfFfgFdoDzP31oQbiMvJ/B590Izn6ufF7v5qvJEiVe8U7zU7hgqeyulWSYnWS2gxlsuwUa00mrghIgproa/LxhNajaoeWAc8QiWpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WgNLEHAp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB/2N8nb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WgNLEHAp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB/2N8nb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKREc3487242
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFkbhIWtREEqHp6N9J9dlRkEfhn6oy0VKbjuYDPpRxE=; b=WgNLEHApJybzhVy+
	S6PghIJn/4MFxFi91pBw1Oj1TGh/qA6FIp3pN4TpOIW5QfZZrxwodZo5Rxe4QFCP
	evUeZCS7SXAiOgiXNdTIPLr2aevN0HaTAamrDgm+tW0cmcMDC9Dgic7RTZVUdUXx
	+6e7pb8EVuLXAo1EK7axBw2yJU+sulPBVstQ7oD9dXY3PjgEclvD/ingu0lgMAPD
	j1QZZLxlC0VAwgZc2A1UNoI/helyyQn5l0AOijncUOLRGd90lzY9+FcUYDVfErmw
	GvfQNJUeR+1TacLq4JmmgLy4ZOcOwWqIOT3fwhNDGJpw2w+s62JxHZwyagzAr/8f
	WtIV5w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af3ke1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:36:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso460600a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784500595; x=1785105395; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFkbhIWtREEqHp6N9J9dlRkEfhn6oy0VKbjuYDPpRxE=;
        b=FB/2N8nbguB++W6xQkaz06mB6/R6wyt70F6/U2BDHWqNXeJGy7Ap3kw4Q/D3/yNnwh
         0KPogiwaza/uaXER5uWHF+eAp3k0k33ydI305HGBPdO6PvFG9tI+ujKVAYQajpnVNIvu
         Q2OTRYfOUvlMi9fnmcE1lGfg0UI8zT6Il2AG/niHsN+DMjSIuevi5FYatvNhlMW8PhHe
         /6Xif85Vkp9kApx4U8I9kSJ+l6U/4Fwsdl/fu68mjiGLQvWnvkIGVOtXkXzV/FOianvw
         +E+q1S8ewov+3l7VniH1xPsnj4DL+SL1zSXaKG7ZBSXL8va/rJG/uKzu5jlX8LP+eHng
         C+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784500595; x=1785105395;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFkbhIWtREEqHp6N9J9dlRkEfhn6oy0VKbjuYDPpRxE=;
        b=oVsZACXJLKXqwY1Ku39nS0Ibj/sno5GloeyImb4mr4euAJRpcFdp0YEnSkxM6V3zZW
         sRwdJBrHaaWUAS5HRFmv+ahAaYfrdCiFuhQBb9bckLl9/KE7KpmFBcYHwCmkMfqGmDGp
         6B9Lp42DHAqL/UY8oFbLWJub0/M5N2e4q8GscOIE1lPBLbMIh1/De6KFdWVN5y5ZXwJs
         YZgTedb2op8ujRb2UitP++q5anqb/ZDzDejwPRwrTLAuF1ZqkeFBxkPNdpAiIFQ2FV79
         Wyhf64bcGUeMkfsy5OIV3tnloUqaGA8oEs+iHS+NaQ9ozLa85fzHPhKQnQTZ7awKH1qJ
         VEBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWMhRWW20IgqWyGaud4M4nAuLcG3mA1an3OCImHH9QMGuv8UodeXUgfoUC/5dpu/bxWtWKa0TGJSUG3BIMi+IYRpm1jA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqq5rwVQ65R/ko4XGRJ4eHEcztB15F0UJUH7ovfDZiQVvGM5N3
	P8fFY/Vm+H0yyR+fetE9691K/cFKy+48gCqXGAHBQtkEkyU5upac3NL3TaAmFf5GHMfU/2LYsMm
	Zm/nxn4s+G249W2s7Se9Tf7El+Kpzvoox+A7jBfYEvHr5F6Mru1QL2Z5www5XVr9b52EgqYFtCX
	tWOg==
X-Gm-Gg: AfdE7cmYTpuZ5gIvIMrbzzcUzqnbSZm9H5kfbiseIT7FoXUOld17hf3Gh4R1oNcH465
	SZ8dIu8GIM9SWFBsE771S5qRRL39rqsyfZ0Yylx5JPqsOPFP0THzd8xs35rY6VuOFHFf0t/VQ21
	xzY3/Wq5AupJrJfuEMnTqqtN5BRsifxQZyEj/8xnjSvOqxBEoGDJC8bbT0QJHyifnhZtMc3oDXO
	yNBjXSrJIaWQevTBzM4HdYmsrvwNbOa6fFU6aXObQf4qRW5DsjXXG4E98n21eUyQo2fzLTvJYw9
	19YfZxVbP2FyTHwW9PeNZkYR49mhX7PpjiQieoFho2g5KNlpIdhD1b/I3gQfSguMBruM5KqPO4o
	rx4SMl4mTaAuzMNsS
X-Received: by 2002:a05:6a00:2d96:b0:848:827b:70f8 with SMTP id d2e1a72fcca58-84c29568573mr10913967b3a.67.1784500595382;
        Sun, 19 Jul 2026 15:36:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:848:827b:70f8 with SMTP id d2e1a72fcca58-84c29568573mr10913949b3a.67.1784500594910;
        Sun, 19 Jul 2026 15:36:34 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30befsm4501171b3a.38.2026.07.19.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:36:34 -0700 (PDT)
Date: Sun, 19 Jul 2026 23:36:30 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Per-Daniel Olsson
 <perdaniel.olsson@axis.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 0/3] iio: light: opt4060: Fix integration time, pointer
 type and error message
Message-ID: <20260719233630.70820ece@jic23-huawei>
In-Reply-To: <20260715011544.281148-1-vidhu.linux@gmail.com>
References: <20260715011544.281148-1-vidhu.linux@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfXyFB4Gr3TBoI1
 61OLMZzx1yUYOriUX1f3ROw3rhu7G9mU2vOZ5JjzthCBpzpkm4lW05gbkSpnuBzBNupdBRCQpmM
 c+cMgsRe9j7wDeRa96qtrum3rwjYGNY=
X-Proofpoint-GUID: LPkmJsDzCIyqfzwttroM0eQ2pUGwnBOx
X-Proofpoint-ORIG-GUID: LPkmJsDzCIyqfzwttroM0eQ2pUGwnBOx
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d5174 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xk8rw5UoGxskDpt1Cc8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfX+xD76/Eeprkd
 Jcz/1r/bqx5D+VtAKnOjH05Kg8RZTekry3fqRTkZb82+vwAp6Fx/1y+3NHAFA1M3fzfB+fybabl
 APe6SC1B2VevN1yimZOALd8w2g/2WhjmQRmRVwER73SrrLe+3u48MTyAdKwfc7SUgyryu6+/X+i
 rCdxuHj16+fIexLRAa9sP1eu8UJMNFQw98xx3vVbw8aKpBHdAq4ko7JrwnckRtk9tWSUvi4rLCU
 zMAtegT/6Cf/1ip88xJi/z+Db87ZZFCI5Jtl4xhg5sowv45l6KwnAAK2ENEropAwVSeenxEplkl
 X+9MJX8wOehE4ju7OIHT8Gi3+P3814IygMbIz7G9oGYwYP6zhy1v+S4y+7TPIDBrlglbAT87VZ3
 j+aYeEg7bIlURT1825wB7Fc+PBMewW2UW8Thq876SQ6fmxzEEAV3xndk5/NZtNreqIXr+vgw/JY
 Bla51YHTxZ/KRj0RpPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190253

On Wed, 15 Jul 2026 06:45:41 +0530
Vidhu Sarwal <vidhu.linux@gmail.com> wrote:

> This series fixes three issues in the opt4060 driver, all of which have
> been present since the driver was introduced.
> 
> Patch 1 rejects integration time writes with a non-zero seconds part.
> Previously, opt4060_write_raw() only considered the microseconds
> component, so values such as 1.000600 were accepted and programmed as
> 600 us.
> 
> Patch 2 fixes a pointer type mismatch in the call to
> div_u64_rem(). This is a type cleanliness fix and does not change
> runtime behaviour.
> 
> Patch 3 corrects a error in an error message that reported the
> wrong threshold register when a register read failed.
> 
> The first 2 patches are similar to recently submitted patches on
> it's sister driver OPT4001 [1]. 
> 
> Patch 3 is specific to opt4060.
All 3 applied to the fixes-togreg branch of iio.git.
I marked patches 1 and 3 for stable.  The second one as you note
isn't a bug with affects as such so is less important to backport.

Nice little series.

Thanks,

Jonathan

> 
> [1]: https://lore.kernel.org/all/20260714113134.3445-1-nikhilgtr@gmail.com/
> 
> Vidhu Sarwal (3):
>   iio: light: opt4060: Reject integration times with a non-zero seconds
>     part
>   iio: light: opt4060: Fix pointer type passed to div_u64_rem()
>   iio: light: opt4060: Fix incorrect register name in threshold read
>     error message
> 
>  drivers/iio/light/opt4060.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> 
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa


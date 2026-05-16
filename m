Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A2341AD6
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946000; cv=none; b=aH3PYp4FredDiieNTxzKhwDUzXgxl1R4XfwpYFSeLJPKDZ8g9CMyxE9ZF4GK77z+0Wyew5lUTBgDA01D7R9Z4D3v0C/xOxjqxpAKjGdbb2mw2fDKITIrlhXvjib0acbJN9p6/01ugTbA+MakKppiejpr2j3LQ10zNVsk+FCKzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946000; c=relaxed/simple;
	bh=gsuc/6rRXcH93VmihWQS8s22CFUo0ceUo3PHNdoRaZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIs7tkWVOm30X9FaKkjJBpni6iAmzQgf5nUP+2e9V3an4W/jtqAKr90DFtQdmAwjjRoo9s6c6fqGsdc1bHfkxFZ/9nx5LICbYGfgCvfbA7LXg/5N2sY/oM3b17cDu3aSTY+3sI7aVZZeyo0aF+BCslQYvoQiDkTLtuGVf0/YwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SC5M2aNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dITwG0o7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SC5M2aNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dITwG0o7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3gSnd1903216
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 15:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fmhNdNRYPDgmzCrmp6j/LUal
	rEUVxqlvgGWshjsZhC8=; b=SC5M2aNTA9ZssWFVthk3HKO7DRtEJpGnnZQGsLsg
	R5RlJd4i+NqOtu7S585ZrA05BkGxXOGeJmgEJX97BFWbl6xoSzQr7iQj5lEyuiKZ
	qe/+Ag9gQm3g86FM7oRQMJ6Rj8dk0XjPoNoeyexvu/cCKDJClxCZnT8Pfb647oIa
	QFdD+LpB4bBSHrZ7qb7V1jA12XJSVvFPvWH6xHCzM1qGIR5Yl1DBgKOOiguhiBvg
	aj2BQadhXoeuB2JjjqFkDFojlT4FcK3Qa/0inAgGcTISQHsinzWFea2bASMYzQIX
	7j7hZO2Qba50tPg1R6oi8ntISwWm4KN+XEo3Z1fkC9UwEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwm95ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 15:39:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso23235451cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945997; x=1779550797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmhNdNRYPDgmzCrmp6j/LUalrEUVxqlvgGWshjsZhC8=;
        b=dITwG0o7lwxinoXj5LD62eAn5yykbywn/3ftnj9LevEJo54+4OXda/qm9ekSgYndUy
         g14qwa4BXDJiacJ76rrGSW1ewXvSV52o/S1+KHlS65slVE2RYP+kKLnRTFzn+xLkUcvr
         2gyfeG1YpVI1pJTcpMd1Wuxhr9eLkuuUQWwunizOJRT092GfU0UWj9ciNMfP6wOQhnsZ
         PEQ9+t8BLmGuNdOnmz5rLGhXerZ1xBNYfEOheX7+9HkaiCu2KsAddbog7yrmiw/BJPWm
         UAhPFFfInmo0tKRbX0FyM1DihhjO+dfOvWAGMazgNWo3037DdGp0ytHg/Q7xhsN5t7fn
         regw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945997; x=1779550797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmhNdNRYPDgmzCrmp6j/LUalrEUVxqlvgGWshjsZhC8=;
        b=RGayEuMa6EZKitokquEceKZq32p+EUnoQEAUTSUVFDhLOc9iKbkZMMdZ26c5cqkAK+
         vc3WLJZcBPKe7168hkD2wOStZpYjXHSMyBXdnSQ+hE7+CFZgD/BW+RPgHqFMcpD78uZb
         NH+chZ4BPBekTy2gbQUfUFg/6RNxv+2HIitu1lyJnr3JcPyU9ad3v/k32f9GYoYPXxMB
         IQywdIuH9hBZHuQi9mOgi7vq2ocmEsbKBHpfe+9KADhfjYkmwbXSxgppM6jDuXzNu1Fl
         WMLPb0++AEgfjIW3t3QaWxfWujtA7iA9NBS6s0wAMK6W12lWZrF0tGoGMEXz21ounZNw
         94PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lbGGOFrCLDLD6F+4IYPYmhWPwJTPC7+t7AssMQEgvAAG1WZxzoFeI0ZuNqumXaKRlYnJF8CmdWfPmNES7n8cNKG2few==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJMXdCA+mDlvxXWULzW/CuU0tld1Z0IzEAy/lM7ISk3puYYZ+M
	eYZAgARlHh01Xnob0/WjjPHGU+B9qvVQNNhKsFUW99LoHYw8TXueb8grPTv8WKOIdwdfHCA2K7l
	TUo2xQeW8O67KedY47UmErm23X0/R6bnp89s5gJKbXiQGKuchRTGtAXnpW3oBY/k8sIwWq5Obsf
	elEA==
X-Gm-Gg: Acq92OGDaWdCb7MQ8zCA4YpKpzA+V24cZMpYuo8exghJbs2T/kZc+EmPWfTGhgZapuJ
	WR9pCv8/l6xnJa/RCdq2hdVm1jvrn1QUp6iNIQqG5pmawczFTRQP3RfN2vZCTvvJ+ngvJwp5ZoA
	I/UnEkELgkQsL9a7+BWWEFdJTTarJTx7KruS+ELMRRvsrfgA71m/dJgEil/Y6fQqjtjh2c0g8Oz
	LV0p+hPan1tjJpgk1FufH9oBROq43YSkJu2fokKUdZoWSEl+cCCi/gp0Uvqv7h3BS82H4DFF5r+
	QeBiIpOlOcuFh4O6FxoUbc1gvXA+9s4PBqmvqSbPqCqoIP2N/zQS6igprOaEl+Wma4jXO5ASR0M
	ZH+xeEbdvKK8d+jEzR5LnSTIOxCOUr/dMIsMzU9xXyRcVPXuWiZtB/+S+PL2WUT2FGMHwZTW0vr
	icpxe6RReEogBJvxLeFQPOG5XpnXhrhcB6iU0=
X-Received: by 2002:a05:622a:8596:b0:50e:c093:9051 with SMTP id d75a77b69052e-5165a1eb8c3mr101645751cf.30.1778945996857;
        Sat, 16 May 2026 08:39:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8596:b0:50e:c093:9051 with SMTP id d75a77b69052e-5165a1eb8c3mr101645461cf.30.1778945996423;
        Sat, 16 May 2026 08:39:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11b487sm2044495e87.23.2026.05.16.08.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:39:55 -0700 (PDT)
Date: Sat, 16 May 2026 18:39:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinseok Kim <always.starving0@gmail.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drivers: qcom: fix typo in comment
Message-ID: <u2vuydd2ubtlaaj2mgt4nz6gy5nhifh3vcpjhmdtyl5kod7gdg@gnynbkt24rer>
References: <20260516152324.1863-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516152324.1863-1-always.starving0@gmail.com>
X-Proofpoint-ORIG-GUID: GzIiiZPSX58lnkchXBbdcvstf-UkgIuB
X-Proofpoint-GUID: GzIiiZPSX58lnkchXBbdcvstf-UkgIuB
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a088fcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hEL-7WqZ2Qmr7oYnmoIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1NSBTYWx0ZWRfX8OpDOndsIhC6
 vSLUFq+aWnt82miEvSpVfv1cG+VCeuHKR5mj7jgH30lAFgoYBWwdNoiKwqQPCDSVdoNb8zoQUif
 kbJlVi7yzpd8r56v+T9QLivdh0if6zbFMegpVcvUCQag8qt9BR+UGuxK2hW//fqmN5uWMTlSYLl
 DXdItHj1PnIKRcurkRo42valDnl9mU6LsjOskLdUgJ+SF0gy22+5ntM+p32jRG+tlhBCNcnPn3T
 pnM+Uo1F5eNj1CPATrDixMLl4m7VrhjQVf8sEAGXn06YRDjbSFTomuaaZMEsWbt7sB4gtHAovdv
 o2TsRozB7DoMn6akbAFu839PoPws5PjPkSSbsOxZnxfZHxkd1DCimmhFuJYw8Oi5J8tysC0mFnM
 GzP4YayaLmYipIy8laUScTImkCAZD0FmT2bUjulURAMQUpRjOEBuFaQ9zVXspzvTvQGm/jErker
 pLWWyCGcqlfeBMAx53A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160155

On Sun, May 17, 2026 at 12:23:16AM +0900, Jinseok Kim wrote:
> Fix a typo in the struct tsens_irq_data comment.
> Replace "uppper" with "upper".
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---
>  drivers/thermal/qcom/tsens.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

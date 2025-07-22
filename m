Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6917E4
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753211147; cv=none; b=aNxSURvvLlHD3Q2HKpCzUKMHp6xS+PnhdSr4sNuTmupd1neq8magFT0gH2sPCMQa0E5NqM7HWRxb/WwaR/QxgvrWN4KN9bmwLY4cdl7XXCyOgNW+sM7Opm12Sr1BGskLTNa+Rj1riXq7EZrD5g87lJLRIMnyKZfBW2mSEXjqatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753211147; c=relaxed/simple;
	bh=xZlxAmn3kRUUxhK5EyFi4gKntDMk5ctn9fLRRBn2z/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gds9eJRlt3zesO74PSQC94jq9Ws6WdmYUcqIRJI/XOAQBp8gOgAoylVLyjz1N7tS0bYKRMWejBuvss/y0qZn+WS8ydNl80AS0fQec92dVfM750Puvrn7o7EpzfIOuYxSDIVioUB+fSjJCZ79HKDsSCYHzjaIAFaQcc/+zcr6Pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MUxoL7Yr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MUxoL7Yr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MI3lv7012535
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 19:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P2+6l4qAfd3G8OT0Vp0C7LdE
	m1O9SDlPysbdkSzFPqg=; b=MUxoL7Yr83E+66mLMhAAylNYCqeVBssfMOlrmT4S
	aAbjRbfxz0+QE7G2I3hT8WVzhyN9cIyCDNOlDGs8qUjrVHsHNB5+SznDuCxI/NmL
	D8YY8gq4AZtUpYzHJTaGtePF+jv6xZ5d1syLl53KWwgNcji7lUHHw0idozwBbuOX
	I2SoEvbhgHHIBUnySrmJzzSWEpJPfGR4pgOFRK+PXzvnsfBHHEt01U9VozkdoRe3
	uF6uGBnVid5pHvfGaUDSgZ3NBB8N801sBD5eyPE67oHK3FL230RT//0e1GJt0tAs
	GYh4r5vWb5o+UmzGzOC6eRLhVpeXtmYOph5AAFLw4kvXuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6mvtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 19:05:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so34723685a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 12:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753211142; x=1753815942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2+6l4qAfd3G8OT0Vp0C7LdEm1O9SDlPysbdkSzFPqg=;
        b=NIaPh0S3G+5kE0t5mOIg4xKGJ7b7PiT7jlFdTMrO5XQPVhQZfMafe7hf4QKfUqdhkt
         piQlZMC2imospYlhO5UYp9C00jh781BR7l7ZIFISGbSQfd8I0UhVh6N3ktIR/MSf/Sgv
         7mKGkipBcQfQ6IqDG8ekk92wxyBTtUgXCiS/Cmk5U7ss3ZAMf20SkGSxs4N+5SsH4PD1
         4S18lwH0BM+ko1tbwUitzoGkP/Z7k8YRIXFb53cFJ2momOJ1mUCTF+d90x1wlEFkUqEj
         Qfuol6BchnHqWJJpB6Kf0AUhB1CSySookBo04BamOePPoixaWiG5fONuwbIpMrxZqFb6
         pKrg==
X-Forwarded-Encrypted: i=1; AJvYcCUCMVk9Iw9Z+E+9rcPZBaj+xvhbzcHyN9ib3rkJtY2syBQUvFv6vogervWuz+NWM9bQXjj7+TfIeo5UWcLF6YfmCgVQPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwKmZGUnS/t9PHWKHlVvFjVMVyTBCsoY+VM2KkM98+y/9lm0yb
	LPOLvsUo0sLQxLRTAfNwjHdUmHz/pJBCgeV7Y7coSp6ogXSPo+WK34xNjGKufA7o6VElJgFmw5j
	XypK83SlBHFMq8bgMi9QCMvYCZal09EvWX06V/zdf6dg3vEyfpwhTYe+P7NFRmCp+nsOLb95L1U
	jTkA==
X-Gm-Gg: ASbGncup8Ccb6GFMU3Wg+Etdg80bpDkgHCPlzgIrUq6atXYVT810sYL1xuOMjV7I8sE
	DexL/GGPRPHjxtQo9ZLWWBjNNTXqb2fmyQL17xLSp73XrQa+sm8pgBXA6Qgys0JApanvx73jyeb
	mDh0jcFRCxpde4dySsrKJ4NIjGc5YexW1xnWT3qAMTrYtLp8WWoxVyy23dZocOyZZVlMaWzmwkV
	M78d0wL2sfDRI49yYQ1t2R1pJaZU35KZymv6M6dSIgih7raeLvXmYxRUnue0sDbIEq5EaHoGRQF
	Eghk5auogrSceksUeSQA9NM1B5Voz6V+BFmpxRF4eQw65c5HnJArBb1K6MbEqj252KW8L5373v0
	nPzG0MBmYZzUCELEQ0JQIjhCO+FWxr+px7Md+KgI4STZIyTO+hvOJ
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id af79cd13be357-7e62123d2admr639045285a.18.1753211141831;
        Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnWw82SLv09ir9ZtrixO/tE940fX1DelTTNbNTu76eCwjlOF98H3Zx1i+G/fDCf6mx0HVYLg==
X-Received: by 2002:a05:620a:7004:b0:7e1:aeab:41b6 with SMTP id af79cd13be357-7e62123d2admr639040285a.18.1753211141325;
        Tue, 22 Jul 2025 12:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aba0f7sm2051200e87.83.2025.07.22.12.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 12:05:40 -0700 (PDT)
Date: Tue, 22 Jul 2025 22:05:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: dianders@chromium.org, tejasvipin76@gmail.com,
        diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty
 functions
Message-ID: <46h32rtuyamdvg36wegmi5fonfg6o6gau2ek377mhumscd4k57@3mw47znxnj7p>
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-4-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722015313.561966-4-me@brighamcampbell.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687fe106 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=cm27Pg_UAAAA:8 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8
 a=BQFrTPDZmi-2fyfDvBEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-ORIG-GUID: VG2jeQVxwQtb8dSTOu9OEtVE6uqqLYSO
X-Proofpoint-GUID: VG2jeQVxwQtb8dSTOu9OEtVE6uqqLYSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE2MyBTYWx0ZWRfX9Uc0+S3kWhL+
 fOUGJXiMXN2BHhKWK2EN1TTZGXCZO9GQGGx6vSIkLSGZRsKpifP/qoni7ykYpon5rWSrckaMQnH
 3GLYylBr6a/5XwNHrZtAZpULu3Wg8uJC3gj1IqjoiJEq3lH8RYhYwy2/AN3DDDSKuh537MZlmHc
 eEZnRNzioFZMgfWaSpTel1CWTt6Jxh4W87p3feq4iWVljXPlYs7C3cMhwwKvpXjHbuVBZwesYB0
 PdVNY6qoEOE8v9GRhTc3BVtFEus02WFdLC9doAdkU30rfgCHpJHPKYNWEUqs6m0RSTKNMukk57/
 3tUK65sEYpkspn/Al0w5Sppl5NJUQwoaPY0zJrGNVYVBqzPQ52kjDE6MMTly2ADH1XMU37BPgR4
 axvCXMBFO0kegyozOPfeYDya1AULgltZ2kYQOTdvQo1FO9UKz44ERHc3OHHFi5c3ACWCJ+gy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=648 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220163

On Mon, Jul 21, 2025 at 07:53:10PM -0600, Brigham Campbell wrote:
> Remove the deprecated mipi_dsi_generic_write_seq() and
> mipi_dsi_generic_write_chatty() functions now that they are no longer
> used.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
>  include/drm/drm_mipi_dsi.h     | 23 -----------------------
>  2 files changed, 3 insertions(+), 54 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

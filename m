Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABB2882D6
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500413; cv=none; b=CXewY5Lz72j5dig/F4H2SakqgfUo1YHf/b6JNOTb6UyWL41aO6gKmBxOxjj68oy7Omx6ZHaLwqs+n7kg2Hj9bs1SoxlFV5jkhplk2gMEUVB9E/HfS3tbS7VXX5b1fbScLMXyWbJ9OdRl3ijF5YFOyn76A44BlRObfWUYq9+KUfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500413; c=relaxed/simple;
	bh=A+MAGlHGc7639clWxnuKkMWhNYoOyugnRs9JMuPKD/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxZUTiG3/n8PKko8QRI0uNTbDQzfMruTP7ZO9B37/v9xbrnoM1UpQJPGPJgS35kf9rjq9/3TpEuOPN8gcnmSY72g25vpbigdvYyIQ6qQY5zCYwF36NDoMlPnuQchFs8+jDgVBVwNGOrpem0AC6MiasQaKxYlVXrYlCOol+IaLgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUyZMrGU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xfr2w4mG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUyZMrGU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xfr2w4mG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKR5LN380175
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHpQegismISCBcr0pjd8FGRJDhvoNvDy8vtUxFm+3rU=; b=OUyZMrGU1w19adXO
	Finc6n82WIiQkm4WSRF0dt9G413+aOIcoHdpvWtMuRVHiJ2vNVr6+/U/BPMkp+TD
	6pAmyzdRsJ+yVCNen1oRGj1V5wQcgWIWK19sy8V/fE8hWfbblqf/aIxrJcgZZqQb
	8VcHPdgloh5g+rMuibFTm3rgPjRCBq7vaC6mKos9Ct79bog90Nhw7aWsEDQ4Bf1R
	BRp4xExEDvSqJqDXyJJmoE50BmrnaI4rUM/E4cQ5VfeZ6Tz0oh7W2m3+aSIkNdpg
	fdoYDhjR0PEXStcZcRegjmgrfFG/1iY2qEYvBeTNUwAmczGzT/v8vurNHDYCy51Q
	5fizjw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04tjmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:33:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso129502775ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784500409; x=1785105209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHpQegismISCBcr0pjd8FGRJDhvoNvDy8vtUxFm+3rU=;
        b=Xfr2w4mGvc4J1gJWr1gwrLVIj96wwFqFubOZRS66BIwlSkpRUl6uo1XhagrbIyXAo/
         VmMNSHB0b97qznp5TZqDHo5Cembe3AiUjuqg2hAteSPt8Xza4Egvo8VQvfZ97FJxU9Fn
         FPmnh3SyonPsw3MWaR5sKCjE7TPdxjj8TJbYIYM+XaFg/yYADlgnv7PIoUwr1UTD4FrX
         JMfqX6jXG946sp70IBJITEdEVMNjfYgW1F5e11Do/Bxx+z7d3XkoeFwpuosoMlHVbpU+
         W0q9ddp9LRUSNdrIMTX2gdw/zRHZ7h8AJhdJ9qp8P8pCeSjxJKdhH5H5bKciCmsBmEnP
         ShDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784500409; x=1785105209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHpQegismISCBcr0pjd8FGRJDhvoNvDy8vtUxFm+3rU=;
        b=HaaqGzcXtUkepACCTIh7tQvpmv2I0e3TLmbD8d0ITSoFlEocyco/NphIyaS+bTUb5D
         er8YBKSy+HGI3FvpYSW69Y4u/INVM0AK5KuVDNCu0u6pAZnnazR/IvlhWUi0+Ymhohu5
         By2VCVo5wsdbQIvG4wMuLdHOS9Qpcw+uq11ugoGhfvjYKRlWzQ4wvc5tTwq+vD15C9V/
         xUM/cZj0qmZEeuZ/GWmwDc3WdUq5vOh5yZKgOkj9hiEK2OKm4mbO2GwGlqdLoQTzHBLm
         peSlZwV2Xawd9Lo27WdcoUrnKZA0AF+Rrmy/9ha5xPFhoLcnH5ZvsYjJzo6wD5GI1Jh8
         CuUg==
X-Forwarded-Encrypted: i=1; AHgh+Roj9olwyCKOEred7gDQ43iSEvIp64hg4kLUFpxOLuJa1lRqDvXJ2FouoLiAXxcOFT5JARzbJi6sG/E0kC2TbCJHsa8w4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzryxc0r4LuzbVHSkpRQjp9+Sjr98wS3T5+jUThWvrBcDtDuMj5
	yo0TS3ORStGUXU40PJ8bxxJwGJ/fRo4gHsqn8QkHWIyroFpC51eWK/XXLaCQsp2EQ38dsROg9bF
	kkPIuicI0+k/3f+SywTN6pHOcn+C1wv9BH73MMwtu9+zDyXGT0k7YQ+ctIE/pGVxtlbvZGcIvtN
	O3nA==
X-Gm-Gg: AfdE7ckOu+7RKqYIZYUM9fyKg6tiiYfEKF5GOuwz/x5SkmmuuyF2/hJ7BHVobWqR9/i
	XZkxzKC67Cg1L2AXtAWFkaqcDMsAufcCYJpvg90YqSSttcoSZ9GYda0SR1a2yhpMwDlei/th39D
	kY5Mme9t17gWleMYOoSs9IDgQDKo0NZ+tldZI/INtHIDKq6yOd7WH9KPXCq7ckXn+clD2/LkKGV
	qWtoefbl4LbDEQZ5AosR1Sy2VF+Sz2R6kkiQuPDpU71MWdSbbK515vf5X8MVdMvEUco5ffvAZ5D
	q5SSw/MdrDa8mGgpm263aUa0PbGmthsMsY3AjyU3XxzbB1MTxdNTA2v9bdaGNRrBGdohCkUdku2
	+HW1+7i9WvTVIIMmO
X-Received: by 2002:a17:903:2c03:b0:2ca:3df2:919a with SMTP id d9443c01a7336-2cf349c24c8mr130707435ad.33.1784500409326;
        Sun, 19 Jul 2026 15:33:29 -0700 (PDT)
X-Received: by 2002:a17:903:2c03:b0:2ca:3df2:919a with SMTP id d9443c01a7336-2cf349c24c8mr130707155ad.33.1784500408875;
        Sun, 19 Jul 2026 15:33:28 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346d9bd5sm46160675ad.45.2026.07.19.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:33:28 -0700 (PDT)
Date: Sun, 19 Jul 2026 23:33:23 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Vidhu Sarwal <vidhu.linux@gmail.com>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, shreeya.patel@collabora.com,
        dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
        skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: light: ltrf216a: fix runtime PM reference leak in
 error path
Message-ID: <20260719233244.0a3fd246@jic23-huawei>
In-Reply-To: <alTb4-sg0ukY1aYI@ashevche-desk.local>
References: <20260713022829.234370-1-vidhu.linux@gmail.com>
	<alTb4-sg0ukY1aYI@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5d50ba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=jVvKgFSebWTF7iFRTjoA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfXwle1p48h6QgL
 ZZjeBBOIhycMn1rbx2upnFuWiA195xCUXtALpHbgDshv/o4kOVvD32n+2aeF09Z+gMsJg5Fpy1f
 RQXvX4dB/RvvXSaixvMR7n46Gj+sS79l8uBcXD+Bl42LyZKEHMpzqOLorqtdTdywE6/ZSjn62bE
 zROKtSCBmapd2ffAxoCUPutGo/RagusyJBE3EEqAsJ/SN0q8Zf4R6xmloEsVOVwDQHkaNmjCiOc
 LasX1nusqIYDvF1x2oF7oro32pqDOZJfcNmsMDvUqbeLPtP/GsIi5bdJT6mGTiQH7blgz/hYzO1
 AdlhLMpR6WF26F4MgrYDnHUo8ZjT2Q0iDou1CF4RJqjt44ZCjvkXQM6GsoCur48/3Ruo0q7ntTm
 QwpX+tUANJBbOf730kDlqB38y7wgP8i2FxwIWNbys1OF0CF0BhulcUeTcI5JOEKEcYSC/GxTlcW
 dgWvykCVr8GWYO/zvQg==
X-Proofpoint-ORIG-GUID: iLHbZp8jMnbPKobSY7UkxOzdRTf5xPLp
X-Proofpoint-GUID: iLHbZp8jMnbPKobSY7UkxOzdRTf5xPLp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfX8lQ0BNgdwzQ8
 OU0ORUMke+bV3a+akc6BMmYaE+we2RlWCJ2a4vCI0Fj6L9uZnKAS8DmiWLM4kCiTAJc27SpTUr2
 bbCAWYCIYZc76BKVJp8o+F6MkeeOFe4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190253

On Mon, 13 Jul 2026 15:36:51 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Jul 13, 2026 at 07:58:29AM +0530, Vidhu Sarwal wrote:
> > ltrf216a_get_lux() acquires a runtime PM reference by calling
> > ltrf216a_set_power_state(data, true). However, if
> > ltrf216a_read_data() fails, the function returns immediately without
> > dropping the reference.
> > 
> > This leaves the runtime PM usage count unbalanced, preventing the device
> > from autosuspending after a failed read.
> > 
> > Fix this by releasing the runtime PM reference before returning from the
> > error path.  
> 
> ...
> 
> > static int ltrf216a_get_lux(struct ltrf216a_data *data)  
> 
> >  	greendata = ltrf216a_read_data(data, LTRF216A_ALS_DATA_0);
> > -	if (greendata < 0)
> > +	if (greendata < 0) {
> > +		ltrf216a_set_power_state(data, false);
> >  		return greendata;
> > +	}
> >  
> >  	ltrf216a_set_power_state(data, false);  
> 
> Wouldn't be simpler to do
> 
> 	greendata = ltrf216a_read_data(data, LTRF216A_ALS_DATA_0);
> 
> 	ltrf216a_set_power_state(data, false);
> 
> 	if (greendata < 0)
> 		return greendata;
> 
> ?
> 
> Not insisting on this. Up to Jonathan and others to decide.
I merged a slight variant on what Andy has here to keep the greendata
assignment and check closer together.

diff --git a/drivers/iio/light/ltrf216a.c b/drivers/iio/light/ltrf216a.c
index aad96fc91565..dd8f3260b1d8 100644
--- a/drivers/iio/light/ltrf216a.c
+++ b/drivers/iio/light/ltrf216a.c
@@ -248,11 +248,10 @@ static int ltrf216a_get_lux(struct ltrf216a_data *data)
                return ret;
 
        greendata = ltrf216a_read_data(data, LTRF216A_ALS_DATA_0);
+       ltrf216a_set_power_state(data, false);
        if (greendata < 0)
                return greendata;
 
-       ltrf216a_set_power_state(data, false);
-
        lux = greendata * data->info->lux_multiplier * LTRF216A_WIN_FAC;
 
        return lux;




> 
> 


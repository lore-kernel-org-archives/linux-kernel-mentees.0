Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9C331714C
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500883; cv=none; b=AlQppJNlUmPBAppCxShB/PuY50Z/lUnXBdqFiN4gfqqbunLGlO0n0LUgI3HAfxdjpSCsMkA26dZw34cs45/XPwc5O8z1yS7xBcBhSG7iGWjPqsGLSDbsUg9zRC2pgSErCrB2s7ZcEoJI/iGuj+um8YV6gQuemFeFMGrQCQaHpKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500883; c=relaxed/simple;
	bh=Hu3XhQuZ0TYfdwZPUp9ITftdo6OiblAWkpOPMAPxcYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2ypJ4+wMljq+qJg1V2qvVXyP0RjtnGht+3dVR3dhguvW4z5ukVqik0hm9Xju5H/lohv2wylI5rOPeFFNNUwmnNruWBlvN5QjG9R9YIDUMg/QGNm8hGSfDhs3IB7YKmK9DW/t4CsfAuICyLtVgfrUzKpPiyfVNpsiZge+0IHe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjuAtnZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4tn9gfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjuAtnZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4tn9gfp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JKQp6k422137
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=; b=MjuAtnZhnwDXNHXH
	LgBQX1cf2yzabCiy/D1e7BbDxjyeyG9H97/X79zoQDWmWfnLpAuo+gKn0rLXVCLw
	nxULbBkN0wn3w/Qw0kRdbMJwBsgW0hyltX53LlAW/UFy0sfevW3FR/n5VYdzNJL7
	JRossYgWG7kDlJcCeAyupHnyOdtsTGqrzY3QuRW8UfICX1xeWeeY8Zp8BsVEbDiD
	DBAiy1/hRtuBdFPKaIQodhqMAny5ZWWOkhhlkO/HkHkXSdqgLQWsn+8iIN3BrArV
	h4Qsm+zwMY4VhWkRY8iVYLNYVuWExc+R/4C+yNzpSpwHMe9Nl9dVqjSvwmRysrB3
	Bn227A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc3mkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 22:41:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf27789c79so42265605ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 19 Jul 2026 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784500879; x=1785105679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=;
        b=J4tn9gfpkCVcztsaD+tClcuqgpkh9XAfZ0cRE6BYhSPtWHzGUSDUCbESrODuebYWaG
         MnsjotlkpN+M89lE0orP+TKrqhjcOtHbAYsNW6N52HUFBPYf3yonwldnCoI+VeqCUSiP
         glBzcsJPe7DVkFKWVYeLRpCEp+rnE935S0WIFof3XeRC5dag2i3xlQX/0+SvAusZmmLk
         cqVQoRk95S/VXZylP3sn3bIMUM0cwlmSQ66eKkFo+CO+67LgKdqI/fAjHOalY9b7GC/A
         nxoDN5MjN0Flt4tFrOUhkGD+KG49fVrKX8PzPylwzNvURuW4sMNezNexup0snpWnG37c
         NM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784500879; x=1785105679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G14pMQuK0WnX0nA66QGQu45FpDKSIwIW+JyHDqzn2pw=;
        b=ZIGBVCUbouVPZ89yg1++N33LuYDVPCG3kB6wJEpQBAoGClyMeSrQaR4bgAym/bgcrq
         365g2yjaXbzjtmAY5xNRtOdjgYDlBqLkXI/fCwXDXx+iSbsGDE2bOIvModRc8NHD6L1L
         CPO2kFgwo/SPWqX34lkY83PGdS+9KqatML9VA9JWADdzniE9ntyQ9L0P3OvoMZiVQeZZ
         kXHo0Yh+7yzINPUalxFBdkIqvc5GaWO/rsl3DBnj9gzfd4UfjxBDpR3H1iVjCbjU/NGn
         rk3F6tkEvpOfZsE5R9sJfKPzS33GcqIAP+nADBY0QYeVM048pXYIU25AVhHgRhx5B/9r
         oJ4g==
X-Forwarded-Encrypted: i=1; AHgh+RoetyJZ4/8TwQtRSZyy7K7PY8uCpgmTSGBbrwz5NO5VG8A/AE/1JeAlHI28mUao28U0mL1DigAc12iXlLF2PSwlb+95+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwubBT0BLKHlTRDbPc4evdjPAmw0HXwviohNS43XD+xbSqofuPJ
	JFyLEOcq0Sqi5CF7rJQIBjSIgECzEY0zfR84ixokyA68u4o9P9N8xkoZ/efsy660DcFMlwia653
	U1hxGV5bmiHV/ZEYihlJMM2NbEOUmlakjUX0KZDuHxkLqOFwF02TiQJ7WC4mKwWHLMeRB1fSR/2
	8WYQ==
X-Gm-Gg: AfdE7cnB+h3SGvzUpabNLpGznqMj+a9t6ACb+8iKrB7k9oqJShSohRITn6qBhBXx3bL
	vYyVRHlRnnRN11AHbrqDv9NEj5cQlR4pkSjPL1L5sSxajtLLJgWOGQ35DP3Quh5uMunV4fohYAG
	oYF0OdHfoJjszQOC41bwj9vHUd0tT2aNQjcOZFGOIy8/a7UV8PWTeE1oeegIHITMQ5IS2mrlu93
	Cp2Dn7Gis6XrOOyMAer2TvoJ4vZfGfnsSRtvcwu8bTo7CJiuL2kkXPyBVHmlB3Jk9GI7GXurxTU
	3evmKnEqxh5luwZRmtiffloXMy5kYUCqanMriSQ60ZdrwSqN2/KPccEZG9MWVOzEBcExNKjzH+U
	WFWVw/w0D605hSivN
X-Received: by 2002:a05:6a21:b94:b0:3c3:8d4c:667a with SMTP id adf61e73a8af0-3c3ad7a4394mr12721149637.18.1784500879605;
        Sun, 19 Jul 2026 15:41:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:b94:b0:3c3:8d4c:667a with SMTP id adf61e73a8af0-3c3ad7a4394mr12721135637.18.1784500879183;
        Sun, 19 Jul 2026 15:41:19 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb51a2c2a13sm3599068a12.31.2026.07.19.15.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 15:41:18 -0700 (PDT)
Date: Sun, 19 Jul 2026 23:41:13 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, nuno.sa@analog.com,
        andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mranostay@gmail.com, ~lkcamp/patches@lists.sr.ht,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
Message-ID: <20260719234047.629d1a8e@jic23-huawei>
In-Reply-To: <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
	<7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfXz+pmh4GyNzZs
 bJG99XOiKMARNLYqkOJfs1eQHe6lteNOU0Y5NPaYzaQF/tsCBCafyy65Mi5y9SJEZtfkNk0PN2x
 aZQzop4hTsZ+vJCK9AUgSjU6kbjt7To=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDI1MyBTYWx0ZWRfX5uj/6GCPpU6m
 48Xn3lBVICQTy3hLG5Z2J15xx9vKzPBdpHSmF6fdIG8pI251NMSmKbrh0rCY08SOFpMVIlBTuLZ
 5e5iv6Qdo8sBZ72bn2TXdUUS8dJTN13wZFUuZOtry4fYLXLec1kInWmmyxImIgi9sygeMQoMccH
 Z0qSB5GsuE6gngV+IK6jnd1EOeWWYBRHiUsp1VVstPNULhL0fVM8Hq+jVcksAIKeq6eI9U6VNqq
 3+IL9CqUU/pYYvOZDVvQkn2XI64oYLEvwoVS7uC8i53HPLgsghiZKiYx9fQKyq9NzZzL8ILWBRS
 8qQudIO0skkcpvPJQqOlW2Gh791UhsGTnJ0MHsjre74aVievgMKysBH2N8ATcnRkOftJOYrOG8b
 LnsiE5PA18qeTPDGtXN9aM/nqCzotsiwVkXJYNMNI3Sylnuz/v+m6dGsrK/1JZU7/hLTEaa5pxD
 NqGgOTHiVQEQh17BhpA==
X-Proofpoint-ORIG-GUID: _3poK-Yg5DdJjsrkLZT9oIDdJfRuF9eG
X-Proofpoint-GUID: _3poK-Yg5DdJjsrkLZT9oIDdJfRuF9eG
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5d5290 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=XdlB6Cn_7BDTE3YMWMYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190253

> > 
> > [1] https://lore.kernel.org/all/c39a2980-f5e5-44aa-9fd3-20e0658f62dc@gmail.com/
> > 
> > Changelog:
> > v4: unify patches rather than using a series to keep the tree bisectable;
> >     rewrite the commit msg, naming the devices explicitly;  
> 
> We lost the IIO driver patch though. The change adding a new compatible
> won't be accepted without it.

I think it is fully backwards compatible?  If so we don't need to do
anything in the driver. We could tweak the name, but perhaps not worth
the bother in this case.


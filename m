Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426446A5F2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151243; cv=none; b=Nu3sJpcrsvHrqd6XLVdjWh0+Oe1mzOXtWj2PcAisEAv9a2FZ0bopiBH/Xmrfjp5V2dp10Z8potYHaK+eUkP4jYwPDEk1BM9dw9lMe81MO9I+e2940i3BmftRLyeN/atvR8/TyxpbevZ+gdKAlXJZ2mlCj5ikO6IKDWv3Wn8bq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151243; c=relaxed/simple;
	bh=UC0vpk3r8udDGy5C5mG2ypH3ZjwnNmEG55Zvc9D1qJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0HQsnF4M8TEKBljJ0eaq/Ug0mRnPthgoziUpZlchZ/KF/0VQEsdT/wleuM7f/xcj4gZbHUfw8CWLReNFLp3OZs24rWGHx/82WvCOUQTaoI4yvJr6IlVVE2c9ziA+I/PfQggk97JpSPuCCKq9c6OvEEBYVWvsZw1ZAYPVdTu+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc5nEqxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVGJ+HO6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc5nEqxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVGJ+HO6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79SeP3544166
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=Pc5nEqxjyffDYNoL
	tCcYpKJMosbu75RawY+Dy8ZYulqkAZflg/y6Oy7BWAHRGabEX3UExzWlyyrDKS2v
	+U0kLdTnitIgjKeznvUsuP45A7vKa+gXh21xgveKaswqj0dkQFHDKYQxcxCJ+AOO
	jRmgaF7CV9A/K5FmndAcZGU0gsocGLj5XdsnogVlLSN3XQXa7c24JaL1osIvNdiW
	MEwyDIhbhRJe2uZcNmOYVgcwA+X/26gesM5C9X6yPwywAm1cbXYvaLsQRbSgTIxx
	AesRnxzogbCvjmiVjbD7AdKR1ICPfjTBJGSkBbE5LoZ0ilWlP7IFM7PL92/0Gx5r
	db0C1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428smyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:13:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a00c70d28so140934485a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151239; x=1790756039; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=NVGJ+HO6Eqj6Gzo6W1maheNKzq6vr0yMaZgVZjEHxdOIM1Zvx+2+RfppiptrjZKi12
         QLwkgxLjnrEwsfVldLx/vS2qcy4Y2WVKa0KiCFD7U0uuT9zJ6iLLdJHTcVK0GPQ6wnem
         9sRC2JSEdsAlfmJIVqd2CgHCIcAoSpwgbD/g0y96KpskqtmtzALjerrKTnmq9Ix516uP
         0vEmjvM8lROkwU7pCf7gHHKpYTogA0r7lTq9/ut+gp1QTngIttMrYywFWZ13T2NMvrYa
         bOeoVbOgzJGUKIH1jstwsmex+J2vf1Q5dOyZwd28M0VuilMw5awS6k2XCu3hpW7lBnos
         4Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151239; x=1790756039;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=CWW6Ptz4GtqxqwS0CiI0OAK3DZ3g9zGhW+Wf/fbdhDThg94npXF9AONF7KxRmO6szE
         EcA97MZgL/Fn5Qqt/+fQIfjkTk6JBcZovDFpHrK2Kqe1Wk8e/feIfSHoC9Pi+FcRKGCn
         Y8sfHbI747Bf7lqZbbKNQYJl4Bbc5T+bHRoY7ggnrP79WelswpTJnTXuDU2a9UC6qngM
         c8msfSwDEjMcFy28cKuSdAvvNnZLmyJZZW+tpwrWc4YKI80jUT+uj5PmtLiJTQTDoubA
         hbihOFIpN14BZsRq3ycBgXCNfGV4CRYMFnU3ZtbSoI+qhEYBqRRBqy9V/uCEx7oUTs9B
         YeZw==
X-Forwarded-Encrypted: i=1; AKwUvByeoUllNuLSPQHEJ1zynbKukq+hOpqkIZIcI3xsywXoSvjbDJ/NdM7XVfwqZIXr+NBEGxKdJZLn3e5H1ej/+qaTxb1+Yg==@lists.linux.dev
X-Gm-Message-State: AFuF++nHaeSaFQS70ru2E3/iwLUKrt1FABgH8aTG6CajNyAbfcYoshEk
	c1GmLC6ezZ4ZZqB99a0KrtZ6MuY9WUn0KiG5QyS8lvMvQ3pAXFs800Nv4kHl5gnS2HKlxN8F0yJ
	1baUFl3QgbT0N6edsxJsYWRCft8AfbA7l34BYF4Zt9psoYFjL6RJOpEQFruDAWCt6v+AbT1eLhA
	YWUA==
X-Gm-Gg: AYBFou1PZK2g1DrM77ua/ka3p/xuEgO3KaIt8v5X9hsY8KScAznX5yaJAOGsY4U2ubR
	B1ywgYtHuvCip6FJ2lqPKzu6xWcoEhaRicfjvpXol9vD/tpumB27WQfDwjQZip2A9rhDXTg4YQ7
	MmZ7oOrvU8d7NuaaV/ECYbqcAT2/91wOeRWGj5w3IsOBHGxiRZdonYG50pgry3YDtnp8KNYxv3q
	amLUYybqd7K3UtJs1Ma0MUegzJ4m5IoyggD2d9FQCjtVo15P7XF4ROZk7sRinuOo+ujSdr2GpSn
	rxi4fAzbxY/9q73bzuIH/RA4/DdvyzezXe6Gj/agTG4NRKIQ5i0C/8t7yr6JiYcHjQMtKj9+hxT
	55n7RrCj7WX09sgMDcuRzPlqA6cY=
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279980085a.38.1790151238688;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279977485a.38.1790151238276;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm50454405e9.1.2026.09.23.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:13:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 10:13:54 +0200
Message-ID: <179015123239.7939.12868400217735279583.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
References: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab38a47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZA4Iygp0GN2kJPZu5X8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eTkGDzeJzl9bjTGETv-0jablsnr-O5Fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfXw0JlI007tStd
 AYffnALbk2+B5BD0Oq7l2s1v3CQPDptqkPhpzarg8+W7mHIvS0V8dSiqZmgxAdcOeLLLS38JoF4
 as/cMDJrj5K0jeXi6dcIWCUEOe1wrPANkTJoPDUg2wN0yFmx2rDkzL2Oj1nExGSSWGhp1Shmwq+
 ooEiiZtW5Mvz0Ag7982k9bRWe7TvcL2DUL+LBaTKCsfBRYUr0RVhVknCd7R3Vi4hhydbziYU45I
 FNl6y7K9Fv5ORQ5PIXstGLEp4YP6Si94ht9EutC2GuoRX+zilmkknm2BdHzp02jKjwBA4T6fMkS
 ocGRA63FMHtQn8FkWIU7Yot9BhymToWlIxY9CacsfTByG+hzweGTyq4rstUPgvMdhMGPvPP+jYW
 ZzQn4yau03Lq8SiH+mX3KCAcUNEsAOjn8QoL1t9vJYGMx/oSB2lrtFUv6kZelq6Mu4XiqWfdiiK
 hUx9AU2UY4Hf1Y+zcrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfXy3ULN8+HokVh
 12M93Jq5hGrRl+swhRHnqi6Y6vSAAK6WQa6SuERkCdDryWXh5FoYIycGCLm2QrpyOd00tRc6TrG
 bgmUwseql4IS/FO3Z6JTq9g/4U0NmRE=
X-Proofpoint-GUID: eTkGDzeJzl9bjTGETv-0jablsnr-O5Fh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230032


On Tue, 22 Sep 2026 09:20:58 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and zynq_gpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/e9438ab5328a177c9c0e5df87eb92a7162841e98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

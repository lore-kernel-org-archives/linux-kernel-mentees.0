Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C6258CD7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 May 2026 15:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030021; cv=none; b=MuSvSBBls2DswcYtGwK/1i9N62zGiV1WHDMO2vj87faziPW1Ei5OQTXLlVbEezr5+AqFJ90k7oLZyg/uEYtG75xs/EFND5r6mtou7K57p4PvH69oFpaL7KeOdBxQ/l7Ri3lTln+f7zVod5cHnd5537lt3LOXAvlUirEEF9dUz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030021; c=relaxed/simple;
	bh=8vjcL8OdQ5tgtJDoUFXe1PLh6azSB7d62dFmx2Xf4E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tO/9d7IJhlbco80zfVhiSYsL9qhQZkIi4oHbCH8T/At973ugh2cX5gcjtPjMrZ/jGCWkdQNd3/lY4JGw96aHL5qqLMQyb8RTD+5nGqOaAkL3Nvtudy/LFXFsgnK3D8eHZ65ezvfKabZtCEjdObaExVtUx/I3CKGUvTCE42AV7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ue91FZub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deYMB7Hn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ue91FZub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deYMB7Hn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HCS4du3427454
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 May 2026 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=; b=Ue91FZubwWaq7lvP
	BCgmsycPl2No1NZY5uN3ghSvoPK1en2WqpUE1/Rm2CpJqbelOpOpOuZhmm3GeQmP
	hzsu+zMij4FnCpwbnImsG2kcaGfgHJOXphKtjztJWnR42K17VmrWJOZ1hbOG2h8t
	C7OKSUjFL4z/DcLteovBuQiIKlmUAQcQa+5+OFDePcki6+D06SJN21tyMfX5WIcp
	3zGnBwdT6ume9CxK5knmyMD1NL34zZEw3rLJ86bpleFuCo8FKX8LKQr3eoe51Ka/
	GCm+CyKf6ho5kSf/jfjzIffrERm+T2saY0XGKOU66GZkPoX+zADVVb93lqppCMtZ
	WU8TQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqu1kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 May 2026 15:00:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0e3ad6so15478351cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 17 May 2026 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779030019; x=1779634819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=;
        b=deYMB7HnV8C3YSFmBx5OwNZs0fSZrLa7h2qD1+WTcIlcSErPpxM2YUa46Byv0My4+R
         +mBOzitLjqVqoDZmtPFI/O6Wfdh3e0PtUcwCSoSB0NpZGV4v8j3PpI9sE/GoAOvDhVlo
         yAFUvRTgG8qkE6NufOc52bZijZQxuCztSNZTlTUTSKAs9DjluT2vM5ndeThP9EURnKJR
         /SgJg47xPR6fWtX0x27VfwKK83RnhbAZ8bRZe8tdytFXMSZnAJ8GTX2cK7HcI8FkuxFY
         pXXSeyBpllWVGVBYPEXYYOcHKqFSfSWNg4ze9AWyTf19odHBmAxOMhrl9UlXgS9HPas0
         CSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779030019; x=1779634819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2fZr1KKIxC9P7aZKgWLBg6WfF9TW7hamnvrwR9wTjI=;
        b=mKwy5n0lzbt4P3yWj7V3NTLV6RgvjqRlz5TrxFsKEVC6/1YqGc90HJAmvWZwo+7O4n
         +5NZc2TwhtCz5P/xNbnwmTXpjnZjJRBTrk8CFVG2Vo18lv79kV3yBMgffDg0StmkQbMB
         eK3C5z3SDIRGT8F6+Cz2pJAA9UC4GRNtX/h2slWNonrrqK5JYJTyZxWV7G4mbLf+CmdH
         8v5Tmz7RxwkBhtsNLk36/BZsM5UDVFYQ0ZLxI7R3fBSYSkxKrz8FnxacrfbvC7I+NfuI
         9+GsZ/ptt4QJEK14iAtPKDIriOLo62ppE4WfRU9YItA3VxX8EaObKeedDfh8E7Y6Xms5
         mvgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/063s3xbZJTUy2XVNnQHeFFDIorlSI/+zRJNDf3hGHvOx0BPJ6ruSpC8vCsAyR8seztZ7JkeEGkSzeGIJK/lITrvadAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YweQDqMRqOgrVFJz3eRdpSWyCZElqojCOWAU9A3hY5dhekJ8y1c
	VQl4Sn502/sRmxTgFJiKgP5AkouT09Sp1FdpaSum0ZmKew6DqRf28nMcEwcaxUg3/ZQ4qKHhLoy
	OtlaiYPPirLRyVNP3Ovs4HqBUmhDEA1fLP94Va4xm5eAZ9tR2f6pkpOP0Sckd+ZqUjONlh9zixd
	M0xQ==
X-Gm-Gg: Acq92OElqoxNwiKmj0BDZugPDZa3rt6oFo5lzU/jz3JEGRMh471Ufe2kpx6QG4KO6dc
	gOR+mVttOw86rU5VzHYvFLIxVuknQCVbEhruC/43BegxWRPJQ+gXRXEPr0SdT/lYq7C+lX+jiFT
	lDBb04aoZGa3/+UoCQ+ErnmVg7VJCwBvAzvT0BK7sNg4SRKPjWw/v3H4g4vd5tDN9PJNcnZ7VCy
	NJ3LnGdFZrrckqxGNou3d6tQJPOq//9X314EM5v1rBNpjNOQphQ/mv1hDgFUCyNOV5SNhhqmBXv
	w/H2XauKAamLiXs4gsZKLlD3B/1ZZcjM4iTlxxLRXziH6xWfK3Ua+7LnjQ4jvZt71cerVXruF+N
	8hhaqJcYGgMzoqsLa6yVeoFDwFW6hGzSXHwy9kDm1fnIYyPexWRGW2muHTiuK4GPXRckSRA==
X-Received: by 2002:a05:622a:859c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-516415a0ad1mr143174181cf.14.1779030018767;
        Sun, 17 May 2026 08:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:859c:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-516415a0ad1mr143173351cf.14.1779030018171;
        Sun, 17 May 2026 08:00:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3e20:6c07:e6b8:6153? ([2a05:6e02:1041:c10:3e20:6c07:e6b8:6153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm193354695e9.14.2026.05.17.08.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 08:00:17 -0700 (PDT)
Message-ID: <938b5e46-fc82-4d6c-8207-6ec2b2495a26@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: qcom: fix typo in comment
To: Jinseok Kim <always.starving0@gmail.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, skhan@linuxfoundation.org,
        me@brighamcampbell.com, jkoolstra@xs4all.nl,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20260516152324.1863-1-always.starving0@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260516152324.1863-1-always.starving0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7TW841HIZPsBys0CkRv_jR5Qi9cj2zRx
X-Proofpoint-ORIG-GUID: 7TW841HIZPsBys0CkRv_jR5Qi9cj2zRx
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09d803 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=hEL-7WqZ2Qmr7oYnmoIA:9 a=QEXdDO2ut3YA:10 a=lbjUW56U394A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfXwgV/FxTJCIvp
 R2bgi0zerf7nNLQ25VOksV7lu6AFYanN4b7/RMYEHMUJS/DggZCem2wItRBqdS8UGBW5+aFh3h5
 k8oCXS6QU+CrpQiH1s/5/mFxH+b7Orcf1e6dP8UxTkYjdL1suubwrW/IDVxbgCGzEljq0k6er4L
 XtV0hFlBkkGiLIrXVHtAiqIN6h4f293eYyu15doHY8yxUg5ecCr2HQVnzidP19QUQ98Kq94+c0h
 BKh02v+8LBEORFz1V2kVxHWRJc1NgEhQLmanZ0zUZHZxCE9CNadJX4DnenH9rhBANPPRCEFAbC+
 6zr+XuNs4nPBDdhB34+QIoAaNFIXNC1S3WPP+e97mqKZQJpBS0dQCEYD3wzG196ICrzBHF3SzLA
 c7N1OX2BvohL/q/bD6F5oq5ZDdLH8jzabvjFS6X8WZ0WX11+zcPy94cGK29cTAwOA3cGRvA2Mx8
 aYhz/f+ITxGalRXFEDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161

On 5/16/26 17:23, Jinseok Kim wrote:
> Fix a typo in the struct tsens_irq_data comment.
> Replace "uppper" with "upper".
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---

Applied, thanks

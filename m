Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381835A395
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808722; cv=none; b=a0e2YVCt5GRlnRBY5ko4grCXcniy6bYYbQPca4q73r4d+CTNzsydr5kHGe3oToKBtN6IOg92JdFMDzB0L1Xcqe/wUbGTgiBF/08CZH+4GAU1HtLWZysBDQmGi8QCteqQnHeae22nJb0jmp/FCo4Ku+tmnRUJXz/Mlp9r74jN9jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808722; c=relaxed/simple;
	bh=usEwnKkEaTPE+yU5TGR0oURw8nv72W+T5MSwsVZgYLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZH3qC2hfY/KQAO/m7jtGzOz/Ip88Vev4tbFzqfAVngPkKuR6NACwmVorZYqYmcDphM5gmVAf5HaLNUxCL6ZG7UNjo2A+nE8dkWqRDCQ2FNDFRPGZn/9PPFgeDaz/yOpcV9BBnQTuKXUK8iyPYib5xFFu8aMTqpE1uzzVw4PVTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhnEuQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbZfMUGb; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhnEuQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbZfMUGb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C2D41287
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.491
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAHyQm4jujcy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2026 01:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=amirreza.zarrabi@oss.qualcomm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BED841286
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=oss.qualcomm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BED841286
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cBhnEuQ0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZbZfMUGb
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3BED841286
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:31:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpPfg1847947
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=; b=cBhnEuQ0Yie0TnAK
	ERP5nO11N4a6rv1v443pUEQeOIvJNTeSB+U/1IIHjNRqGwplsJegcwpCjkkTDewn
	2wtiyff9ZRDB0oC+8HLS/V0GBHVksQdQnUHzhioXaNopAWQoi9lVInwwdYdpcnQm
	+gq/+WiuOlqzUA+vofQPAueWWx8YHQZwSVU56+OQLrG30Ao83W9tthtIWeYVNGU3
	IFIYNpFW08vYFTxBkz7bAomDrDQMoSLF8nrhtbSJIiNlbU6kRq9/na80VYGPQt+p
	T7Ep6Xgr7SgZ7pUiK8q9rudAGVn3fv6de9pX1Chx0QtyuatsztnI+Me50mwrQ1Sj
	Fto94w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t10pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:31:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so3296375ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 May 2026 18:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778808717; x=1779413517; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=;
        b=ZbZfMUGbdsEf6kDSCeodcGmYECl/UBHcE6aXPRHaIN2ARLArZ5jPg5NAi3tEoLaCgv
         RNMSFkAOEa2qM7RqSVr9dj8t+Omc0wJlIIPjBLnp1kI9QIWgld5DS+pl++kZUHOlY6ok
         mi46DlTNVN8Orduwe5pPrGFO7UXRJhkYevn9fa0prb1MIkxc2rOqnSoZQxpf5Jy82UfO
         2AjsDPr8/rZdVECXURKPTgJWYG2zdQ/MZTHx2YWAoMWK7V4ZGP4r2RD/kY/mRMS4ssVW
         FyQb86IBIW+b2NWrYRpwmuWqtLX/gU/uUCtNyE7P9luiAlyezsPgI6Uhv74GNcJEl/0i
         cXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808717; x=1779413517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxJXpfYBS7mpaWwbnqYYsS+05m4PCWFY64z260Mm9fM=;
        b=jGQuaAX54o/abgpu7E7wjR0KFbOAfGGrYBU9UYh0iJg18gNkGHOZEfQuRqdrPgtPVd
         oi0TRebIJCjCb+yL82OH6mFRB/Q+50bv9/sv92qrPt+eiEc8N5585+FFiUM30e40cb4D
         LeAPtZkw8n6xuN+nhD8r7B9QZjppJt9M75NynzZThQHZExn4HZN+sbVimf97hr6GbnhZ
         E3Bh25zLkDaU/14PG723p03rjXaHilRdSsT6uuK9qZyzk8bfjh74GSmDqGE+j0avQ0yH
         peeSAimzJPT5bVxmYhLASA9hhnfHFbPzgaw073RoHQBI22Ri/FuokL0wxQK9BOvGKrqY
         sncw==
X-Forwarded-Encrypted: i=1; AFNElJ+AJrqByZGd9MgFnCt3YDowcera+pKWj/4Pnyh6IeUe5rRtGN5NzI5/jQvmjChqgj85Skmr8h5eHab/ryNL5KDWRRagCw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyz0MzIGtbid97qs5F6sgJkfKNyrQxSnecgkkAYaSNSluAhfSOS
	f1iht4IwmxWCesC/07go5tn6kz7ANQeOniduyiTJlWzxfOHJ/bPCuZN6Gtlo7Z1bz5EbSBkDuUh
	YTcQjbus0JUu71O3PN8JqNXNcX+LF5egSqCocThXTIpUrnCf6uBq5oZjSuVMVmpj8Hpf90TW0p1
	N6DeUH9Ltitn1tmQ==
X-Gm-Gg: Acq92OHLMtJpyC8lSpGtpAp+kw42DM2B2kCp5S4sf5FEbUxTtbwPUYFCZdyQkJdFJi8
	k+RXxNNBTh+sx8IS2TYRFIJvUJ1E0mWUbeIVFcx0LIisdP8BPLuhaVgDTSyZMWqQRuK+likIlZQ
	KvtPYxmYeDnMYkzER345bGyAPNJ2DV2Eo31ox1n3Ta97amUsItE0/8K6lC+4EC8582gUHOlYyAv
	YxIT3/hAgK+vgp9wqt6urGI2b1sK2uJs4Rcf12zpl03nfVd/iUwiRxB4+I2X9zr6U183rPXyI8v
	kvTmrAy/zazuGmOldwamRt/MUzeUnA+36GtFKzXIaOUtuOLReiNhSG+7L2UOkItXt0NsBGfi3oV
	EEWcoUXSKoVBCUD1WUDSAAsQJkA7GYQP4nddnBSAIVew4B0rxneXljTk+1DeMqR9zsI2VcHmXE0
	JlW8CRqq7X8IrWDmK4PLE=
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr51230115ad.24.1778808716751;
        Thu, 14 May 2026 18:31:56 -0700 (PDT)
X-Received: by 2002:a17:903:2ecd:b0:2bd:3c21:a053 with SMTP id d9443c01a7336-2bd5283e0c5mr51229835ad.24.1778808716140;
        Thu, 14 May 2026 18:31:56 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd7e8e5904sm10360535ad.64.2026.05.14.18.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 18:31:55 -0700 (PDT)
Message-ID: <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:31:50 +1000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>,
        jens.wiklander@linaro.org, sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, me@brighamcampbell.com
References: <20260513091031.145826-1-robertusdchris@gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260513091031.145826-1-robertusdchris@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06778d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=A39jgTEGnKEs4j151ysA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxMiBTYWx0ZWRfX5e2fs32uZedg
 2sto8G5NypP+Em0D0bzq9SFXzuTmQykkWP+m37l+n5lIXpH2zxouFWI2s6cS4M9IptmjLZl+neL
 xKWbMIuSiWBJTE5D6lXEPgxlxFjDWLOg6xr1RuYQaGOZZ74CxrJKrPRD27JHyrgHhiDpWMzFKAe
 Ul/N48LUhzB3L4ato1rrlCl+vnFrLOefVZaja2I8Wriku/4o8/3ZBXhIKIpNQ8h2Xk3clz7OPe1
 xeAJbwxi9fheEwLSSo85iDWrIuESpafcYkJK93s3zSB7/4TwoNtmB9tuDcwMnDpeOGxlzjUbkSs
 HgaPDQKEnvySrnzgrDvxGrNdsmEJ3VsQe/5bVesEQvflyejARODeY02+Ui16RNVsozy1QRM+eLP
 6cKxeVLHtgMLFRcPeCvCU7Yf92tiO4ENpGKjZ7p+F/SDC79t0HZzMdfHMCIpBrMNJM8o4HNUX2m
 19l3ju3zH+qnFtdt7YA==
X-Proofpoint-ORIG-GUID: g52k-Zud8TNRUb6HX5BGIs0Fjq8ITjtt
X-Proofpoint-GUID: g52k-Zud8TNRUb6HX5BGIs0Fjq8ITjtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150012

Hi,

Forgot to mention: how about using a break instead of a goto.
Then feel free to add Reviewed-by.

Thanks,
Amir


On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> qcomtee_object_user_init() is a variadic function and when the function
> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> case, there's no va_end to cleanup "ap" object initialized by va_start
> and that can cause undefined behavior. So make sure to use va_end before
> returning the error code when there's no dispatch callback.
> 
> This is reported by Coverity Scan as "Missing varargs init or cleanup".
> 
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
> I don't have the device, so I am not sure how to test this change.
> Thank you.
> 
>  drivers/tee/qcomtee/core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b1cb50e434f0..901a31e8201f 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>  		break;
>  	case QCOMTEE_OBJECT_TYPE_CB:
>  		object->ops = ops;
> -		if (!object->ops->dispatch)
> -			return -EINVAL;
> +		if (!object->ops->dispatch) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  
>  		/* If failed, "no-name". */
>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>  	default:
>  		ret = -EINVAL;
>  	}
> +
> +out:
>  	va_end(ap);
>  
>  	return ret;
> 
> base-commit: 5d6919055dec134de3c40167a490f33c74c12581


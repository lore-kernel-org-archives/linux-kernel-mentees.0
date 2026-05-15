Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE52F8E9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808223; cv=none; b=Fluldrh9QCqHicIIMVD0rILOa+y9atK2Y5nY8xDg/N69NGrDZsozHGLeQZefPSxBR8pI5WMbRSVwhevJAT25KoYJUjkqx8QS5SHeHWZ8AXEC+Cd/qe15lnLaCXol+xBOCpyBVODCDLjeoPMZn5jhId0zkKz6oC22ZRYTEmbfhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808223; c=relaxed/simple;
	bh=xCFPu1zNnERScuds1BA/xDI7JtrElF8fFYPNfBb474E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLzpyQ5Xtck5hRRU/R2eMUthq3rvmgv3Fzd58tyIGKD2zfH/WV1kahwHSxk/QxsvFmg+vC7qs6zwqSgVIcZ66viFuUAu9OWbKwRcd+maGNQYv16eLsuyFdVyagjim5AROZAe1D5P5PGi6vVKSmvV2HjhdHJhJR8qUjKdgiaNkOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j56L0qm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeGmw741; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j56L0qm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeGmw741"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8423783BB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.491
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4Hq7_8Aayi7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2026 01:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=amirreza.zarrabi@oss.qualcomm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B47F83BB4
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=oss.qualcomm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B47F83BB4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j56L0qm8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BeGmw741
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8B47F83BB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:23:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpNAx3219705
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=; b=j56L0qm8BMNVIf3Y
	gj0eN+2W9sAi7aK1lwSHVZyd6JP5ByEv6z5prnc56YDYmj8uOOEsaDXUES5YKYE8
	pg9wboQvYOSh0cqXAKGDP+AarJmDlnFzzM0RTVCtPEHdRrR7s1QmF+NvEYkx+/AV
	PIw8RUu24tQ+5msdyGrCVdfW38BhgcDo0OQIOQcyWvLjwvGbTHT+ENVW4kBM71wI
	akHsAWXi3Fw5niBoyqy0VX1/t48HK8j4xr9DlYMjWaK5VKSRWh0/3Pd3Vo+0Rnon
	sk6sy/+JdgOtVwfwQA3uH3V8CguBN3rBDWbSz15venb0a4S8gpn7k7C0qLCDC8i8
	N1tPvg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s10cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 01:23:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83565161a6eso224222b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 May 2026 18:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778808219; x=1779413019; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=;
        b=BeGmw741syogVwlWol9Oew82s7fITOA03E0zPtHJq6IEspoFeFQlcEFv7aH7ffMyt+
         d/oQkBWhR3DX1WbC2zjI1i9R3qbBkG+X1gd3JBUtyBKv+9HWyNVikmrDZ7PBPv08Ck5D
         r0/vrmH4Arkd/vUbDGzlGKI8270WQOmSTuL+or35wBaHyZo8dMmEAmLRUjlLQ8DNqE7H
         d8ZUmngON4Vue0fTgjQspjU4/9zFCRd7VJN7LqZqfh4664eJ1Ssk/Rq03G84L4vVJ5wX
         aPz8ApQToOo/U9K6CqlKvvShWceEqS3s+14spVjQTRla2dwTt6yuylpNvyd6EntProSw
         czGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808219; x=1779413019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbRyF0yHF8n8xfJ6kWgsPZHepfaFdKar74Yr2tZG1yo=;
        b=AL5lY3gEabt60pFPyluxC+07kMA0KhsL/CltFxN2yPDc0sTwupq2Ujhmm7d7Hsziaf
         bSum+KIjK7bnpUN1KdGc3V7m9nRSTTou3h0RezA6jI7OQbmrqJHiuMiDHz7uyEwUQm+2
         n19JxRFv90O4lzYOwH1UfIZFYFxcWZGUA/N6PqUX++32L8TRkVBSjI06j5ni/vd686Qi
         mRdhE9KtyTOdo0M51uQDX3LDcdxfW4oRCLjHwZJJP4jr0ZiwTB4bkMBIAmzw+mKLHd57
         hoq7JgJxpsfVWXaQKiy1k0Z0oR5GiAYBVX0UFIfKijBzVAY2pcYz0QYpNouHFx5CuvPm
         lQ3g==
X-Forwarded-Encrypted: i=1; AFNElJ+TOyaVgQZZrbarnu1fONy/lVSCIqIv6iDEe0i+oZycyvjLMtwbQMR+LyLrN8yJ7rZUu9czR7reXEG29ONYsX02m5ouyg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwUMuHZ2GTpsm7TkyI7lNWr4GFj4ujzKQUhf2Kse+iU2Va5LgQV
	qCTxJptPWhNWoB7yDjfYx9NYX/oIc9XN4O8DSgivWu8OwYTTk9pDF5a6ZC+UuYeMWqRf8gqOItP
	H/abB8imm/+UPOqWbVIlq0EUuzd1PVewEsibVAc9Fu995RcODKsagrPTWvApM24vxkMMBajLjal
	63mPgbRchhrB8snQ==
X-Gm-Gg: Acq92OHucU7SX5cw3tDo+HvsrbhUG8m+YyKpNLticOQZaHR5QeugmKUC3dG3vLBb8JJ
	bimZm+jl0RK++0qfUk5QeaROQEaEXY6U71iPNOOHm1OkvESV7N+jNlcfVuzdkOAndEB2ChoRVf2
	HmCVjMtWuCPUgksaD3e+tSeK6uk7iJvZcUoJrBr0AutukEZX2w2FvAhG4IWQuFSs4CvhKiC3evy
	gIc9EgU92ITgZSkjMe02wJWjY1lQoBK1ncuRXwlEuykbDTGZvUcZoZ3zoy52nc44NY6E6ImmB5o
	ijWZwOR3+UPQNCgmOotc/93vplIxqKZi3l25vUAbjMCawQx7JiGNnw/pdYJz9ysz422/7y7ebxR
	Cb1w5KSHXgCryZprxpZZu5GmqveHJLXoH0gLx/kLD10rcaBJyopxaI8qspqSDNB/roz/JJrUQZm
	UJWi1suGehj2Flxk2ktC8=
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr5239997b3a.16.1778808219196;
        Thu, 14 May 2026 18:23:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3028:b0:82f:2aaa:c14c with SMTP id d2e1a72fcca58-83f18e770a7mr5239976b3a.16.1778808218670;
        Thu, 14 May 2026 18:23:38 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19663ff8sm4062970b3a.8.2026.05.14.18.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 18:23:38 -0700 (PDT)
Message-ID: <6f67ffe9-41ca-4102-99be-440356ba672a@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:23:32 +1000
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAxMSBTYWx0ZWRfX2+QqI9DM2blG
 Q6kusBFtk2Fc11NyQ8oOHQpA8maFUa5pDur8fLZCRRhRo5QfkaBmjHLVHYIN8hTQ0/qsID1CIxg
 z9PY9EQpBmCQZeOMj2mp+1scFKkFCkTjqIhj9uRVGS7NkzXsgq2S+yHW4QYW+TWKAebW5LUywFi
 u6/cUDKw+ZWhS2ta8SJ156gNfd0AbS9Uuf9RLK44GwgoeWJSt+SjGAsSeTOmdVY4OJTzMxYRBOo
 DvT5tmgBik7bCF5bUmrIO/08i//FW97ziX7uhcSpCpgGpfkJtqlnt76VkslWO1CXXg/vGl+imDy
 PYWP330XUj2w9GBm510gFPzZDaVRTDLX3kEc5IPiNHLIegJ9klcBPwXKI2Hs3s694Ij4DyHQtFi
 fFZqj6/2/n3LR+NVCfy9a+emdYteYKv8KrW6fEiGt+1JC2PiyjP6g02P7Xqa5hq+N0usVklgnhf
 SH3+E5AA3/4yKXJiz1Q==
X-Proofpoint-GUID: MZcURDptyeIH54RGKT9wW10RVBw2SdvR
X-Proofpoint-ORIG-GUID: MZcURDptyeIH54RGKT9wW10RVBw2SdvR
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06759c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2fb_BHWLsD0z38efADMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150011

Hi,

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

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Thanks.
Amir


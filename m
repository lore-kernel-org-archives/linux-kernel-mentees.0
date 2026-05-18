Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9E3CDBAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087205; cv=none; b=NPZ0Ormzn0gqDPTlG4v9CD3PuAh8ClKyQSH3yuH/9MOF8qjuyRKhnnbkpJiz29mKeVfHwJaO2uaXiTkYohTnZJ5nB5otqnqrWBY7xGkg9MvQpzuLjG2kg200XdXMB/Giv6x45Hzq6Kf3lPCETJPhCo6N47gqba5fg5S4tZkgdT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087205; c=relaxed/simple;
	bh=5RFO+Ssvg4JmPw/yA4u/nPzTGuYXVhi4EeKK7/9cMjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bV+Tx3sC6tSscqJ7XCZCd2ja+m+9CU1cJeXleKvZ6JiBjfZflHApv99GYFFeLPQGiV/3PFKUELelfVzrFrdt1q46sgpnh7+7xVujkqAt51sKR2JOZKHXUsbGIYGkFtUgOjH2GF0OZ5te4JBG9P+xj5K9ycm9upQ0fubFdSub+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/QupLAN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/10RI3A; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/QupLAN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/10RI3A"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76B62417B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 06:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.491
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhIR-izSUzID for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2026 06:53:22 +0000 (UTC)
X-Greylist: delayed 1014 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 18 May 2026 06:53:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82BD7408BE
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=oss.qualcomm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82BD7408BE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m/QupLAN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j/10RI3A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=amirreza.zarrabi@oss.qualcomm.com; receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 82BD7408BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 06:53:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I2xg5f3835038
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 06:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=; b=m/QupLAN2LODnD+C
	1P+6W3OdBFoGdhgeeDxf4ZtQ/rsutO1IA9kh5gKqeZ6nEZJH5eqe+RNl0HRrdeJ/
	V8bPW352grJGS9o/uz4btRY9KY6O+/w1bLUTVALAIyo8g3XwHY+FOfZzTlF9bj5X
	hKWA2uWixvvB1NEue6ZAdsa1LdINFuOS7RtGdwsdZ9U34ppEwyTjpPyIEdJvQ7ef
	ZS5U+RjDTKfrFimo+Mki1a3zlnSTCYcGCFJh6Uf3lOR2Z7POlYFkbSckkZTt4Ltf
	8zFrQkYUSmy+t6o/9e587Yl/NjYdS+gq79PlN+meOlpQjSw5H9YpjkF97fr6AbyK
	CHyL/A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbccxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 06:36:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366344513a3so4118636a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 May 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779086187; x=1779690987; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=;
        b=j/10RI3A+beGUKGcVKzEH0Px6S6+RzscWEqf0paHjFchICz9RHoZG0IMsZ53dU1mVQ
         B+cwA28p70vO5i7HIzIi2pbqob2d8yOG4he8gcLTnx1w9WtvAq4LFd+FXMT9MvzJPdNr
         Y/mzpGtQ9DGPxaidX5N16hkxvFzw5tj2drmEvde5gZn4Xv2y/JbCzlEX60k1GHQV3ALK
         c1vX83ISPI2ai1qU8Hj6mXbma+8P3R3PiShlJq37PCURA9ZMJDVgYT5l9H4G7QZnfdwd
         CsB7Xu/7qA96ZQTWP6eSg7orUsXaK4hKWBqCPd7+rUnqPIdjsBTw8ZxWpFa7wufyRMfo
         3+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086187; x=1779690987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhWjBMRcsj+kQRn2s4H2mf5lmW3+OFeXfq83HZ0y7aE=;
        b=ksjiAK7rCv49KhCyKN3UNKmyk8rNNFaA5xhwCt+4doG/RQweDq8d6OrsAPBvPsmAer
         iemabM7cT3F9H+RJ4tXwrjr43EI703xw60Hj83vziaCb1p4cE6LpXTUPHs19V1bX+IjD
         Ts9CSztWyuYBcnr1S14G6nhx4A7PVU52/gPXy+lkHvx1vj8udQje9vtlMZw3lPYZdov5
         4sUHi0ydiDJBNlINmhrrgSyj/quYPJY8XYLvM8Jmaj2KxiXD9Xf2dCs6bqKhVbuo8H4y
         NOurzrmF9U85hcGhkmdNaGlVJ9g2CtPNpmeEP9bVBLYbzo/zJePNq0aFqy8CPyX5iv/V
         iXKA==
X-Forwarded-Encrypted: i=1; AFNElJ/uQqY3uIdeNX824zGda7jdr/UIEuabJZ13DyiMy+f8T6mgl/GPFEF2fMdPSo0sq4WC+y32NYLvTDoraqDpWpD37iplbA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxMQRhRCGKJh0OxvXKz7LUON1S0IdmXYm/otVaB0JNrw+c71pMu
	f9TBuL0Teft5ou44FchHpFByqCVANy9PzFNhsDKTa6hejbwpdOey96iyL8RGty0FgeyBD+YacBO
	7LFLhEGpDH2Mo7T/hs6pHjEx4LWmkEVD++tkKZ9hNq/2M8/giHR/teXSH8oDcTkEzgIElYNn3nC
	gjLWBjtWSfKMa6WQ==
X-Gm-Gg: Acq92OGVxhZ/IfV9UpJkEcRG6DjeHUXYd1fr4PM7GZRQCsMQP+aHGQsYQo7FFeCYaHo
	LldeZ0ZaJ5ZMIFs1+oAMcSb1AHHgCpY5LkGHo9jrRl7wJYHaA52gRoTw2vbSRms4W1IhdBeJfz+
	aILpwWSgQFwdhtmVjEJwOxXpngvPODw7c0qqjHCITZXp4PNBZIQmuz7FUuW5zxgcGTbQzaM2SM+
	XQv2LW4OHCKlWHHUtbvqQIwNfluPeF0FTjxrFpufnuSklyYk/M4nXBMWOqhe6QOv8f1ZqJct8lc
	9WIUU0rMwm1UqYv2I9EM1VLDJ0mtWmMBupNe2QY/xSxCa0sokY5X2ZkiPsP7EfIkz26R8FSBp/H
	HvTjG3/2f60oIYGpoqMJOR4LKLk6uMtqm8utFB5nvD4vdWZPANFvehWXjVv9RqkRiZJKN3+Lejg
	+6JPTUS9/LXN8cDxxzCKE=
X-Received: by 2002:a17:90b:4c51:b0:368:2074:b7a with SMTP id 98e67ed59e1d1-369519af671mr13714071a91.5.1779086186748;
        Sun, 17 May 2026 23:36:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4c51:b0:368:2074:b7a with SMTP id 98e67ed59e1d1-369519af671mr13714036a91.5.1779086186266;
        Sun, 17 May 2026 23:36:26 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951278e7fsm9708269a91.8.2026.05.17.23.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:36:25 -0700 (PDT)
Message-ID: <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:36:20 +1000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        skhan@linuxfoundation.org, me@brighamcampbell.com
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
 <agat1sBHqkGWKzOD@soyboi>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <agat1sBHqkGWKzOD@soyboi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0ab36b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=X36vB_roDklc4VALgUkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2MiBTYWx0ZWRfX1YjuvZEv9PBu
 q6qjXecreHu8Eq2bgZ1+xNATWIXDxewJgMFjWDi0tIFWe/kBkIKnxtnLSm2ENVx4yecCbgO1UmX
 cJqozQo0SnoS9P373cjIejT3T/I+MczcrVf5CxNIij5bsr4XPLYY44gZvOfoqC4dl2EJfopvZUW
 awdpffpW2m1ZD4ZI3Ll5iCGqRETlPBEMaT2ciUmI/56zCZ6IQhuoLv9UQhP82gfxqisvKlwYczm
 qzb/9U87r/tYsDKfLRvCb3sMSawDBf+FKnX+F9UeT+wfGlsJUmL2dnumZG4YEEmNdX1JBukPnzI
 h5+x38HwKv+NH59NYcLQOVM+QExLlRkZCdTtFcpCrgFbbzhFZ0QE37RLpY2jK7UHZ6ERBZJHfls
 IpCGOedym/HDo69OtRVfuzNUq94q6/KjiuUyRSDy67oepDbaxeTYh2wn9h2oDWfCkpLwg8zxZnT
 fnSgGiMuXlywYYwd2sA==
X-Proofpoint-GUID: exWgX90FRJ8EvlnJj6DnzSxECAB3UUZL
X-Proofpoint-ORIG-GUID: exWgX90FRJ8EvlnJj6DnzSxECAB3UUZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180062

Hi,

On 5/15/2026 3:23 PM, Robertus Diawan Chris wrote:
> Hello Amir,
> 
> On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
>> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
>>> qcomtee_object_user_init() is a variadic function and when the function
>>> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
>>> case, there's no va_end to cleanup "ap" object initialized by va_start
>>> and that can cause undefined behavior. So make sure to use va_end before
>>> returning the error code when there's no dispatch callback.
>>>
>>> This is reported by Coverity Scan as "Missing varargs init or cleanup".
>>>
>>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>>> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
>>> ---
>>> I don't have the device, so I am not sure how to test this change.
>>> Thank you.
>>>
>>>  drivers/tee/qcomtee/core.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>>> index b1cb50e434f0..901a31e8201f 100644
>>> --- a/drivers/tee/qcomtee/core.c
>>> +++ b/drivers/tee/qcomtee/core.c
>>> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>>>  		break;
>>>  	case QCOMTEE_OBJECT_TYPE_CB:
>>>  		object->ops = ops;
>>> -		if (!object->ops->dispatch)
>>> -			return -EINVAL;
>>> +		if (!object->ops->dispatch) {
>>> +			ret = -EINVAL;
>>> +			goto out;
>>> +		}
>>>
>>>  		/* If failed, "no-name". */
>>>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>>> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
>>>  	default:
>>>  		ret = -EINVAL;
>>>  	}
>>> +
>>> +out:
>>>  	va_end(ap);
>>>
>>>  	return ret;
>>>
>>> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
>>
>> Hi,
>>
>> Forgot to mention: how about using a break instead of a goto.
> 
> Oh right. In this case, using "break" statement is enough. I will send
> the v2 of the patch. Maybe something like this:
> 
> 	if (!object->ops->dispatch) {
> 		ret = -EINVAL;
> 		break;
> 	}
> 
> and then remove the "out" label.
> 
>> Then feel free to add Reviewed-by.
> 
> I want to confirm first, if I changed the patch using "break" statement,
> do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
> still not sure when to add "Reviewed-by" tag, like can we add
> "Reviewed-by" tag when we changed the patch?
> 

This is a small change. You can add the tag when sending your v2
as long as you include the change.

Best Regards,
Amir

> Thank you.
> 
> Best regards,
> Robertus Diawan Chris


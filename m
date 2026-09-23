Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263C46F4AD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151468; cv=none; b=JOlnw06/1whG7+1YE2K8UP397SgBHIErExkveqwSG2b5Do+kdMKCJSwTE1QegIjsqin+s9HAhy/Hd1q3udZfth+oACdi00qAcGm/Cep7v1C4ZOzmWFTOA/0Kx5E1nyJ61gMqpCIEmMXZRLZZnogZsWyN1+hCDzJAyKh7gV4EV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151468; c=relaxed/simple;
	bh=EaRJzW/zC4RwiigvXaUy9oiHCq0yzTz5xk6a5HyZOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONvKVXaCuvya5aiX0iZQMpoeXtDSjN7JUG5y4t6+FWsqcf7BWeOiZyH3Yd0TJbsZ4i1xQ71Jlf2Bb0+kqRvXMoC3Mj6UjO1Ggv6KIUY/LnmGSHFHfG3TMPhPOa0kOHSarp3RuqQEiloxFGW+eFMyDgJSBybdXS4qlNspL3dl+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnbOkqzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwjTMW53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnbOkqzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwjTMW53"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79TMq2819134
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=; b=XnbOkqzT8wn68ajr
	7QCp4Yg2I9rd+bmVZ0fu9bs0UW7v9pD65wH3ZLuDxKb3cJcwCN95a/GXzQyA4dd1
	nwisTj95xnfSqOX5ot8DpV7GrGQzSgnB1nPqYtTPv2ps57ATxNdTABbt5lNNJyqT
	8alnZPr9HR1RibZw/zewnCpkhudmGKWOk+LaCFjtQUUss+fzhKcRZcHewGVNHxOG
	qLhqZ9S0kzZ7tOBpzVC9F2mNC3l9kE/9U+LBUAdPXz+9NTJfqXfrSJkrJCeQDxI3
	bKhKRK8DGp/k124M9P05tLG9CN7XB3oRgLB9B1PqYKETXCnlGShK0pP2cndrMiau
	vH4c6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n0x8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 08:17:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f8dso14916116d6.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151465; x=1790756265; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=;
        b=BwjTMW53lhcG2b3y2R1J5oq8PueXunZRB3pEcrEQt3CjVk11sppLkBFEWgxngMwu70
         Mh6/iGTk8rkdN+zNfYInKpoStYhDIVggEl5G3TYZtOnCSP9jHzWRFmzol4Nuc2RSDdrn
         syR+5NBp8I9sNQFpfxXpSaErSP9cfeUt7PjrZn3JW9r+o2Bqtqe+Kvslz8HYofby0CmF
         yezg6IFMrGW1PMwmQ+7dd/eV5G4BKuAOiZ8E4/rFwb0DGhGvKA6s54hhGECEjoDBx441
         5OCK6ghJgmlUS5NZbSxKNtK7H1JjxsSoACji3BS0Mo/3LGhr79eeajPvOPY/Yyj5fR9+
         i0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151465; x=1790756265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=;
        b=cA9meZu9mZjl4ECNwnzlXhRlQ21R99kUdX2B4uxnptd8z9CtfJyyT7DefUhLZfv+Qn
         6nvkbpHGn/bIa/zlISClnzW0VtOX/Pcy03QFR+E9qT36A4LiZiHdPuLmfxqCxcTsS6cJ
         oeRHIyXokzfKl8xE1XcSn7bU7wER4d0zetbcp+0AicCgW6DvKToqWogK/LRGC5ZGIKD0
         eHbOXrhr1R7eKEPsB0XdQDNIbCJtOy3iE0u4fjZyA3jOEWWjpg60tGkNer214hbSm7HX
         hKQqJ2vlW/ARtuSmPDQKvOdxvLrCwRQKWkskgIX2LxYnkRqWX0TNLmHo38qOwDZMM46k
         FBGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNyiZ09cNDSpCAhe+i0WK82eK1k03ll+3/wtRHZUEUQVNJmrGyuM1MU7wEqWIby3BpiSc+cpU6V6napvWvlVU7NNL1wA==@lists.linux.dev
X-Gm-Message-State: AFuF++mKOTul7XW19YY17jB80p5NqZwyqywVbDE1lSagdAOAo7bVU7S4
	4Y0JG4lb0kTFnw0/DxcwgaQ1LSooWTqR0DL1mt/OWa6sV18IVpN9HfcWJN3ck6bGUdLyKN50VDJ
	bsc5W1TjWKK0aSINyD7L53Q95yQ2hpKmPBfwKiHf7ayxaBAEoUp2Iot8txA6qSQ6txlwfjY/fM+
	v9DQ==
X-Gm-Gg: AYBFou3skUnd3TN/TBht6rvdLLpbq1J+L5Jsr40gpyOW+AuNzefSiMTo0Qw8gUEo4d+
	xJhasYw0SHhTcsIkVyFx/4vaaYPpfYyfD4oUWP4jilwD1tUITdr4+Vf+wqgRagpuX3v3cXq+9YJ
	7dfoqJdaFGZPRZUUHZpPsVaw6N7H5/DjdSfo4U3g9jPMlXN0dJyLbf9hSIjPezL5OdRt7BJHQkz
	5q5qlgaPiMDrLgM08/3MuED9M5Zetn9/4jliSSMsSsYMvmaLY83AyznMsasHzVxlOJvV90XXG+A
	5JbPy0Tr49XslYdLCtRYN/rURa4CnU3+5BuuZOpZgB4HoRBICDAnk5e8f+AoAc7Sk8ysLj0NFMu
	z2Sl7OMEEGq6QpNaBwMYwAnrAH9Q=
X-Received: by 2002:a05:620a:2718:b0:939:6a:a71e with SMTP id af79cd13be357-93c2510acafmr303522485a.21.1790151465107;
        Wed, 23 Sep 2026 01:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:939:6a:a71e with SMTP id af79cd13be357-93c2510acafmr303518885a.21.1790151464464;
        Wed, 23 Sep 2026 01:17:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm55001815e9.8.2026.09.23.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:17:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] gpio: siox: normalize return value of gpio_get
Date: Wed, 23 Sep 2026 10:17:40 +0200
Message-ID: <179015145803.8361.5075134045656614321.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
References: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX7bgLSV5vAjBr
 H3m9oBGdPiqRUSsnmMEM4oAtZp43QYSnsZgyrUCzWJ9qzAzMEHm6O7y/baNMU8kE1i6npSN5APK
 XqQI61JiOpUE6mvSKRMHLBvQB3NTUKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX254LkBZkEznu
 SnkCNn8gomXHjpwlaumUc31Bv4HzOAjuL0J8vLG/naRYuDwZOelmFaBbNXeA+sQRWQJ1xJ3WkGZ
 UhoP3G39HeWkuST5DlbWXpS6Ob7prAKBiWUn0Tcw5ielZGDHk1grwYZr4AuO8B579f60yYnQtKp
 sBJbUOZEsVCnH/ADBAoHwoqW5ETyHAyFCnoVYzhAWnZHx4GUnNNnfjvpUxZ5bL9IVG9thywsoKe
 fFepo8hSNbMlCsZ539HSP4b1xBJLJ878fQUzRsfc9nQQDRtFR7cqYwBwYotlN742cmNbqc8clPi
 uM03+zfG3hHWVy6fdc9BdgGoRPxPwvP6Vn9tWFM/lkLpCsNSUspss9o8RbPOANgpkli23QQkWfX
 HhhvLnNE7NrYH4TpfYMy70FzT1z+yPgg+p6kVklgF77z4NYjMUk4f46WAbxxQJ9PvYTTeVWpLnw
 q+8VwRHLDqllWecn4/A==
X-Proofpoint-ORIG-GUID: 7BnZopppMbBoqpSEbYI-r4zYTY0aUhvv
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab38b29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=luIpCB2FjmHitF4NTPUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 7BnZopppMbBoqpSEbYI-r4zYTY0aUhvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032


On Tue, 22 Sep 2026 21:16:58 +0000, Ridham Khurana wrote:
> gpio_siox_get() returns the masked bit from the cached input or output
> byte, so for most lines a high level reads back as a value between 2
> and 128 instead of 1. The GPIO get callback is expected to return 0 or
> 1 (or a negative error code).
> 
> Since commit 86ef402d805d ("gpiolib: sanitize the return value of
> gpio_chip::get()"), gpiolib rejected such values with -EBADE and reads
> of a high line failed. Commit ec2cceadfae7 ("gpiolib: normalize the
> return value of gc->get() on behalf of buggy drivers") made gpiolib
> clamp the value instead, but it now warns on every such read.
> 
> [...]

Applied, thanks!

[1/1] gpio: siox: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/f24872823da61a6b9834cb806013fba53fa5e0ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

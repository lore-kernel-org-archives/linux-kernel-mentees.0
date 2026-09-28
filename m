Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903C4746B7
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584155; cv=none; b=nHeSkwbmHmTNkSL3SdYM4l4RK5bXZlEGkVaUhLQ3lfE0K7Bc8cVNc4MnAJ6ZDmRo9x18NIM+vXCN2vXmmxzH/DpsiT9r3CknUxMl1QfGVkP5/WdCMK9v8XbCE7Unl4wFUH0lztgTpxQmjC2BybJlCUxfhCfmFZ8TF6j9wInyw4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584155; c=relaxed/simple;
	bh=49BJ1dkM8YFoU0PD1GXd1i3LqpdlILrljgEHFOW+Dz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L98Iz3mOjSUNpVIWYbPutetZE4jRnA3fZt6SxNbo4aXNxB0gt2mKeNvdK//hnD0A0jmf69Jgiwnu8f3hz4bxVeElq0w4LLgLMZaEO50+SMOVZrD+UErW7Tmip+fImJAyeTyxq/mct+QeJAuqLmvg4SbOnZgfvvUMTHoV61KlzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8yjOfEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8cu3/Ht; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8yjOfEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8cu3/Ht"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xRoP062689
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 08:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=; b=S8yjOfErmuAJa5CK
	zD/oYuaxlC2z5L8x1I+46O/EV1d3ZFTl2c8Zt9QXrH2cv3eDSgzDexM8i9MPch2H
	sEUqS4OUPXth5hYsQILK5DMZNxnvWgBWekW8nW3lVEj47DcqYWxHqG/QGwsmd+lb
	i85dIjnqb/PeLaph6alUKJs0MSKBx+SbjvV1+ZI+zbX/21WmT5N8DiiMTJqLGLzf
	GxveJ/zbuLAE4nOFUr8KT0L/00KzbyWwAeM5eP3H97qhAnWnsbJVXdAm30vVxvkr
	Ka2IQ186TNnQmu48dnlM3YNmpqfCo7oVGctyEECH3/6tCuc6Ko0Hn/mgywEIdKlO
	hRg2TA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10f4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 08:29:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91578e96164so15625366d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584152; x=1791188952; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=f8cu3/HtwI3XRCr+eWfwj4Nl07C35RvvW6EtTKOd5HVmrS961VrXvlpKDPUe3NnWYY
         ++Vfohb3z3nv1gDdkNRWhJ+2Y4ii1Y4NWF5wpchKiw2zzexKqsGV4bhccEm4KTAF4MwF
         tvUoAvfUwDghK5Qfq+o/BZUusdv/zG/TkMOBNsJu2LX1BMbgcz1xUADS+w1wL/j2ay3n
         /GMe7VsFFR/uv2wf8R3lx/9Pf2WwYnuZklQzO4PMSZLItgrI7kSxDHdRQu8PZFysS9/5
         3DKG3hcfegCthclvWCBEpUB0cjUymMY9oirAjNf+o9jpY0yGQ034lCmBGNhi4gl6e0vT
         mRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584152; x=1791188952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=Ycc5YAWuJ/Qa/PKk/iNzQTwYFDRQZd9IwXNRKmEjErhsj47eBU0aMbeMoMvgvFwCnn
         6o21LHGOSfvgILX1ywZqSnI+jZPV3osGNZqPiaRodFWy3punlmwSPruyDZL6YPmmugf4
         coEGxWcunaTlYADpB/yzSDxTulhdAGCdxazqiDOsXgbF70D7lMb90YJQvL6QvQvi0lnN
         fZ/UVuu0VFnUGSEKqXtWWmZJ8gTeVddl+4qfthI9ASdmC1yp6SfcsiPfu915tAnYvrSF
         H5aLtTcpQNrqfWaw16QikzKPIfSNpyX+AdvTp5+6XxOXqQfk4X+dJTUrytUlawpJBuN/
         ubhw==
X-Forwarded-Encrypted: i=1; AKwUvBzDe0cQM8fF0JR/UyQ88V07LyRDnFArkGxtn1pf07gel++logfm+EaYmtQmMHVpdPATy1p9+SunvF3c6qjOGsJ/WNjm5A==@lists.linux.dev
X-Gm-Message-State: AFuF++kqMoayEXyRgAkkUiTlwmz28PeIsrR0qQjI8Y3wa1tD2fpIH8et
	+8mksFM/Gw/mqraOv7vkyoCQ6R/oUn8hZqTbbizAEkAMF/o8gc2GgS5VYr6VhFW0qgsI+T33Eor
	BpVTLNQeZ/YI9K8MHb8fwfLCY8cwaD5+4F3rtXMz4AjD2320+EnZPgtGfxVQWsrjcv/7tmeI1Zx
	iZDw==
X-Gm-Gg: AYBFou3W/QVeUa2OSa48WBqzctkDdHfyz4qcMzsxS9/w3dhRUiKlOjkXY7hF+NTbrCb
	4RjE0dNL//f87UzAaflxkCvux+N0W0wt7OyN2DLq9Q7o8E+UeZsBW2h39avcR6h9lO4ms+BUnkX
	2TFtEE9yCQymvJjTCMaTlvrpqgiZppIPd7C8KxDYRvaeJFB2vn4SypWk7Fv0FbpIrfA6gvj/d1j
	Zn6UFitf7v176TSFvWZwH75Kkok9p6IiypNceEvAkzvozryBfrsw5vANrwjneCs+6YZM/HIAUYC
	tNyGaGLzHuek30Pa6KbzCh8Q5ijiIEJt0ePMtgJ+W3Vji7e3/B2cekx7mGdQue7hloiPu4648tF
	31Qj9X8+UXv3He/jSLMYI2Jq2TGI=
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928792485a.5.1790584152165;
        Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928790585a.5.1790584151713;
        Mon, 28 Sep 2026 01:29:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm125209615e9.15.2026.09.28.01.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:29:10 -0700 (PDT)
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
Subject: Re: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Mon, 28 Sep 2026 10:29:07 +0200
Message-ID: <179058414451.16214.2667543002075189333.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
References: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfXx1qfSKpuwLSC
 NTeJoenf8wwURiq29JhQjsa3Nsy6EFo/4kbmPGOFNGY2QEXGysQItlDOirQ0cyVs248DfCHuFV8
 tRv2sj/vFe1058KGsU4vUhOP6frMIP2+dI80V7NOcMNkkXNf4ypOFalRmOpILT/3pq6zQUtsgA2
 o32E60L1Q7aXp63/kJzBm0O/MgatQEplJeOj2fcU6o0+I24Go1UVRAE/oPmR4dKbgbR/Ul4SA2j
 MY/3tIknUdWJgV0FBLrNOE3S+QtGrG9n6sDf4lAS28yy1qOLzPBBQ8ejdzx+E9hp8j7BwXc6P7E
 /hnIB8uGSK1e6OoprUBUKtowzkIcqW/JXPHJq+67DC5O/RZ9ct98oJ4rN5jUxicsha7fLVWdBc5
 1mlbBCix9dwHAYfRobrzmnjm/dzCeCNjrt6QYWpLe5YvzMzC1LaL9VJ0tIW2MPskGUxrv/Couq3
 ZwiJmTYUCqKDIVOSZ+A==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba2558 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-tgoi-CBN2K4obTd82YA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: sVCs3Q4YV7wOcVQWnr2pk71VtK4pFPs1
X-Proofpoint-GUID: sVCs3Q4YV7wOcVQWnr2pk71VtK4pFPs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX7zYqmWYncbX9
 u6EW3+oYsDigKwEyiTdf/7kFgScKQ9dTuxgh2DHxJRG9tKMJLBFvr8NeZQ/vdHDPbmgBI7URCCx
 Px+HH1I17IODiGRiYLhnQD3YFSStKy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280033


On Wed, 23 Sep 2026 11:39:02 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and xgpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: xilinx: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/ff82fc3a4a1d417dee1229681cc5285986edb1fa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

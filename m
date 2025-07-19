Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147C238C2D
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752921163; cv=none; b=j65mQxngU13B4rmAxehkwD3xrjIKIoj2qE/bqlbU+j5OtOjsohp2JWC5+Zei7p/aEJH3wmeR/F05NnWCbCFp3ykN0YRQdYuzNHWqaGdcjtK2CvI5MhksvdHI1sCHZuESmCh++7iox69Ne2Rf3YEKY2kpA+z6EbPquX3Yk9ALlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752921163; c=relaxed/simple;
	bh=T2ye2l75Lj3Lleb/xuoPqhp7Wl0OEMA5wv/bIJGwIgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJnyjbfIpcGrTxEBqJyjZYYa4ZjE9nJho6Not778VeNqkfuoehUxudeQwPC/Z1sZDNJTropu6XubzpHQO5zjtDb0Xqing139dNcg4Uk/h4zogEc9wKebK1zhTNuseYw0Ihk9jiCNjKQTzIUP2A1vxIWNboGW6g5V4M0MH1OI1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7qGKWCl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7qGKWCl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4LTUi001952
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 10:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G06iwEutK3GO5lHqQU1Eqf05
	c4jNYrzpMWxGrGkxhJo=; b=P7qGKWClADMSME/mv2lvSzusTfdruXgsRvc8STfH
	rN6Byk2gxnN+etDjq70KR41ths+fuho2v3STtqSh0tp4lPiHC9fiMDYUD0aJI8DQ
	+djVqF4dCoPsjS4LP665vLNdGR8FbtRXYnKmH840WfZwIIpMKyiaVMPIqJedoDZJ
	16o4k0CoW3k0c89dJc98bnuZTsoZEzm5N0Y8liCwMh5rhLZhz6hg/wt8zyRUBudw
	8uoPAxubE5n0sraVoNcJKaHkjB1m6txCpveJJi6P7+oP2TL/mZg8xTZXQFzG/hGE
	KBXTCnud/NFFzGXHBO5eHH+UtheMEshZtHfkGpVi/4joqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v0fpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 10:32:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dabc82916cso477487385a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752921156; x=1753525956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06iwEutK3GO5lHqQU1Eqf05c4jNYrzpMWxGrGkxhJo=;
        b=vKKJ12ipYC8sfGHabyA6K8XySJrAJPEahUZQvAVhcxebsVXcCM4ZSeFaTBfD1LLSCw
         WiQO85HH9BAF9Cm4HC/Nhm4UQesSZuiKmKnKcGMociwTJ//8yEKCxHJAPwLBAMhi4EQE
         ZhARgyq3kYWZG3hhilA1coB8pTbvpdoaL2fZHMalMZKYEjE+qQpxEhC903sfLm4bRnf0
         VoUaXkMfC4vQFaVaJfnUcnDdqAzkFuYR5fZ7kOaDSbqK54qRskDqsSJK85X3LKYelfqS
         FZW6UILvtNX+NU4KlfF2Wb4XhkVxazL86gM86NCb15ZY0MwEKCBgG2h2ZBBScpCW+KU8
         T2QA==
X-Forwarded-Encrypted: i=1; AJvYcCWV7rZ75HlO6LzXkUxV69va5JrwtK08jndGwYx0GuY4zFqWnbMzuB6ZPVFpr8c/IfvIlQHYrQTejgwn3gN/1xf1dYYbQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSgnDeLBqjReU/GZeIuGSXEF6jGFxz3MMG5XrxFqjBBx5jDlow
	ZuSlpzj/E97tcZgwTgAldswrldUGpOTtHgFRgt+MjNgRqj3LPUmDAW9hmwCBaKxKNx+hSzTHZSy
	TNVXpbI1/Xfpoh1QNASol4wmop1Ya17rpRKVmsOITKDOGvXMIoUAIke2rwFuUa9df0cgFD9pFTb
	6Wdw==
X-Gm-Gg: ASbGncuwGt+p3BgvDt7Gg0QGVREnPG1s+QClrbJpSOCAULz8SPuX7tlOIBU+LL7C4JG
	1GDG+yJjihP6TSafmkQGEr0b+MF2XsFUjCQwuBfY2OYP8ifQFwwgLV33U3IZ0iWDvRYkYSxl2eQ
	iJqP2aqwN4NFpFYTN5wmvAxISrjmDkSeubSR1r+IAZViuBHngbFjO05YMXd/HhiCKI1u09g1Yeo
	L6nwgNr2xKHlljME3r+eMGuJyLhD5e+F/7EgtHCedVrEiejIMGIDSgMyeeT4uNRvTWq5rekgYqF
	hsegcPd/IFmMyQsDC8lYQa02+02KYSlcnnssrRqNaF+ABreWApWkpsiC01zHAfbdHs4QQk70lV8
	7PWj0iRO71np1HtdyGUfOmA68g08iPVuMzD9vxxhgSZc4tBTg+vGD
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id af79cd13be357-7e3435eb5c8mr1843006085a.31.1752921155709;
        Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPks1HjgTCMsnblTK4TjsiAlwy/vjObFV82l5OdaaO+bcfhs7Bu3VSA6ZEe50HuSOATIjNgw==
X-Received: by 2002:a05:620a:4413:b0:7e3:3417:8c80 with SMTP id af79cd13be357-7e3435eb5c8mr1843003785a.31.1752921155315;
        Sat, 19 Jul 2025 03:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c226sm658791e87.85.2025.07.19.03.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 03:32:34 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:32:31 +0300
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
Subject: Re: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Message-ID: <arbdzp3r726vvfwds65cw7thcvxu2hpnwbjwdb4u2rgm4irir5@w25kvujy36kf>
References: <20250719082639.307545-1-me@brighamcampbell.com>
 <20250719082639.307545-2-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719082639.307545-2-me@brighamcampbell.com>
X-Proofpoint-GUID: vUj74kov1f3KbdJfTt50rjSlUQcfUVa7
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687b7449 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=wukD7SXyAAAA:8 a=EUspDBNiAAAA:8 a=n_CNi66bQm-mhO-RI4YA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=n7THaJik3DRP1sDdJiGm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwNSBTYWx0ZWRfX3snf+G9xmA4N
 zvWSEdsju5tt5AhYq6O4jmRGnxxl01xjtRHi/pUIi/u+KEkLrMRZeN/kH+B6f2BES0KBcZOxjed
 Zt61mvES1bvRibEu/bftd6DWZ9LG95hsXmr7om0JIxz2XXkyBcHugjN+2o0qeukGyHIF5WocKKC
 r3UTgz27g6s7VrpTnESAQFYxA+1iF2PfzTlL8vWVGQL29iwn/xfm3KwIpc9Sr38rljvxeaoVMgp
 cvvOMJHizaTIP2ytQ1PJK6MJ5DjUcLxfYwENedYabg9nEs/QhQt6KiTq1Jf1te7GP1i5i/B8mP5
 4S3iswkVPEW4x5FwuKHeaHtVcadKChB0lXW+7S0xNlxvQcpbVrQ1cDSNeF3fj+gApRY4lv3rQy/
 56DDC7dL9O/0g24M1x7K7rlux6KMf0SFemia3R/sVxE0lnWp/S7+Gij3hSNVhaIUDV97LFH7
X-Proofpoint-ORIG-GUID: vUj74kov1f3KbdJfTt50rjSlUQcfUVa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=718
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190105

On Sat, Jul 19, 2025 at 02:26:35AM -0600, Brigham Campbell wrote:
> Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
> mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
> by two parallel serial interfaces. This allows for the reduction of code
> duplication in drivers for these panels.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
> 
> mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
> included in this patch for completeness and in anticipation of its use
> in other drivers in the future.
> 
>  drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

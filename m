Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AC260590
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  1 Jul 2025 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751400517; cv=none; b=CiXD/uWlxgX9wCZpJC+3bWtAEBfp+0iNzSDW8Q+carWxykOGjSAcnNHa5Li1xLt9MfiFrVm1pe+OoqLyB39PqNkbe8em4GxxZ/j9U49FwHq4sMNmouuqVv/c4gq4g6sgAb54UO/BLhnV4JzbDWln70xnd1uokVTmH29l8XTWgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751400517; c=relaxed/simple;
	bh=znp2cAD4/It/7eAtq4iP0PqXISnc5PUwhnWNw/pCHT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahqb9+veQWBTsdGrp+SLThwverHMI+ApMYAWNfmqNOtf7+DEDiJuaIkdO2veEvxjMRlT6JlIav4e0dnppsKNDFPzWDJ9XV8Pf88X95rIkKcb+Wr8q+EVngi43KPGSTk+zCMmjfFZ6AiQTDMZcl8YLWC9W40JwmQHq0FvY2SXJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j46g3jw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j46g3jw/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561JJ8qi024889
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 1 Jul 2025 20:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=; b=j4
	6g3jw/rSNac83Vw5OqjizwBTJSGIxKQuZ7w3pnOTNCo7pLgX2acd//rDyrjkoh5V
	pspMxnT/sGf0AcrdfQIgo+/dv7Fzy0LwYZpdbRrMAmKjsL8d5t7Dee0Y3ER0UT+N
	K1MKYhKu1HeSeH8SwpdT+HImUAh1EHNxeMzhht+6jXk/xo3pJ+X9MirXq35GbTip
	sCWHaCr46ad92JHzbNIkvtOu0iGTQrrKZ1rNqtd1Y6LvztCsVfx4H+SkaiYpLimN
	2Qli46Ngn7QQ4Kb3XAiiRLrAlxoQ5kdXWUygBUHYD++4ROIObq+68LowLDDSJXr+
	xqFLh3KlAIOQc3ELh8ag==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802221p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 20:08:34 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40b0a248ce8so3445267b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 13:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751400513; x=1752005313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=;
        b=QY8OOZr2f0ryrLd8x5cvwJQWY4JLWJQk93EMOjQIZ92aY3YKtKy+Ef4YR8+BOMNNNp
         lUaEgrJiJvRBhIRSykJXIWlxkDyfwX8myxA7/q/no5wvmiQrFCIcXsT2gGhB6K0950Dw
         LnClk/8d/lkHpYM45Ebaf+0ucfTz+JBgKgRFL1hLNUFO0p25/t0+598R4otkHT4LBYkP
         ZCYCjZA/2TR+UQ95oPoZR6xCcgj264qRY7DxBSZi1JXTk+NEDSvbEugZ1fu2wdHB91cM
         mNbyBD60tdlt4FJ7XqBOcAMgVvvGKVG066ZJzNDdgZlkkUEE4q74jaf5RtnM6xnKdlY9
         iXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHyKCn2hKbCFQhiCV5ZGjs2tRLowFXfRIklFk5KnMQoCO7UeReMsBrYArCpbWcyGKKRGp6WqESr81sFFtppLWvazxBBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4g2y4mHfdxgTK7tb8KkAOMO0D3RT6sAjmvU4WrHuTW18VhQbr
	MNrJG00z8mPNzav3W+mSsGse2BWVLcFVVqMP6NcmjslyCvFIwX7HdL84meF3mvxMYmZXWqfvBWG
	/XrebaRCTtJMf2Z05+49AFz+/rIqb+sFX/VbyLgDcj9fFxw9AViiCo2PaqBEQVj6KTbasp2KrhU
	ZIAkLl5tkI5+aBN/yCr2BndIsU+VXxkuuiberm5cIjL9A8vO7iicWJ
X-Gm-Gg: ASbGnctzpmLm7cnXnLyPPneky6CY/XSueXQPeMSoZIgZjJSjMOd9X2BYaLYVA3VFR0d
	2rZDj4ncJdNrFoo91CIj8FbD9l8O2WuDWusLr9kOCLZN5t1WVmV3K/VMUPkQlcOv8HEX53rWRLB
	jnBeZ7Et7ZUU+lxxmBh4abYIr7rh+Jm9YoZdg=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id 5614622812f47-40b887a1fa4mr41100b6e.16.1751400513019;
        Tue, 01 Jul 2025 13:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTn8ar6KRE7VSflyhqGfSG2T9FoehvwwtG5pZ4XM05mL+wciurGhbrUT94vYFGe4aUoAWlNhJ+C3AxbpY9BTM=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id
 5614622812f47-40b887a1fa4mr41070b6e.16.1751400512656; Tue, 01 Jul 2025
 13:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623184734.22947-1-richard120310@gmail.com> <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
In-Reply-To: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:08:21 -0700
X-Gm-Features: Ac12FXxRhs58jxTt2spO1M6MN1lYbY9HfEItbXNYaAy8DhgQ6MfSeK4lduOTxIw
Message-ID: <CACSVV00YsGaKQZ-Tznb8maJbMih58ZRZEY_Ay3o=vtDXejOhtQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, shuah@kernel.org,
        linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: tSIQC1FI_o-dSmj1h6l7UIeFscHCQwZV
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68644042 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=6xGJIMmgAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=tHzW2L1M7Y5U8jh0s88A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=aWz6Jz32kaLdCzdWRG-w:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: tSIQC1FI_o-dSmj1h6l7UIeFscHCQwZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE0MCBTYWx0ZWRfX5gCZQP5yBKq3
 C/5EnIOgxx9BVU/UhcwVecYLo66CsXHM4vEbNh6rLbAXhUUDateJje9B3NCbfoE64ImsrZKRXR3
 FrA4m26Mlas0lMheKzYUeUE9IDz6byQ5egGunhGorpuDpY5wjzDWVrvbuBh7Q13NKJkQCN5gIkI
 9+QJcfYbl7yblHuFXRkZNKNwdCI5o9FcilDBXQd8h3V6V759LFOhOvK0XjoRo/9ew2rcXOF/f4U
 PckPLCFy7JAwSykNWwKnCwRUePwsiTYwqGW3by3btG+if62uzXkRQyQyNHge0shVFT9OkGthOIw
 UJAZy5gc1q7nUU4bFiN9lfKUtrbthEMjFvuch5eUOELQn2ajAHz8eCwS6SoZ5PtNHkdudy0wtmy
 /u2UgjdZLGOny3Mnq55lKiiuM+mgld1MAUqv23zzA6e0vkDJQ8BmfiUexj6EgFgMO0+Ci5px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010140

On Tue, Jul 1, 2025 at 12:38=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 6/23/25 12:47, I Hsin Cheng wrote:
> > According to the report of Coverity Scan [1], "sync_file" is going to b=
e
> > NULL when entering the "if" section after "out_post_unlock", so
> > "fput(sync_file->file)" is never going to be exected in this block.
> >
> > [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selecte=
dIssue=3D1655089
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index d4f71bb54e84..cba1dc6fe6c6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >   out_post_unlock:
> >       if (ret && (out_fence_fd >=3D 0)) {
> >               put_unused_fd(out_fence_fd);
> > -             if (sync_file)
> > -                     fput(sync_file->file);
>
> Are you sure you want delete these two lines? It might not make
> sense to check sync_file inside if (ret && (out_fence_fd >=3D 0)),
> but it is ncecessary to fput.

fwiw, there is at least about to be a code path where this error
handling is not dead, once the VM_BIND series is merged

BR,
-R

> >       }
> >
> >       if (!IS_ERR_OR_NULL(submit)) {
>
> Check the error paths carefully to see if this is indeed the right fix.
>
> thanks,
> -- Shuah

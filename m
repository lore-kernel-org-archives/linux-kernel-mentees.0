Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB316A397
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722887801; cv=none; b=XeNfHRi5oNd42Ih6Yey4HxBIT8H4WkQFzCugVCVRIAQ2SYUpQPOculv8URUbOPl4sPUs+er3qjT68ibcgV0NlqACii455XjNxsILwSEHh+GrXEU1S0lQexw2eiAi86Y1yTdQ5CLd2IgPkYE4Qm0m4EbWA+gmBVOF20UZSIQKBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722887801; c=relaxed/simple;
	bh=/ZrYH5OwtaoqrwpB6E205r8MAW1oQTGdjA5NF1jT7s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VigtYGsrs6JLq1Kh6EtEvd/pkn0rdt+sy+NTsVZ1iGv/KO0PoEmnkAm3w3wzWQoqtpgCthVykRzuDKWHg7BHD+8hZnewGeX1PXu/f5GWDTL8RAL9LBaQ8VQ9dgun0M2jzUc4EEU7ADLGPO2516/BVCNuGbQhFFEEv5j/S/JQ0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7Ro1KpL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7Ro1KpL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C4EA405D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 19:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqR4aP47cCHw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Aug 2024 19:56:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8682540197
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8682540197
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V7Ro1KpL
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8682540197
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  5 Aug 2024 19:56:39 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2cb52e2cb33so7110708a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 05 Aug 2024 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722887798; x=1723492598; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNcOQYN/qSiGTFD6/GPizmaarPQsywctbGl3IsVIKsA=;
        b=V7Ro1KpL578gyw4bBzVTESUpq8e/9sC9Z4vl3fI6xz6iTtBLG4A2YSc5E1JLtnU/Pu
         wpYu2eGKYT0tTd04+7e1M6Xpnb1r4fH3y31pRicuWbY2XDWc2z6m4cAOhWi+Ixnu6oxl
         dBe8ryr84W4JIC6coSOn1BJyLVEudJqGd6YI+xFHK9ppSlyLbS9BYmyGr5sZsh5tV8ro
         LW8Np/xDch/jP7l61CbC/iE5GFgMG49CN74hh14RwvtCXgJzG42DtXtybo+aJpbBNnlr
         uTDO/Ydg/wmZDj3ZLYmTdUA30amWfoyPVsVH7LvXXkrtAYJcmEg8Rw5at+8eh1oP2dNc
         RHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887798; x=1723492598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNcOQYN/qSiGTFD6/GPizmaarPQsywctbGl3IsVIKsA=;
        b=BNstdYdiQI5AG6leRXvUr0BAJx+fM/sUarQog9AXQvt30Y6wUV4nCIjqTHuLVtsrEq
         HVWXDoNvDT9Mi0HiRqIZjrp5qAkQzOutso2H54MX64zlhhMpo/WqUbv3yxajzpzrhPuI
         sjZihWsPzpm9VAB5tIFQNBHhSmtmKDR5bORvFsFFwB1Uq6leWTvCJKKMxXZD6NXOBpZx
         x3yDhlq8qoQO5H4btUOFGjrVryDW2UYkdr3rV6BaNNs4yXb4+e4UzQWZuz+0pT+VgL0d
         GJmdVB3ch7O04Tg+NEU3xzgFZtM+7o6VEANlUXyIJEexzTRdMlTANAf7mQgvot7rpRDp
         ohzw==
X-Forwarded-Encrypted: i=1; AJvYcCXY1YkugoboWyuVqr/MvJwn6VL87WInPLbcwzbQGzjmhlIsvSOingZxg/7/xFYtlRQ4lqD8KmW2OOhpgl4q0lXfHHqOQ8YXdB2bfnG+ca9DV6XYZh8XX0AkVS4fx9g/
X-Gm-Message-State: AOJu0YwhwhPvmDo+hiEW3pAlbhwzhAZ/Y0t4WxD3+uqTaLRguMpP9CB2
	NYM/S1Bz9DWPVPIxUo+eG0XejXqi1FPhX+qk1P5wIDQRrsbbK3AjRz6K19+EwGC4B0o6FmawbHv
	hkqf+Cc8h2lu18x9Tu8gE2aIvHjU=
X-Google-Smtp-Source: AGHT+IFIDXUzuaYtUVe9G/vyHgglOXHWrm+LPeM+thU3L+PG1J1Qc3F0nt0E/Bj+1GmCud756KHGJwrkq+K3mv6bPqQ=
X-Received: by 2002:a17:90a:ac8:b0:2cb:4c32:a7e4 with SMTP id
 98e67ed59e1d1-2cff943c2fbmr10837771a91.15.1722887798611; Mon, 05 Aug 2024
 12:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731055451.15467-1-rbrasga@uci.edu>
In-Reply-To: <20240731055451.15467-1-rbrasga@uci.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 15:56:27 -0400
Message-ID: <CADnq5_PxBDtk5m7c6pJX_b1fQw_ry1qGALprAZ6f5xR=9g34kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/uvd4: fix mask and shift definitions
To: Remington Brasga <rbrasga@uci.edu>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Jul 31, 2024 at 3:20=E2=80=AFAM Remington Brasga <rbrasga@uci.edu> =
wrote:
>
> A few define's are listed twice with different, incorrect values.
> This fix sets them appropriately.
>
> Signed-off-by: Remington Brasga <rbrasga@uci.edu>
> ---
> The second UVD_LMI_CTRL__RFU_MASK is incorrect, so it was removed. It sho=
uld be
> `0xf800 0000`.
> The first UVD_LMI_CTRL__RFU__SHIFT is incorrect, so it was removed.
> It should bei `0x1a`.
>
> This change aligns the uvd definitions, please refer to:
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_3_1_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_2_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_5_0_sh_mask.h
> drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_6_0_sh_mask.h
>
>  drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h b=
/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> index 8ee3149df5b7..2ef1273e65ab 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h
> @@ -340,8 +340,6 @@
>  #define UVD_LMI_CTRL__REQ_MODE_MASK 0x00000200L
>  #define UVD_LMI_CTRL__REQ_MODE__SHIFT 0x00000009
>  #define UVD_LMI_CTRL__RFU_MASK 0xf8000000L
> -#define UVD_LMI_CTRL__RFU_MASK 0xfc000000L
> -#define UVD_LMI_CTRL__RFU__SHIFT 0x0000001a
>  #define UVD_LMI_CTRL__RFU__SHIFT 0x0000001b
>  #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN_MASK 0x00200000L
>  #define UVD_LMI_CTRL__VCPU_DATA_COHERENCY_EN__SHIFT 0x00000015
> --
> 2.34.1
>

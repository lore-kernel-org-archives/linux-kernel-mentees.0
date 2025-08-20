Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA52284881
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718677; cv=none; b=ehmSa0uIQDrG2b9VV7poc5KSfzBrDzb0bX5+oateWJK9y60fRGZrrnIgOAX13kXTySp4SwmbPcOG2fB1I2x6Gd004pukIyEtOkVq95BabvfSPebU1wsFOXSsfiM2sS0wCYwyJHfK1rbHuJzKiEeKj/Ag06hoElEFWwwq/ZMfMbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718677; c=relaxed/simple;
	bh=DIGqYplhoRs1f/hcHSbYZNmTx5Ex+a8ORKp3qbixI2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7UTVDrqxVLekAB9gnbbqZ1Z1egCN1AF/fuX/51YnfuizFigcoHrHloqs8wTPr7uLrZfOXyBQQG2357/VKd6Rd0zatA6alkN9UHDdFbYc1v+ljjXxP8Sl7/OWmtQLbopBiCkVWy/LvIPwmWxH2r5EtwAcW31iqR1OfsrIDC5C6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBtgK0uy; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBtgK0uy"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FA19404A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xx3eSkCC9j4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 19:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF612403C7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF612403C7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UBtgK0uy
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF612403C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 19:37:55 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-324e3a0482dso217628a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755718675; x=1756323475; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIGqYplhoRs1f/hcHSbYZNmTx5Ex+a8ORKp3qbixI2g=;
        b=UBtgK0uyAcZph/joBl3b6KlmZSEyhC5KiB5FIDgcKZaa25OyLAOwZg/I5tf0vydGyA
         kHsAp/7h7pX5xOvtL4dncQKmy8bf/TRrqTpU3THArmvzsDQ7TyKxI74hYH+zLX5pwaBI
         nUPaXYPdiMeP7mpjcfm2ZxAmcBVEhDtW4VdQmhkgeFevyKEwqvG0R/Y5ckq5g8nuW/a7
         ARmMc6x7+0KoMHifxnLjhu5AzvHLSXu0M2vFlj6VoL5Kk2gUr6Lp2YJLGalLhweMYybR
         XLSZsfQaZH6BVCEtCXNgX9yKY4QfqhygpqbDMPVfB5uismiWNULeiKUw5AHgb8Hu7ckJ
         i6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755718675; x=1756323475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIGqYplhoRs1f/hcHSbYZNmTx5Ex+a8ORKp3qbixI2g=;
        b=S1IqHN2yP3TFPoETync2Wa5w+xJspJxxk4Ye+YVdsQVop6gxXE8LsFCCJqZ13SHB9l
         B2DvMiFh6pfiMdtpaS3PRabmS15CnyN9BhderzUittfXAb3M/8sWIs3gmb+sD33hkYux
         qylJqPeJGmcxnCBtQki/hCf09GInczzgPyzguP+2VSTSxYQDGc1v0aV9V0TBTzPy7xSZ
         JQEsOPr85rHMVP4yXgXV8atP7X4wIlo4yv1YSc7fE89NLcwNQIaUhyxig+OsxJ6WwvtT
         EEciwLSlEh0tcI/CuCBRQVZodlrypNBMAnWZlyvXrv7hPSrAF7eiSI4lWVsU/uosWiid
         rGNw==
X-Forwarded-Encrypted: i=1; AJvYcCVdSXzHJOnweVuZdYYSPO6Vy5ogjmQ47N4lb9l7qGLoh+82cYgt8ZWR0FDajrnWPC8mIBG4vVmjkob36fe/LFj6Vz+QyA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzpxUM43CJQu3cQo/E/W0iKt6cpeE693mqkSB2rk6CWnrEG1xEk
	Bu79Lv98wNNzxLUAAqF1hLxyeCB9hddKpUyt5UeEErmfz2+Sj9hMdVia
X-Gm-Gg: ASbGnctXUv8t8wdRl5bpR1DkgOrA3Yqnq+o8ZoMGUSl+EDrRNdw18z1DX7GxYBEbecA
	SLqMhGmU/iHfk26k6WkDeG/zieg0R2zZyq1uqVQo/45KlKf5ctvYAZ9lMAgyb0s0iHB2XY/9O2S
	3yx9UCYZYofQkJS+AJcpIkaMWEy0nuyBdbGYNyIZd8/3rCJ5yE9xCQx/gb2oDnLXCuXqmqLJ8A2
	9VDZOfbkVRX6EO0wA/UqzVTJEoodTylSE7zlzMSo2/cjw25quGRu9XQB4aIlQ1gNm/QrZI+aieI
	AL7vgAVMc7WuYn44PonVdVxEqmWp5rVECjzX+grcovrTHohlRicTpAnH77ArwUafYyaRwVi7PTO
	vgMopAgvVDdUTrxHzM802yy7ACvY=
X-Google-Smtp-Source: AGHT+IH4oAP6ojhRdx0McHVBEZbO37qGzzHPVXncvGS5wiZMCWye6YVPnfJGPtuh7vzBHz8DDQSRGA==
X-Received: by 2002:a17:90b:2587:b0:31c:c661:e4e with SMTP id 98e67ed59e1d1-324ed1ed238mr27715a91.33.1755718674513;
        Wed, 20 Aug 2025 12:37:54 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b191csm2911858a12.45.2025.08.20.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 12:37:54 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: alexander.deucher@amd.com
Cc: Christian.Koenig@amd.com,
	Harry.Wentland@amd.com,
	airlied@gmail.com,
	amd-gfx@lists.freedesktop.org,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	rakuram.e96@gmail.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	skhan@linuxfoundation.org,
	tzimmermann@suse.de
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
Date: Thu, 21 Aug 2025 01:07:38 +0530
Message-ID: <20250820193739.20263-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <BL1PR12MB514474E3D1951AA174431414F733A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <BL1PR12MB514474E3D1951AA174431414F733A@BL1PR12MB5144.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Got it, thank you for the guidance.

I will split this into a 2-patch series, one targeting amdgpu and one targeting drm, and send v2 accordingly.

Thanks,
Rakuram

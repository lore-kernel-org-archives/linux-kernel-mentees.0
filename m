Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07482F4A00
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759221934; cv=none; b=AnvwqtH+umtZxnmkvkNxX2aMc75gSfAlwz0uNfGKLtxvFfCzd+ASMtHtDIHxXE6DyOw3lrGoyw+Z2yesoAV1ihwJyG/0ilFl8ko9PVnwvV2jjgd6B0HOjvPQXdHeArjFJLWsc0nwR7b0KcnImMaAbFh/DBN9OS9eT2jVp8Z2qGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759221934; c=relaxed/simple;
	bh=akTONfhlc6noSXEuTwrjzlpLffmAM+CkZ+vcVOLFT7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcsyENT5MJyAkPBFqkvNpc2wRMmyUdBoht45E/e6UpJZ6k6OJ/vQ8/4Y3UGWqE0FrEnC+7H2VYJR396UgmicXMfH2oObvNT5RrDoL3fEl3vTPjYpMgZZf+qv5aCvJ4pYu9GFWSLDbxQWgnPfP/uMedhxT151UIpy2yzzGnvoxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+6xbq2f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+6xbq2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759221931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0eGafpXn10hIE2BMjDxL8LFlIDcwprmVgIo5sjkkOc=;
	b=i+6xbq2fFgxf/HJVYYXh/xXC/gmhxxjeyGftjlZQ8XZPwObaqsz+5xuQwjY/+96y0k//H8
	80TMbEEcY3QPKg0poe2bTdQV37FWBdkJD7xkHGR7xgpJMEUb0/AYx54SxWJO63fZjVsXOn
	0CwWY1yA8yAZHOBhtkA1zysWcPl266k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-r_HNGieLNDCLytt_fFLi4w-1; Tue, 30 Sep 2025 04:45:28 -0400
X-MC-Unique: r_HNGieLNDCLytt_fFLi4w-1
X-Mimecast-MFC-AGG-ID: r_HNGieLNDCLytt_fFLi4w_1759221927
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ee1365964cso3966856f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 01:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759221927; x=1759826727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0eGafpXn10hIE2BMjDxL8LFlIDcwprmVgIo5sjkkOc=;
        b=C/PVTcAMFsh45GQN944qQU+2wMGWzbscCXjAbGLz+2KlBDShmEGPkEM1jMwiyEh685
         NzdooCLr1xaYiGrl/vP+DP3d7vyOmMaBSEh5CMGeyFlhV8ubvk/L9itDEr2R/GVKgbLx
         UgtPzLcCNKNjMAhM2WDUA/lygyer/HYqTCDQoVKX5wAXt0P6oBsuxHyOpXsDG5KCx34O
         XTI5bT6ePkjEAsjZFRpqQ+tupS5nk62GqRDzjqZRBZT4IPuhyl9ALH8Fgl8VbdCqxvni
         fhCSqNuTcJn/LvmSnHNHAXyDKm6OafnSRyUSz7kqE1YPDodz7pSTtv1EKjHZJ8Hkxkzl
         qiXg==
X-Forwarded-Encrypted: i=1; AJvYcCWgTvwo8argdy7jO8ZgNiQIy2ROeogTWCtqJVDv1iF2X+ld1Tni5XPI1wxrjnbTb4hRJ2mVUb36XgvOf1cMinVXikWH8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhUbnbTTnafie1wkAcN6jjCN+xmYlvcEze/QsONyDWmiGG/WtZ
	KDl+yfZoms4opV3UaCMmjSZvevKD3Zoa59tABEsvCErS9sy0UEgXJ4G3qF4UKaz8OMoqAQ9Tnvk
	45Ij1Z3lCm8MJRkrq/gw0ak1Ln90UfbhfSQ2j1Lg1sWDSoB/+LOtj21kUp14jIf8z8isJMaeO5O
	5j
X-Gm-Gg: ASbGncu34N0g6xJgHdsTU/H1DDBhMvdtoQDIOyIDEXkVuBJt3r/hZYj913wCOXRmcbp
	K5S2f0LeZmllskeiWHOUC51BbDB9R8YVog673Po7bdmS0FHpDGl34ivdNqGIPcOxx2xguVp/BJG
	sLIe5lRhxUBH8B13iCyqDZS98adDnZNJKQE9aRL95eCkzb3/bbDHIkJCG/AbADA30nIJbong5h1
	HpcSY5K6svRFLw+n6P6pXQO/rqJ3vqpDHY7jL7M+Ci2AZBieD1vvavkL8jssJlQTlQn4DNx9Erb
	h7oi7CnyyQU/XD0+V1onTyKNifBdbgMzCz48/BYvVVnT5THMo9XfnJd4i/arkupGe9Z5cXnCC3q
	36/LzeIreceGXnU4GPQ==
X-Received: by 2002:a05:6000:288a:b0:3ea:c893:95c6 with SMTP id ffacd0b85a97d-40e43b08daemr16176951f8f.18.1759221926873;
        Tue, 30 Sep 2025 01:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRKeCg7YnGTHgNrPoON/pDG0wzo+V+MgKB/0TsB17QowrUPCybnWt3H7zBthCuTUQFXwPeXQ==
X-Received: by 2002:a05:6000:288a:b0:3ea:c893:95c6 with SMTP id ffacd0b85a97d-40e43b08daemr16176925f8f.18.1759221926486;
        Tue, 30 Sep 2025 01:45:26 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc7e2bf35sm21915958f8f.53.2025.09.30.01.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:45:25 -0700 (PDT)
Message-ID: <54234daf-ace1-4369-baea-eab94fcea74b@redhat.com>
Date: Tue, 30 Sep 2025 10:45:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] atm: Fix the cleanup on alloc_mpc failure in
 atm_mpoa_mpoad_attach
To: Deepak Sharma <deepak.sharma.472935@gmail.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org, pwn9uin@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 skhan@linuxfoundation.org,
 syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com,
 syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
References: <20250925204251.232473-1-deepak.sharma.472935@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250925204251.232473-1-deepak.sharma.472935@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 71gd6db4l81gTXnJnSWB0JFFd27BJwhGcdwqBuDVVMQ_1759221927
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/25 10:42 PM, Deepak Sharma wrote:
> diff --git a/net/atm/mpc.c b/net/atm/mpc.c
> index f6b447bba329..4f67ad1d6bef 100644
> --- a/net/atm/mpc.c
> +++ b/net/atm/mpc.c
> @@ -804,7 +804,7 @@ static int atm_mpoa_mpoad_attach(struct atm_vcc *vcc, int arg)
>  		/* This lets us now how our LECs are doing */
>  		err = register_netdevice_notifier(&mpoa_notifier);
>  		if (err < 0) {
> -			timer_delete(&mpc_timer);
> +			timer_delete_sync(&mpc_timer);

AFAICS the mpc_timer can rearm itself, so this the above is not enough
and you should use timer_shutdown_sync() instead.

Thanks,

Paolo


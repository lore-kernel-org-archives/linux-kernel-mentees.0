Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D03043C8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242674; cv=none; b=T2Tu17DW035whY6KUVPsq8T9Q9IBCuzLeV4ZCvcWkQYX16ChgteVku0PfjZMyBSglbJsrRxjOx3nNektP3wyhs1PyIDuqwhZ0pi/WzWlfu1KGLoOdF/r4N4qppN//g3ghyDV1nDtiqED8bUkPTHk0ijHIemBNfru4EVcFBdD/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242674; c=relaxed/simple;
	bh=TxtdYZk9dsFJydGVO6ymBCi05gQcE0LcJqQYcYklqBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JziaUm/RqH6GoseXUQsihGczNcD+i2FseTKXIoxGZbsulW0GGwU6XaG6Ry6txHfi+Eeoa436pa1MYoce3tk539YZ5S0Wz7JRyuYykscdMDkiRKNv+b65zsGf/Gwq8r3WCm+GRIOGuS5LBkW0boX9kQTbAN8/g0jpgn1krD0UVIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKaaolRj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKaaolRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759242671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KiimNVQCGI88ieZh8p4IJZ/Sr9pCyj861BQTbYqy/Tk=;
	b=hKaaolRj+Pin/i+WeBr4rG4SPF7TqK7dnaomINVD/bLwwAT6rd6erte6StBoWI++hr8LVl
	ndm6sgoWDtMepgtUKMPaB3H0b56k8mWyPMA7jyQD+8vlI8IqfIRhQgXTYQnpmZGCdH9wFa
	6XAnugV8CCkL2864wO+/H/PNsCGHmc4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-JFFOfQwxPR2JQBthm0OAAg-1; Tue, 30 Sep 2025 10:31:07 -0400
X-MC-Unique: JFFOfQwxPR2JQBthm0OAAg-1
X-Mimecast-MFC-AGG-ID: JFFOfQwxPR2JQBthm0OAAg_1759242665
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e4943d713so22730885e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Sep 2025 07:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242665; x=1759847465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiimNVQCGI88ieZh8p4IJZ/Sr9pCyj861BQTbYqy/Tk=;
        b=TT3YCD7VpDPspbtXlN5i5CQhlQbwqgHHTPDgQhLnfYeV6N92oDyygD0tnne91OTVFY
         QZ1ELSvRzQPkHbJ8TqVfiCBNan9KWtPlMlS/3G3ukzjHFT8j+0VR2YQ50WF4uj+bkN6U
         EmFcZdIT64mCJPvVoGalwxB6gE5uyih8rDsFZid4nAweNQUdPrc49UX69n587/zZVl5d
         jik3Th6TzeaKKyk5fk+qiwFiZYVCxqYCLbuir9rCtn6vC3qvC/YnHghQgnAHGFPsNOv5
         X6c+r69okQ75m7JvkV56X8ZhcaYhC2FVI2ts7B6OIVMXaim+0w+OWc0RQUOz1PrKE3rR
         5pLg==
X-Forwarded-Encrypted: i=1; AJvYcCWnEdtT+MPIM1alrJb9inPHHjo/m+ulgoPo5Ntdemus4NJYi2Gstn1QJR8zonWpT4S/tnrntYo4OBJK2YmOrJC6YENPiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/07SeUmrHG2EdBPRv+AH3nVBwqRNkUg//HYDRDLXNySFUePXL
	VbKf8s5jniBUdxefor//kv0W6p/dXLAfvRYz0bCt2EW8eW0gEeB4DaCTuTNPckIyaoqU4nwG4oi
	tOY/01llpJXgAf2ima9xOpmiPKvWd7FO4PN+WwRM82zITbxHM10niwEwjZrG795XdH+lsBYgxv6
	pA
X-Gm-Gg: ASbGncuZ/T10M9aGfXmpCELFYJUNaaFJusTQG4Jc+L4VPHH5r1T9J+Ldo05O9cXqb4V
	p6v1kmOJY3tDAYds3PHYhkCEeI/xKTfnCkEDywXA5d7oUXv4Y6lG1iLeImuKCMfy6COa50C32Zf
	kgptyDOR4Wpk0Ct4xNvKxNC/H54NcaZ4bWM4HAIZ6ingiAuyFbucE6A33moq0qMMXCl7mTBuHBK
	pUwR2Jv4XIHou0/VyfOG16CIADh2WqgHvmBjVrsn5g1F6vqLRjnzzxnkCLfWqa3biclsU5+Ie+L
	LOfxfNn0aTKRTCG4AV+IkWm/W97sdzYgciA4w6KhW3sQHX28HwyeBROnhagzKIygrtldKb7nBVN
	JeR1ISN6PmPUU+C0G2A==
X-Received: by 2002:a05:600c:8b55:b0:46e:45ff:5bdb with SMTP id 5b1f17b1804b1-46e6120218cmr1302125e9.8.1759242664805;
        Tue, 30 Sep 2025 07:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjdt+VONnfPWja9/VsLbNc3mnehERm9krtPABV0fyuDy+ajxw8o2r9+1p0b6nLCu4FSG8KQ==
X-Received: by 2002:a05:600c:8b55:b0:46e:45ff:5bdb with SMTP id 5b1f17b1804b1-46e6120218cmr1301575e9.8.1759242664074;
        Tue, 30 Sep 2025 07:31:04 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3dc27sm68198535e9.5.2025.09.30.07.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:31:03 -0700 (PDT)
Message-ID: <377697dd-15bc-4a2d-be19-1d136adb351c@redhat.com>
Date: Tue, 30 Sep 2025 16:31:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] atm: Fix the cleanup on alloc_mpc failure in
 atm_mpoa_mpoad_attach
To: Deepak Sharma <deepak.sharma.472935@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, pwn9uin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
 syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com,
 syzbot+07b635b9c111c566af8b@syzkaller.appspotmail.com
References: <20250925204251.232473-1-deepak.sharma.472935@gmail.com>
 <54234daf-ace1-4369-baea-eab94fcea74b@redhat.com>
 <CABbzaOUQC_nshtuZaNJk48JiuYOY0pPxK9i3fW=SsTsFM1Sk9w@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CABbzaOUQC_nshtuZaNJk48JiuYOY0pPxK9i3fW=SsTsFM1Sk9w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rzjmAVLktT_z_LTOe6zI02feh46XBRnXxy8MRXTj5Pg_1759242665
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/30/25 3:33 PM, Deepak Sharma wrote:
> On Tue, Sep 30, 2025 at 2:15 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> AFAICS the mpc_timer can rearm itself, so this the above is not enough
>> and you should use timer_shutdown_sync() instead.
> 
> Hi,
> 
> As I understand it, `timer_shutdown_sync` will prevent any further
> re-arming of the timer. I think this is not what we want here; since even if
> we somehow fail to allocate our first MPOA client object on our first
> ioctl call,
> and hence end up wanting to disarm the timer, maybe on next call we can
> allocate it successfully, and we would want that caches are processed
> (which are processed for every time out). So we still want it to be
> possible that
> we can re-arm it.

Ah, I missed the goal here is just being able to rearm the timer (i.e.
there is no related UaF).

Given the above, I think you could instead simply replace add_timer()
with mod_timer().

/P


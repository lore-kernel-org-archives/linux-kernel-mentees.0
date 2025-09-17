Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2968927E070
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758106152; cv=none; b=N2fEpPfrT3NO2BrGngIbkqM4e575OXbBj6yHwri5N25IrWezRgRrOiNWeEDEOD8rpJNclgJJmQuPJcl3vxGue4PZxqw79e7AYqAt61NqeSgXyfAEzlfq9f3KHWDVY2blac2Ar0ckvlkwJWDsb/+Eeo3Pk4ZQLRd4ljweK9UZkGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758106152; c=relaxed/simple;
	bh=/Is+QhC1ppKcBnEuR82I+wnYLqHDhOXEU1Sx8//I0FU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pHxnzK21wH75X+/B9jaaK1a45NQ3bz6D60/ZNnM6q+VlKwVdghVeJY5ijSG/D98hA5pknM7Nhw/V2GL8lY0i4xa4/ild95L6K4XZJ87KhhNrFO8CO3YvQXpUrfwbA0Yh6ublOCNGyPI2/teDtC7M0caS1x+UNKEt6v6bymgsGDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfgNnxfw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfgNnxfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758106150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Gx+TdCKsbhxyY3jdn0KEhYYDqelpsIcgLkEZzRgBNo=;
	b=TfgNnxfwWm00Y4mOLgHNA22tCdWgRrd341EWF3Ajd9ZioCoFwUrAC7oklNtxMkWGx1H+RM
	UthaKbiBJRbKa+d8MbY6VAdYsJr95P857zC88cL+/cXaheJmWjksZIjjlHMMEWNq17LN0Q
	6ETkZaU5zQTuRl0Yz3SUxcSpcwMaRog=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-fXMhjKrbNt2_K4NjpZ4WHw-1; Wed, 17 Sep 2025 06:49:07 -0400
X-MC-Unique: fXMhjKrbNt2_K4NjpZ4WHw-1
X-Mimecast-MFC-AGG-ID: fXMhjKrbNt2_K4NjpZ4WHw_1758106146
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45dd66e1971so53582435e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 03:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758106146; x=1758710946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Gx+TdCKsbhxyY3jdn0KEhYYDqelpsIcgLkEZzRgBNo=;
        b=q2hOOnY5rZEImc1jjb2VMaCvCjWk6yqIwBmjkOHDCw0phgTQYrSBVDgUfIYGQ8eZHb
         KgNAZjfUM1WmY6i3VRbL2uPwexCJsVMuf6+H8lCiBpIAoYZ1ra4hj1UMQNeigv4w0fYV
         CGbb9TSC16oCjZzohY1iKb52iMFXiiU4m8/XgMtIli/UM+RmU+NbZ5EUrX/T6MB2NrCj
         kzV54IgwWGwVQWXXEVfJ8YwH6oUrbUU9dy29IpgFwdpAG6hmfg9VCUCxZ58407kHZd5n
         Oj7ubQgzv+zP0w3SQFigYetE9p0HCS2mq0HRhPGtOQ8XwxgbfIXuNpSccLpKgCE9/Ujx
         Daww==
X-Forwarded-Encrypted: i=1; AJvYcCXXtr4gRVpm8jMdw9SuI1UYahzyFccSb0r+rkUulYa8npoyj8mVNIWCkrrY/UlEa4Bf417eBaaMgwlTBboXIRhfG7ucQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQQtYC652rXjiGbdTT9z55Skk9xnlDJbvek6cH09K3dPJfvlj1
	Nzm3zXg5PI0zwk+qclIHifx7kljuSCrp9KAYlDiSEoGpLp3tCzaYApxkONxxkfkPfxEItxFCcmW
	3SbTaZByiIBndBCzLAVmcZLUvJtb42Ux5GnM6ttSTqdkv1LaOpecLS/lZ10fPVqeABzj6ae/J/f
	lD
X-Gm-Gg: ASbGncsu6a47axDo5zwSWs9Q1wJboD5iFdyCXo/GSEW/q00dYMiUlYXirGLDcEuySdT
	3hjYDqvMHqY+ySkrPxRhVb6a5K4ecJdxYRdDI/LkpEcDru9qvpzQcJMN/NbvmhftNYibYggDXX6
	hyHdMkSYLTWV2eOst8ynKdFEJv6a2uh7HGY0IjhlEffbqEKZemizEzEgtaBxBTU5/D/bQuemPMt
	vx0+k5OScYE9+aw2qn6x529uUE04vzJMQ1lyTElDvQpZDrs7YBJ3s1NCql4f1wC17ImnBgZRCxO
	6Q7dvlqXxPoRyMkmGs3zD2HSAPrkwloIdzY9o9eW3eiQ24Z8lHFgTn3qyxjdmZg4+3pRH/vIeBl
	WzshaDROa08aXrq3A+yQscg==
X-Received: by 2002:a05:6000:420a:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-3ecdfa2af44mr1788144f8f.45.1758106145849;
        Wed, 17 Sep 2025 03:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWDibHsRXwK4fNY6Iro6utVUGE4L1K31z5iDT3jS0cDkRWw/GZJYpDVS83FdGh12iI5IMZeA==
X-Received: by 2002:a05:6000:420a:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-3ecdfa2af44mr1788111f8f.45.1758106145366;
        Wed, 17 Sep 2025 03:49:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607870cfsm26394071f8f.19.2025.09.17.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:49:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: James Flowers <bold.zone2373@fastmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250914073841.69582-1-bold.zone2373@fastmail.com>
References: <20250914073841.69582-1-bold.zone2373@fastmail.com>
Date: Wed, 17 Sep 2025 12:49:03 +0200
Message-ID: <871po54an4.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2SAIM3CVcEUooaUB3ukzmNvpjxMMs3W9vs4nnvnEH7g_1758106146
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

James Flowers <bold.zone2373@fastmail.com> writes:

> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
> kmalloc_array avoids this issue.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

